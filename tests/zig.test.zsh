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

test_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "do not render if there are no files" "$expected" "$actual"
}

test_mocked_version() {
  # Prepare the environment
  touch $SHUNIT_TMPDIR/build.zig

  local prefix="%{%B%}$SPACESHIP_ZIG_PREFIX%{%b%}"
  local content="%{%B%F{$SPACESHIP_ZIG_COLOR}%}$SPACESHIP_ZIG_SYMBOL0.10.0%{%b%f%}"
  local suffix="%{%B%}$SPACESHIP_ZIG_SUFFIX%{%b%}"

  local expected="$prefix$content$suffix"
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "render mocked version" "$expected" "$actual"
}

# TODO: add more tests

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
