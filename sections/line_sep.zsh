#
# Line separator
#

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Should it write prompt in two lines or not?
spaceship_line_sep() {
  local NEWLINE=$'\n'
  [[ $SPACESHIP_PROMPT_SEPARATE_LINE == true ]] && echo -n "$NEWLINE"
}
