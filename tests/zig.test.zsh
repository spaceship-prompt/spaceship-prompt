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

  ZIG_VERSION="0.10.0"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(zig)

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

test_zig_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "do not render if there are no files" "$expected" "$actual"
}

test_zig_files() {
  touch build.zig

  local expected=(
    "%{%B%}$SPACESHIP_ZIG_PREFIX%{%b%}"
    "%{%B%F{$SPACESHIP_ZIG_COLOR}%}"
    "$SPACESHIP_ZIG_SYMBOL"
    "v$ZIG_VERSION"
    "%{%b%f%}"
    "%{%B%}$SPACESHIP_ZIG_SUFFIX%{%b%}"
  )
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "render with build.zig" "${(j::)expected}" "$actual"
}

test_zig_extensions() {
  touch file.zig

  local expected=(
    "%{%B%}$SPACESHIP_ZIG_PREFIX%{%b%}"
    "%{%B%F{$SPACESHIP_ZIG_COLOR}%}"
    "$SPACESHIP_ZIG_SYMBOL"
    "v$ZIG_VERSION"
    "%{%b%f%}"
    "%{%B%}$SPACESHIP_ZIG_SUFFIX%{%b%}"
  )
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "render with file.zig" "${(j::)expected}" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
