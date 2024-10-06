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

  GLEAM_VERSION="1.5.1"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(gleam)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_GLEAM_SHOW="true"
  SPACESHIP_GLEAM_PREFIX="via "
  SPACESHIP_GLEAM_SUFFIX=""
  SPACESHIP_GLEAM_SYMBOL="⭐ "
  SPACESHIP_GLEAM_COLOR="#ff87df"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_GLEAM_SHOW
  unset SPACESHIP_GLEAM_PREFIX
  unset SPACESHIP_GLEAM_SUFFIX
  unset SPACESHIP_GLEAM_SYMBOL
  unset SPACESHIP_GLEAM_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_gleam_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_gleam_configs() {
  FILES=(gleam.toml)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_GLEAM_COLOR}%}${SPACESHIP_GLEAM_SYMBOL}v$GLEAM_VERSION%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_gleam_files() {
  FILES=(main.gleam main_test.gleam)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_GLEAM_COLOR}%}${SPACESHIP_GLEAM_SYMBOL}v${GLEAM_VERSION}%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
