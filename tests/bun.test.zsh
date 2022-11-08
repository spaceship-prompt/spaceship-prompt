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
  SPACESHIP_PROMPT_ORDER=(bun)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_BUN_SHOW="true"
  SPACESHIP_BUN_PREFIX="via "
  SPACESHIP_BUN_SUFFIX=""
  SPACESHIP_BUN_SYMBOL="🍞 "
  SPACESHIP_BUN_COLOR="#fbf0df"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_BUN_SHOW
  unset SPACESHIP_BUN_PREFIX
  unset SPACESHIP_BUN_SUFFIX
  unset SPACESHIP_BUN_SYMBOL
  unset SPACESHIP_BUN_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_bun() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"

  touch bun.lockb

  local lockb_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_BUN_COLOR}%}${SPACESHIP_BUN_SYMBOL}v0.1.10%{%b%f%}"
  local lockb_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with bun.lockb" "$lockb_expected" "$lockb_actual"

  rm bun.lockb
  touch bunfig.toml

  local lockb_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_BUN_COLOR}%}${SPACESHIP_BUN_SYMBOL}v0.1.10%{%b%f%}"
  local lockb_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with bunfig.toml" "$lockb_expected" "$lockb_actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
