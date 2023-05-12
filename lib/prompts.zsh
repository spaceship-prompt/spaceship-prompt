#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# PROMPTS
# Compose prompts for different prompt variables.
# ------------------------------------------------------------------------------

# PROMPT
# Primary (left) prompt
spaceship::prompt() {
  _spaceship_prompt_opened="$SPACESHIP_PROMPT_FIRST_PREFIX_SHOW"

  # Compose prompt from the order
  local prompt="$(spaceship::core::compose_order $SPACESHIP_PROMPT_ORDER)"

  # Allow iTerm integration to work
  if [[ "${ITERM_SHELL_INTEGRATION_INSTALLED:-}" == "Yes" ]]; then
    prompt="%{$(iterm2_prompt_mark)%}${prompt}%{$(iterm2_prompt_end)%}"
  fi

  # Should it add a new line before the prompt?
  if [[ $SPACESHIP_PROMPT_ADD_NEWLINE == true ]]; then
    prompt="\n${prompt}"
  fi

  # Print the prompt
  echo -n "$prompt"
}

# RPROMPT
# Optional (right) prompt
spaceship::rprompt() {
  _spaceship_rprompt_opened="$SPACESHIP_RPROMPT_FIRST_PREFIX_SHOW"

  # Compose prompt from the order
  local rprompt="$(spaceship::core::compose_order $SPACESHIP_RPROMPT_ORDER)"

  if [[ "$SPACESHIP_RPROMPT_ADD_NEWLINE" != true ]]; then
    # The right prompt should be on the same line as the first line of the left
    # prompt. To do so, there is just a quite ugly workaround: Before zsh draws
    # the RPROMPT, we advise it, to go one line up. At the end of RPROMPT, we
    # advise it to go one line down. See:
    # http://superuser.com/questions/357107/zsh-right-justify-in-ps1
    local rprompt_prefix='%{'$'\e[1A''%}' # one line up
    local rprompt_suffix='%{'$'\e[1B''%}' # one line down
    rprompt="$rprompt_prefix$rprompt$rprompt_suffix"
  fi

  # Print the rprompt
  echo -n "$rprompt"
}

# PS2
# Continuation interactive prompt
spaceship::ps2() {
  local char="${SPACESHIP_CHAR_SYMBOL_SECONDARY="$SPACESHIP_CHAR_SYMBOL"}"
  local ps2="$(spaceship::section --color "$SPACESHIP_CHAR_COLOR_SECONDARY" "$char")"
  spaceship::section::render "$ps2"
}

# Render the prompt. Compose variables using prompt functoins.
# USAGE:
#   spaceship::populate
spaceship::populate() {
  PROMPT='$(spaceship::prompt)'
  RPROMPT='$(spaceship::rprompt)'
  PS2='$(spaceship::ps2)'
}
