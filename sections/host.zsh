#
# Hostname
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_HOST_SHOW="${SPACESHIP_HOST_SHOW=true}"
SPACESHIP_HOST_SHOW_FULL="${SPACESHIP_HOST_SHOW_FULL=false}"
SPACESHIP_HOST_PREFIX="${SPACESHIP_HOST_PREFIX="at "}"
SPACESHIP_HOST_SUFFIX="${SPACESHIP_HOST_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HOST_COLOR="${SPACESHIP_HOST_COLOR="blue"}"
SPACESHIP_HOST_COLOR_SSH="${SPACESHIP_HOST_COLOR_SSH="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# If there is an ssh connections, current machine name.
spaceship_host() {
  [[ $SPACESHIP_HOST_SHOW == false ]] && return

  if [[ $SPACESHIP_HOST_SHOW == 'always' ]] || [[ -n $SSH_CONNECTION ]]; then
    local host_color host

    # Determination of what color should be used
    if [[ -n $SSH_CONNECTION ]]; then
      host_color=$SPACESHIP_HOST_COLOR_SSH
    else
      host_color=$SPACESHIP_HOST_COLOR
    fi

    if [[ $SPACESHIP_HOST_SHOW_FULL == true ]]; then
      host="%M"
    else
      host="%m"
    fi

    spaceship::section \
      --color "$host_color" \
      --prefix "$SPACESHIP_HOST_PREFIX" \
      --suffix "$SPACESHIP_HOST_SUFFIX" \
      "$host"
  fi
}
