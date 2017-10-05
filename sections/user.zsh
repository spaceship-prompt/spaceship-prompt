#
# Username
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_USER_SHOW="${SPACESHIP_USER_SHOW:=true}"
SPACESHIP_USER_PREFIX="${SPACESHIP_USER_PREFIX:="with "}"
SPACESHIP_USER_SUFFIX="${SPACESHIP_USER_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_USER_COLOR="${SPACESHIP_USER_COLOR:="yellow"}"
SPACESHIP_USER_COLOR_ROOT="${SPACESHIP_USER_COLOR_ROOT:="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# If user is root, then paint it in red. Otherwise, just print in yellow.
spaceship_user() {
  [[ $SPACESHIP_USER_SHOW == false ]] && return

  if [[ $LOGNAME != $USER ]] || [[ $UID == 0 ]] || [[ -n $SSH_CONNECTION ]]; then
    local user_color

    if [[ $USER == 'root' ]]; then
      user_color=$SPACESHIP_USER_COLOR_ROOT
    else
      user_color="$SPACESHIP_USER_COLOR"
    fi

    _prompt_section \
      "$user_color" \
      "$SPACESHIP_USER_PREFIX" \
      '%n' \
      "$SPACESHIP_USER_SUFFIX"
  fi
}
