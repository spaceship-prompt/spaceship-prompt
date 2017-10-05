#
# Hostname
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_HOST_SHOW="${SPACESHIP_HOST_SHOW:=true}"
SPACESHIP_HOST_PREFIX="${SPACESHIP_HOST_PREFIX:="at "}"
SPACESHIP_HOST_SUFFIX="${SPACESHIP_HOST_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HOST_COLOR="${SPACESHIP_HOST_COLOR:="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# If there is an ssh connections, current machine name.
spaceship_host() {
  [[ $SPACESHIP_HOST_SHOW == false ]] && return

  [[ -n $SSH_CONNECTION ]] || return

  _prompt_section \
    "$SPACESHIP_HOST_COLOR" \
    "$SPACESHIP_HOST_PREFIX" \
    '%m' \
    "$SPACESHIP_HOST_SUFFIX"
}
