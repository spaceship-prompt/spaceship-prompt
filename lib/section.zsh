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

  local is_prompt_open=$(spaceship::get_cache open)

  echo -n "%{%B%}" # set bold
  if [[ $is_prompt_open == true ]] && [[ $SPACESHIP_PROMPT_PREFIXES_SHOW == true ]]; then
    echo -n "$prefix"
  fi
  echo -n "%{%b%}" # unset bold

  spaceship::set_cache open "true"

  echo -n "%{%B$color%}" # set color
  echo -n "$content"     # section content
  echo -n "%{%b%f%}"     # unset color

  echo -n "%{%B%}" # reset bold, if it was diabled before
  if [[ $SPACESHIP_PROMPT_SUFFIXES_SHOW == true ]]; then
    echo -n "$suffix"
  fi
  echo -n "%{%b%}" # unset bold
}

spaceship::async_callback() {
  local job="$1" ret="$2" output="$3" exec_time="$4" err="$5" has_next="$6"
  local section

  # ignore the async evals used to alter worker environment
  if [[ "${job}" == "[async/eval]" ]] \
  || [[ "${job}" == ";" ]] \
  || [[ "${job}" == "[async]" ]]; then
    return
  fi

  section="${job#"spaceship_"}" # TODO: Move spaceship_ to a constant

  # Skip prompt re-rendering if both placeholder and section content are empty,
  # or section cache is unchanged
  if [[ "$(spaceship::get_cache $section)" == "$output" ]]; then
    return
  fi

  spaceship::set_cache "$section" "$output"

  if [[ "$has_next" == 0 ]]; then
    spaceship::async_render
  fi
}

spaceship::build_section_cache() {
  # Option EXTENDED_GLOB is set locally to force filename generation on
  # argument to conditions, i.e. allow usage of explicit glob qualifier (#q).
  # See the description of filename generation in
  # http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
  setopt EXTENDED_GLOB LOCAL_OPTIONS

  spaceship::clear_cache
  spaceship::set_cache open "$SPACESHIP_PROMPT_FIRST_PREFIX_SHOW"

  for section in $(spaceship::union $SPACESHIP_PROMPT_ORDER $SPACESHIP_RPROMPT_ORDER); do
    if $(spaceship::is_section_async $section); then
      # TODO: Count started jobs
      async_job "spaceship" "spaceship_${section}"
    else
      spaceship::set_cache "$section" "$(spaceship_${section})"
    fi
  done

  spaceship::render
}

# PROMPT
# Primary (left) prompt
spaceship_prompt() {
  # Compose prompt from the order
  local prompt="$(spaceship::compose_prompt $SPACESHIP_PROMPT_ORDER)"

  # Allow iTerm integration to work
  if [[ "${ITERM_SHELL_INTEGRATION_INSTALLED:-}" == "Yes" ]]; then
    prompt="%{$(iterm2_prompt_mark)%}${prompt}"
  fi

  # Should it add a new line before the prompt?
  if [[ $SPACESHIP_PROMPT_ADD_NEWLINE == true ]]; then
    prompt="${NEWLINE}${prompt}"
  fi

  # Print the prompt
  echo -n "$prompt"
}

# $RPROMPT
# Optional (right) prompt
spaceship_rprompt() {
  # Compose prompt from the order
  local rprompt="$(spaceship::compose_prompt $SPACESHIP_RPROMPT_ORDER)"

  if [[ "$SPACESHIP_RPROMPT_ADD_NEWLINE" != true ]]; then
    # The right prompt should be on the same line as the first line of the left
    # prompt. To do so, there is just a quite ugly workaround: Before zsh draws
    # the RPROMPT, we advise it, to go one line up. At the end of RPROMPT, we
    # advise it to go one line down. See:
    # http://superuser.com/questions/357107/zsh-right-justify-in-ps1
    RPROMPT_PREFIX='%{'$'\e[1A''%}' # one line up
    RPROMPT_SUFFIX='%{'$'\e[1B''%}' # one line down
    rprompt="$RPROMPT_PREFIX$rprompt$RPROMPT_SUFFIX"
  fi

  # Print the rprompt
  echo -n "$rprompt"
}

# PS2
# Continuation interactive prompt
spaceship_ps2() {
  local char="${SPACESHIP_CHAR_SYMBOL_SECONDARY="$SPACESHIP_CHAR_SYMBOL"}"
  spaceship::section "$SPACESHIP_CHAR_COLOR_SECONDARY" "$char"
}

spaceship::render() {
  PROMPT='$(spaceship_prompt)'
  RPROMPT='$(spaceship_rprompt)'
  PS2='$(spaceship_ps2)'
}

spaceship::async_render() {
  spaceship::render

  # .reset-prompt: bypass the zsh-syntax-highlighting wrapper
  # https://github.com/sorin-ionescu/prezto/issues/1026
  # https://github.com/zsh-users/zsh-autosuggestions/issues/107#issuecomment-183824034
  zle .reset-prompt && zle -R
}

# Compose whole prompt from sections
# USAGE:
#   spaceship::compose_prompt [section...]
spaceship::compose_prompt() {
  # Treat the first argument as list of prompt sections
  # Compose whole prompt from diferent parts
  for section in $@; do
    spaceship::get_cache "$section"
  done
}
