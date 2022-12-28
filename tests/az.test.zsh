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
  SPACESHIP_PROMPT_ORDER=(az)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_AZ_SHOW="true"
  SPACESHIP_AZ_PREFIX="using "
  SPACESHIP_AZ_SUFFIX=""
  SPACESHIP_AZ_SYMBOL="☁️  "
  SPACESHIP_AZ_COLOR="039"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_AZ_SHOW
  unset SPACESHIP_AZ_PREFIX
  unset SPACESHIP_AZ_SUFFIX
  unset SPACESHIP_AZ_SYMBOL
  unset SPACESHIP_AZ_COLOR
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
  local az_expected="%{%B%}using %{%b%}%{%B%F{$SPACESHIP_AZ_COLOR}%}${SPACESHIP_AZ_SYMBOL}my-az-subscription%{%b%f%}"
  local az_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with subscription name" "$az_expected" "$az_actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
