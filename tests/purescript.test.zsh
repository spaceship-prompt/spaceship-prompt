#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

setUp() {
  # Enter the test directory
  cd $SHUNIT_TMPDIR
}

oneTimeSetUp() {
  export TERM="xterm-256color"
  export PATH=$PWD/tests/stubs:$PATH

  PURESCRIPT_VERSION="0.15.6"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(purescript)

  source "spaceship.zsh"
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_ASYNC
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_purescript_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "do not render if there are no files" "$expected" "$actual"
}

test_purescript_files() {
  local file="spago.dhall"
  touch "$file"

  local expected=(
    "%{%B%}$SPACESHIP_PURESCRIPT_PREFIX%{%b%}"
    "%{%B%F{$SPACESHIP_PURESCRIPT_COLOR}%}"
    "$SPACESHIP_PURESCRIPT_SYMBOL"
    "v$PURESCRIPT_VERSION"
    "%{%b%f%}"
    "%{%B%}$SPACESHIP_PURESCRIPT_SUFFIX%{%b%}"
  )
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "render with $file" "${(j::)expected}" "$actual"
}

test_purescript_extensions() {
  local file="file.pures"
  touch "$file"

  local expected=(
    "%{%B%}$SPACESHIP_PURESCRIPT_PREFIX%{%b%}"
    "%{%B%F{$SPACESHIP_PURESCRIPT_COLOR}%}"
    "$SPACESHIP_PURESCRIPT_SYMBOL"
    "v$PURESCRIPT_VERSION"
    "%{%b%f%}"
    "%{%B%}$SPACESHIP_PURESCRIPT_SUFFIX%{%b%}"
  )
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "render with $file" "${(j::)expected}" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
