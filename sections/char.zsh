#
# Prompt character
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_CHAR_SUCCESS_COLOR="${SPACESHIP_CHAR_SUCCESS_COLOR:=green}"
SPACESHIP_CHAR_FAILURE_COLOR="${SPACESHIP_CHAR_FAILURE_COLOR:=red}"
SPACESHIP_CHAR_SECONDARY_COLOR="${SPACESHIP_CHAR_SECONDARY_COLOR:=yellow}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Paint $PROMPT_SYMBOL in red if previous command was fail and
# paint in green if everything was OK.
spaceship_char() {
  # @TODO: use $RETVAL
  _prompt_section "%(?.$SPACESHIP_CHAR_SUCCESS_COLOR.$SPACESHIP_CHAR_FAILURE_COLOR)" "${SPACESHIP_PROMPT_SYMBOL} "
}
