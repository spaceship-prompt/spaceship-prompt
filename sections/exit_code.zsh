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
SPACESHIP_EXIT_CODE_SYMBOl="${SPACESHIP_EXIT_CODE_SYMBOl="✘"}"
SPACESHIP_EXIT_CODE_COLOR="${SPACESHIP_EXIT_CODE_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_exit_code() {
  [[ $SPACESHIP_EXIT_CODE_SHOW == false || $RETVAL == 0 ]] && return

  _prompt_section \
    "$SPACESHIP_EXIT_CODE_COLOR" \
    "$SPACESHIP_EXIT_CODE_PREFIX" \
    "${SPACESHIP_EXIT_CODE_SYMBOl}$RETVAL" \
    "$SPACESHIP_EXIT_CODE_SUFFIX"
}
