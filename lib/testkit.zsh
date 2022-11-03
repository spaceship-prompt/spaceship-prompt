#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# TESTKIT
# Functions commonly used for testing
# ------------------------------------------------------------------------------

spaceship::testkit::render_prompt() {
  prompt_spaceship_precmd
  spaceship::prompt "$*"
}

spaceship::testkit::render_rprompt() {
  prompt_spaceship_precmd
  spaceship::rprompt "$*"
}

spaceship::testkit::render_ps2() {
  prompt_spaceship_precmd
  spaceship::ps2 "$*"
}
