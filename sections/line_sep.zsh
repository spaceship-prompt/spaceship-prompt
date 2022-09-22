#
# Line separator
#

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Should it write prompt in two lines or not?
spaceship_line_sep() {
  [[ $SPACESHIP_PROMPT_SEPARATE_LINE != true ]] && return

  spaceship::section --color 'white' "\n"
}
