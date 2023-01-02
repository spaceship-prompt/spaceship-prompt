#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"
  export PATH=$PWD/tests/stubs:$PATH

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(gnu_screen)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_GNU_SCREEN_SHOW="true"
  SPACESHIP_GNU_SCREEN_PREFIX="via "
  SPACESHIP_GNU_SCREEN_SUFFIX=" "
  SPACESHIP_GNU_SCREEN_SYMBOL="💻 "
  SPACESHIP_GNU_SCREEN_COLOR="yellow"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset IN_NIX_SHELL
  unset SPACESHIP_GNU_SCREEN_SHOW
  unset SPACESHIP_GNU_SCREEN_PREFIX
  unset SPACESHIP_GNU_SCREEN_SUFFIX
  unset SPACESHIP_GNU_SCREEN_SYMBOL
  unset SPACESHIP_GNU_SCREEN_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_gnu_screen_no_bin() {
  local no_bin_expected=""
  local no_bin_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without nix shell" "$no_bin_expected" "$no_bin_actual"
}

test_gnu_screen_env() {
  screen() {}
  STY='1234.spaceship'

  local env_expected=(
    "%{%B%}$SPACESHIP_GNU_SCREEN_PREFIX%{%b%}"
    "%{%B%F{$SPACESHIP_GNU_SCREEN_COLOR}%}"
    "$SPACESHIP_GNU_SCREEN_SYMBOL"
    "$STY"
    "%{%b%f%}"
    "%{%B%}$SPACESHIP_GNU_SCREEN_SUFFIX%{%b%}"
  )
  local env_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with nix shell" "${(j::)env_expected}" "$env_actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
