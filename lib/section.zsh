#!/usr/bin/env zsh
# vim:ft=zsh ts=2 sw=2 sts=2 et fenc=utf-8
# Internal variable for checking if prompt is opened
spaceship_prompt_opened="$SPACESHIP_PROMPT_FIRST_PREFIX_SHOW"

# Global section cache
typeset -gAh __ss_section_cache

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

#   Takes the result of the sections computation and echos it,
#   so that ZSH-Async can grab it.
##
# @args
#   $1 string The command to execute
#   $* Parameters for the command
##
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

  local -a alignments=("left" "right")
  local sections_var
  local -a sections
  local section_content

  [[ -n $1 ]] && alignments=("$1")

  for alignment in "${alignments[@]}"; do
    if [[ $alignment == "left" ]]; then
      sections_var="SPACESHIP_PROMPT_ORDER"
    else
      sections_var="SPACESHIP_RPROMPT_ORDER"
    fi
    sections=(${(P)sections_var})
    [[ ${#sections} == "0" ]] && continue

    local index=1
    local raw_section async
    for raw_section in "${(@)sections}"; do
      # Cut off after double colon
      local section="${raw_section%%::*}"

      # spaceship::section_is_tagged_as "joined" "${section}" && joined=true || joined=false

      local async=false
      spaceship::section_is_tagged_as "async" "${section}" && async=true

      local cache_key="${alignment}::${index}"

      if ${async}; then
        async_job "spaceship_async_worker" "spaceship::async_wrapper" "spaceship_${section}" "${section}·|·${alignment}·|·${index}"

        # Placeholder
        __ss_section_cache["${cache_key}"]="${section}·|·${alignment}·|·${index}·|·"
      else
        # TODO: Skip computation if cache is fresh for some sections?
        # keep newline from line_sep section, https://unix.stackexchange.com/a/383411/246718
        IFS= read -rd '' section_content < <(spaceship_${section})
        __ss_section_cache["${cache_key}"]="${section}·|·${alignment}·|·${index}·|·${section_content}"
      fi

    index=$((index + 1))
    done
  done

  # set -x
  # for data in "${(Oa@v)__ss_section_cache}"; do echo "$data"; done
  # set +x

  spaceship::render
}

# Refresh a single item in the cache
#
# @args
#   $1 string The serialized section data
function spaceship::refresh_cache_item() {
  # TODO: split according to ...
  local -a section_meta=("${(@s:·|·:)1}")

  __p9k_section_cache["${section_meta[2]}::${section_meta[3]}"]="${1}"
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

  # ignore the async evals used to alter worker environment
  if [[ "${job}" == "[async/eval]" ]] || \
     [[ "${job}" == ";" ]] || \
     [[ "${job}" == "[async]" ]]; then
    return
  fi

  # exit early, if $output is empty
  if [[ -z "$output" ]]; then
    return
  fi

  # split ${output} into an array - see https://unix.stackexchange.com/a/28873
  local section_meta=("${(@s:·|·:)output}") # split on delimiter "·|·" (@s:<delim>:)
  local cache_key="${section_meta[2]}::${section_meta[3]}"
  __ss_section_cache["${cache_key}"]="${output}"

  # Trigger re-rendering if we do not wait for other jobs
  [[ "$has_next" == "0" ]] && spaceship::render "true"
}

# Spaceship Render function.
# Goes through cache and renders each entry.
#
# @args
#   $1 - boolean True if rendered through ZLE widget (in async mode)
spaceship::render() {
  # Resets
  PROMPT=''
  RPROMPT=''
  # __ss_unsafe must be a global variable, because we set
  # PROMPT='$__ss_unsafe[left]', so without letting ZSH
  # expand this value (single quotes). This is a workaround
  # to avoid double expansion of the contents of the PROMPT.
  typeset -gAh __ss_unsafe=()

  # Process Cache
  # TODO: choose a more stable method to iterate array based on index
  for data in "${(Oa@v)__ss_section_cache}"; do
    [[ -z "${data}" ]] && continue

    local -a section_meta=("${(@s:·|·:)data}")
    [[ -z "${section_meta[4]}" ]] && continue # Sections should not be printed

    local alignment="${section_meta[2]}"
    if [[ "$alignment" == "left" ]]; then
      __ss_unsafe[left]+="${section_meta[4]}"
    elif [[ "$alignment" == "right" ]]; then
      __ss_unsafe[right]+="${section_meta[4]}"
    fi
  done

  [[ "${#SPACESHIP_RPROMPT_ORDER}" != "0" ]] \
    && RPROMPT='${__ss_unsafe[right]}'

  # Allow iTerm integration to work
  [[ "${ITERM_SHELL_INTEGRATION_INSTALLED:-}" == "Yes" ]] \
    && __ss_unsafe[left]="%{$(iterm2_prompt_mark)%}${__ss_unsafe[left]}"

local NEWLINE='
'

  [[ "$SPACESHIP_PROMPT_ADD_NEWLINE" == true ]] \
    && __ss_unsafe[left]="$NEWLINE${__ss_unsafe[left]}"

  # By evaluating $__ss_unsafe[left] here in __ss_render we avoid
  # the evaluation of $PROMPT being interrupted.
  # For security $PROMPT is never set directly. This way the prompt render is
  # forced to evaluate the variable and the contents of $__ss_unsafe[left]
  # are never executed. The same applies to $RPROMPT.
  PROMPT='${__ss_unsafe[left]}'

  # About .reset-promt see:
  # https://github.com/sorin-ionescu/prezto/issues/1026
  # https://github.com/zsh-users/zsh-autosuggestions/issues/107#issuecomment-183824034
  [[ "${1}" == "true" ]] && zle .reset-prompt && zle -R
}

# PROMPT
# Primary (left) prompt
spaceship_prompt() {
  # Retrieve exit code of last command to use in exit_code
  # Must be captured before any other command in prompt is executed
  # Must be the very first line in all entry prompt functions, or the value
  # will be overridden by a different command execution - do not move this line!
  RETVAL=$?

  # Should it add a new line before the prompt?
  [[ $SPACESHIP_PROMPT_ADD_NEWLINE == true ]] && echo -n "$NEWLINE"
  spaceship::compose_prompt "left"
}

# $RPROMPT
# Optional (right) prompt
spaceship_rprompt() {
  # Retrieve exit code of last command to use in exit_code
  RETVAL=$?

  spaceship::compose_prompt "right"
}

# PS2
# Continuation interactive prompt
spaceship_ps2() {
  # Retrieve exit code of last command to use in exit_code
  RETVAL=$?

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

  # run vcs_info hook ahead of the spaceship::prepare_prompt hook
  autoload -Uz vcs_info
  # Configure vcs_info helper for potential use in the future
  add-zsh-hook precmd spaceship_exec_vcs_info_precmd_hook
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats '%b'

  add-zsh-hook precmd spaceship::prepare_prompts

  # hook into chpwd for bindkey support
  chpwd_functions=("${chpwd_functions[@]}" "spaceship::chpwd_hook")

  # Disable python virtualenv environment prompt prefix
  VIRTUAL_ENV_DISABLE_PROMPT=true

  # TODO: fix, or remove PS2
  # # Expose Spaceship to environment variables
  # PROMPT='$(spaceship_prompt)'
  # PS2='$(spaceship_ps2)'
  # RPS1='$(spaceship_rprompt)'
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