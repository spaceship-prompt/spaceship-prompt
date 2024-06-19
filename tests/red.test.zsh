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

  RED_VERSION="0.6.4"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(red)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_RED_SHOW="true"
  SPACESHIP_RED_PREFIX="via "
  SPACESHIP_RED_SUFFIX=""
  SPACESHIP_RED_SYMBOL="🔺 "
  SPACESHIP_RED_COLOR="red"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_RED_SHOW
  unset SPACESHIP_RED_PREFIX
  unset SPACESHIP_RED_SUFFIX
  unset SPACESHIP_RED_SYMBOL
  unset SPACESHIP_RED_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$expected" "$actual"
}

test_red_upsearch_file() {
  FILES=(red.rc redbol)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_RED_COLOR}%}${SPACESHIP_RED_SYMBOL}v$RED_VERSION%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_red_file_extension() {
  FILES=(first.red second.reds)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_RED_COLOR}%}${SPACESHIP_RED_SYMBOL}v$RED_VERSION%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}