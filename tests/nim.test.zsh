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

  NIM_VERSION="2.0.0"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(nim)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_NIM_SHOW="true"
  SPACESHIP_NIM_PREFIX="via "
  SPACESHIP_NIM_SUFFIX=""
  SPACESHIP_NIM_SYMBOL="👑 "
  SPACESHIP_NIM_COLOR="yellow"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_NIM_SHOW
  unset SPACESHIP_NIM_PREFIX
  unset SPACESHIP_NIM_SUFFIX
  unset SPACESHIP_NIM_SYMBOL
  unset SPACESHIP_NIM_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_nim_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_nim_upsearch_files() {
  FILES=(foo.nimble nim.cfg config.nims)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_NIM_COLOR}%}${SPACESHIP_NIM_SYMBOL}v${NIM_VERSION}%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with file $file" "$expected" "$actual"
    rm $file
  done
}

test_nim_nim_source() {
  touch main.nim
  local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_NIM_COLOR}%}${SPACESHIP_NIM_SYMBOL}v${NIM_VERSION}%{%b%f%}"
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with main.nim" "$expected" "$actual"
  rm main.nim
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
