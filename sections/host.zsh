#
# Hostname
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

: "${SPACESHIP_HOST_SHOW=true}"
: "${SPACESHIP_HOST_PREFIX="at "}"
: "${SPACESHIP_HOST_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
: "${SPACESHIP_HOST_COLOR="blue"}"
: "${SPACESHIP_HOST_COLOR_SSH="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# If there is an ssh connections, current machine name.
spaceship_host() {
  [[ $SPACESHIP_HOST_SHOW == false ]] && return

  if [[ $SPACESHIP_HOST_SHOW == 'always' ]] || [[ -n $SSH_CONNECTION ]]; then
    local host_color

    # Determination of what color should be used
    if [[ -n $SSH_CONNECTION ]]; then
      host_color=$SPACESHIP_HOST_COLOR_SSH
    else
      host_color=$SPACESHIP_HOST_COLOR
    fi

    _prompt_section \
      "$host_color" \
      "$SPACESHIP_HOST_PREFIX" \
      '%m' \
      "$SPACESHIP_HOST_SUFFIX"
  fi
}
