#
# Exit code
#
# Show exit code of last executed command

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_EXIT_CODE_SHOW="${SPACESHIP_EXIT_CODE_SHOW=false}"
SPACESHIP_EXIT_CODE_PREFIX="${SPACESHIP_EXIT_CODE_PREFIX=""}"
SPACESHIP_EXIT_CODE_SUFFIX="${SPACESHIP_EXIT_CODE_SUFFIX=" "}"
SPACESHIP_EXIT_CODE_SYMBOL="${SPACESHIP_EXIT_CODE_SYMBOL="✘"}"
SPACESHIP_EXIT_CODE_COLOR="${SPACESHIP_EXIT_CODE_COLOR="red"}"
SPACESHIP_EXIT_CODE_COLOR_SUCCESS="${SPACESHIP_EXIT_CODE_COLOR_SUCCESS=""}"
SPACESHIP_EXIT_CODE_COLOR_FAILURE="${SPACESHIP_EXIT_CODE_COLOR_FAILURE=""}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_exit_code() {
  [[ $SPACESHIP_EXIT_CODE_SHOW == false ]] && return

  [[ $SPACESHIP_EXIT_CODE_SHOW != "always" && $RETVAL == 0 ]] && return

  local color=""

  if [[ $RETVAL == 0 ]] ; then
    if [[ ! -z $SPACESHIP_EXIT_CODE_COLOR_SUCCESS || $SPACESHIP_EXIT_CODE_COLOR_SUCCESS == "" ]]; then
      color=$SPACESHIP_EXIT_CODE_COLOR_SUCCESS
    else
      color=$SPACESHIP_EXIT_CODE_COLOR
    fi
  else
    if [[ ! -z $SPACESHIP_EXIT_CODE_COLOR_FAILURE || $SPACESHIP_EXIT_CODE_COLOR_FAILURE == "" ]]; then
      color=$SPACESHIP_EXIT_CODE_COLOR_FAILURE
    else
      color=$SPACESHIP_EXIT_CODE_COLOR
    fi
  fi

  spaceship::section \
    "$color" \
    "$SPACESHIP_EXIT_CODE_PREFIX" \
    "${SPACESHIP_EXIT_CODE_SYMBOL}$RETVAL" \
    "$SPACESHIP_EXIT_CODE_SUFFIX"
}
