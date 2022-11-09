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

  V_VERSION="0.2.4"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(vlang)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_VLANG_SHOW="true"
  SPACESHIP_VLANG_PREFIX="via "
  SPACESHIP_VLANG_SUFFIX=""
  SPACESHIP_VLANG_SYMBOL="V "
  SPACESHIP_VLANG_COLOR="blue"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_VLANG_SHOW
  unset SPACESHIP_VLANG_PREFIX
  unset SPACESHIP_VLANG_SUFFIX
  unset SPACESHIP_VLANG_SYMBOL
  unset SPACESHIP_VLANG_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$expected" "$actual"
}

test_vlang_upsearch_file() {
  FILES=(v.mod vpkg.json .vpkg-lock.json)
  for file in $FILES; do
    touch $file
    local expected=(
      "%{%B%}$SPACESHIP_VLANG_PREFIX%{%b%}"
      "%{%B%F{$SPACESHIP_VLANG_COLOR}%}"
      "$SPACESHIP_VLANG_SYMBOL"
      "v$V_VERSION"
      "%{%b%f%}"
    )
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "${(j::)expected}" "$actual"
    rm $file
  done
}

test_dart_file_extension() {
  FILES=(first.v second.v)
  for file in $FILES; do
    touch $file
    local expected=(
      "%{%B%}via %{%b%}"
      "%{%B%F{$SPACESHIP_VLANG_COLOR}%}"
      "$SPACESHIP_VLANG_SYMBOL"
      "v$V_VERSION"
      "%{%b%f%}"
    )
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "${(j::)expected}" "$actual"
    rm $file
  done
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
