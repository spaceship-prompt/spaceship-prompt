#!/usr/bin/env zsh
# vim:ft=zsh ts=2 sw=2 sts=2 et fenc=utf-8

# Internal variable for checking if prompt is opened
spaceship_prompt_opened="$SPACESHIP_PROMPT_FIRST_PREFIX_SHOW"

# Global section cache
typeset -gAh __ss_section_cache

# __ss_unsafe must be a global variable, because we set
# PROMPT='$__ss_unsafe[left]', so without letting ZSH
# expand this value (single quotes). This is a workaround
# to avoid double expansion of the contents of the PROMPT.
typeset -gAh __ss_unsafe=()

# Draw prompt section (bold is used as default)
# USAGE:
#   spaceship::section <color> [prefix] <content> [suffix]
spaceship::section() {
  local color prefix content suffix
  [[ -n $1 ]] && color="%F{$1}"  || color="%f"
  [[ -n $2 ]] && prefix="$2"     || prefix=""
  [[ -n $3 ]] && content="$3"    || content=""
  [[ -n $4 ]] && suffix="$4"     || suffix=""

  [[ -z $3 && -z $4 ]] && content=$2 prefix=''

  local result=""

  result+="%{%B%}" # set bold
  if [[ $spaceship_prompt_opened == true ]] && [[ $SPACESHIP_PROMPT_PREFIXES_SHOW == true ]]; then
    restult+="$prefix"
  fi
  spaceship_prompt_opened=true
  result+="%{%b%}" # unset bold

  result+="%{%B$color%}" # set color
  result+="$content"     # section content
  result+="%{%b%f%}"     # unset color

  result+="%{%B%}" # reset bold, if it was diabled before
  if [[ $SPACESHIP_PROMPT_SUFFIXES_SHOW == true ]]; then
    result+="$suffix"
  fi
  result+="%{%b%}" # unset bold

  echo -n "$result"
}

# Takes the result of the sections computation and echos it,
# so that ZSH-Async can grab it.
#
# @args
#   $1 string The command to execute
#   $* Parameters for the command
spaceship::async_wrapper() {
  local command="$1"

  echo -n "${2}·|·"

  shift 1
  ${command} "$@"
}

# Compose whole prompt from sections
# @description
#   This function loops through the prompt elements and calls
#   the related section functions.
#
# @args
#   $1 string left|right
spaceship::compose_prompt() {
  # Option EXTENDED_GLOB is set locally to force filename generation on
  # argument to conditions, i.e. allow usage of explicit glob qualifier (#q).
  # See the description of filename generation in
  # http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
  setopt EXTENDED_GLOB LOCAL_OPTIONS

  local -a alignments=("prompt" "rprompt")
  local sections_var
  local -a sections
  local custom async raw_section section section_content cache_key
  local index

  [[ -n $1 ]] && alignments=("$1")

  for alignment in "${alignments[@]}"; do
    sections_var="SPACESHIP_${(U)alignment}_ORDER"
    sections=(${(P)sections_var})
    [[ ${#sections} == "0" ]] && continue

    index=1
    for raw_section in "${(@)sections}"; do
      # Cut off after double colon
      section="${raw_section%%::*}"

      # TODO: custom tag support
      # spaceship::section_is_tagged_as "custom" "${section}" && joined=custom || joined=custom

      spaceship::section_is_tagged_as "async" "${section}" && async=true || async=false

      cache_key="${alignment}::${section}"

      if ${async}; then
        async_job "spaceship_async_worker" "spaceship::async_wrapper" "spaceship_${section}" "${section}·|·${alignment}·|·${index}"

        # Placeholder
        __ss_section_cache[${cache_key}]="${section}·|·${alignment}·|·${index}·|·${SPACESHIP_SECTION_PLACEHOLDER}"
      else
        # TODO: Skip computation if cache is fresh for some sections?
        # keep newline from line_sep section, https://unix.stackexchange.com/a/383411/246718
        IFS= read -rd '' section_content < <(spaceship_${section})
        __ss_section_cache[${cache_key}]="${section}·|·${alignment}·|·${index}·|·${section_content}"
      fi

    index=$((index + 1))
    done
  done

  if [[ ${#alignments} == "2" ]]; then
    spaceship::render
  else
    # only render the corresponding side of the prompt
    spaceship::render "${alignment[1]}"
  fi
}

# Refresh a single item in the cache, and redraw the prompt
#
# @args
#   $1 - section name
#   $2 - boolean true if render the prompt after cache update
function spaceship::refresh_cache_item() {
  [[ -z $1 ]] && return 1

  local section="$1"
  local alignment
  local -a prompt_sections=(${=__SS_DATA[prompt_sections]:-})
  local -a rprompt_sections=(${=__SS_DATA[rprompt_sections]:-})
  local cache section_content

  if (( ${prompt_sections[(Ie)${section}]} )); then
    alignment="prompt"
  elif (( ${rprompt_sections[(Ie)${section}]} )); then
    alignment="rprompt"
  else
    # Unavailable section name
    return 1
  fi

  spaceship::section_is_tagged_as "async" "${section}" && async=true || async=false

  cache_key="${alignment}::${section}"

  if ${async}; then
    async_job "spaceship_async_worker" "spaceship::async_wrapper" "spaceship_${section}" "${section}·|·${alignment}·|·${index}"
    # Placeholder
    __ss_section_cache[${cache_key}]="${section}·|·${alignment}·|·${index}·|·"
  else
    # keep newline from line_sep section, https://unix.stackexchange.com/a/383411/246718
    IFS= read -rd '' section_content < <(spaceship_${section})
    __ss_section_cache[${cache_key}]="${section}·|·${alignment}·|·${index}·|·${section_content}"

    [[ $2 == "true" ]] && spaceship::render "$alignment"
  fi
}

# Exchange result of prompt_<section> function in the cache and
# trigger re-rendering of prompt.
#
# @args
#   # $1 job name, e.g. the function passed to async_job
#   $2 return code
#   $3 resulting (stdout) output from job execution
#   $4 execution time, floating point e.g. 0.0076138973 seconds
#   $5 resulting (stderr) error output from job execution
#   $6 has next result in buffer (0 = buffer empty, 1 = yes)
spaceship::async_callback() {
  local job="$1" ret="$2" output="$3" exec_time="$4" err="$5" has_next="$6"
  local section_meta cache_key

  # ignore the async evals used to alter worker environment
  if [[ "${job}" == "[async/eval]" ]] || \
     [[ "${job}" == ";" ]] || \
     [[ "${job}" == "[async]" ]]; then
    return
  fi

  # If async_job exits early, we still rerender the prompt.
  # Cause we need to replace the placeholder with an empty string.
  # [[ -z "$output" ]] && return

  # split input $output into an array - see https://unix.stackexchange.com/a/28873
  section_meta=("${(@s:·|·:)output}") # split on delimiter "·|·" (@s:<delim>:)
  cache_key="${section_meta[2]}::${section_meta[1]}"
  __ss_section_cache[${cache_key}]="${output}"

  # Trigger re-rendering if we do not wait for other jobs
  [[ "$has_next" == "0" ]] && spaceship::async_render
}

# Spaceship Render function.
# Goes through cache and renders each entry.
#
# @args
#   $1 - prompt/rprompt
spaceship::render() {
  local -a alignments=("prompt" "rprompt")
  local alignment raw_section section cache_key
  local -a section_meta

  [[ -n $1 ]] && alignments=("$1")

  for alignment in "${alignments[@]}"; do
    # Process Cache
    sections_var="SPACESHIP_${(U)alignment}_ORDER"
    sections=(${(P)sections_var})
    [[ ${#sections} == "0" ]] && continue

    # Reset prompt storage
    __ss_unsafe[$alignment]=""

    for raw_section in "${(@)sections}"; do
      # Cut off after double colon
      section="${raw_section%%::*}"

      cache_key="${alignment}::${section}"
      section_meta=("${(@s:·|·:)${__ss_section_cache[$cache_key]}}")

      # [[ -z "${section_meta[4]}" ]] && continue # Skip if section is empty

      __ss_unsafe[$alignment]+="${section_meta[4]}"
    done

    # left/right specific
    if [[ $alignment == "prompt" ]]; then
      # Allow iTerm integration to work
      [[ "${ITERM_SHELL_INTEGRATION_INSTALLED:-}" == "Yes" ]] \
        && __ss_unsafe[prompt]="%{$(iterm2_prompt_mark)%}${__ss_unsafe[prompt]}"

      local NEWLINE=$'\n'

      [[ "$SPACESHIP_PROMPT_ADD_NEWLINE" == true ]] \
        && __ss_unsafe[prompt]="$NEWLINE${__ss_unsafe[prompt]}"

      # By evaluating $__ss_unsafe[prompt] here in __ss_render we avoid
      # the evaluation of $PROMPT being interrupted.
      # For security $PROMPT is never set directly. This way the prompt render is
      # forced to evaluate the variable and the contents of $__ss_unsafe[prompt]
      # are never executed. The same applies to $RPROMPT.
      PROMPT='${__ss_unsafe[prompt]}'
    else
      RPROMPT='${__ss_unsafe[rprompt]}'
    fi
  done
}

spaceship::async_render() {
  spaceship::render "$@"

  # .reset-prompt: bypass the zsh-syntax-highlighting wrapper
  # https://github.com/sorin-ionescu/prezto/issues/1026
  # https://github.com/zsh-users/zsh-autosuggestions/issues/107#issuecomment-183824034
  zle .reset-prompt && zle -R
}

# PS2
# Continuation interactive prompt
spaceship_ps2() {
  local char="${SPACESHIP_CHAR_SYMBOL_SECONDARY="$SPACESHIP_CHAR_SYMBOL"}"
  spaceship::section "$SPACESHIP_CHAR_COLOR_SECONDARY" "$char"
}

# ------------------------------------------------------------------------------
# SETUP
# Setup requirements for prompt
# ------------------------------------------------------------------------------

# Runs once when user opens a terminal
# All preparation before drawing prompt should be done here
prompt_spaceship_setup() {
  # This variable is a magic variable used when loading themes with zsh's prompt
  # function. It will ensure the proper prompt options are set.
  prompt_opts=(cr percent sp subst)

  # Borrowed from promptinit, sets the prompt options in case the prompt was not
  # initialized via promptinit.
  setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"

  # TODO: not sure if we need these modules borrowed from powerlevel9k
  # initialize colors
  autoload -U colors && colors

  # initialize timing functions
  zmodload zsh/datetime

  # Initialize math functions
  zmodload zsh/mathfunc

  # initialize hooks
  autoload -Uz add-zsh-hook

  # Add exec_time hooks
  add-zsh-hook preexec spaceship_exec_time_preexec_hook

  # TODO: merge vcs hook into hook spaceshp::prepare_prompt?
  # Run vcs_info hook AHEAD of the spaceship::prepare_prompt hook
  autoload -Uz vcs_info
  # Configure vcs_info helper for potential use in the future
  add-zsh-hook precmd spaceship_exec_vcs_info_precmd_hook
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats '%b'

  add-zsh-hook precmd spaceship::prepare_prompts

  # hook into chpwd for bindkey support
  add-zsh-hook chpwd spaceship::chpwd_hook

  # Disable python virtualenv environment prompt prefix
  VIRTUAL_ENV_DISABLE_PROMPT=true

  # Expose Spaceship to environment variables
  PS2='$(spaceship_ps2)'
}

# This function removes spaceship hooks and resets the prompts.
prompt_spaceship_teardown() {
  add-zsh-hook -D precmd spaceship\*
  add-zsh-hook -D preexec spaceship\*
  # unhook from chpwd
  chpwd_functions=( "${chpwd_functions[@]//spaceship::chpwd_hook/}" )
  PROMPT='%m%# '
  RPROMPT=
}