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
  SPACESHIP_PROMPT_ORDER=(azure)

  source "spaceship.zsh"
}

setUp() {
  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  # nope
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_az_not_exists() {
  alias az="noop"
  local az_expected=""
  local az_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render nothing if az does not exist" "$az_expected" "$az_actual"
  unalias az
}

test_az_subscription() {
  local az_account="my-az-subscription"
  local az_expected="%{%B%}using %{%b%}%{%B%F{$SPACESHIP_AZURE_COLOR}%}${SPACESHIP_AZURE_SYMBOL}$az_account%{%b%f%}%{%B%} %{%b%}"
  local az_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with subscription name" "$az_expected" "$az_actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
