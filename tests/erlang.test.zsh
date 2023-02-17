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

  ERLANG_VERSION="25"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(erlang)

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

test_erlang_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"

  assertEquals "do not render if there are no files" "$expected" "$actual"
}

test_erlang_files() {
  FILES=(rebar.config erlang.mk)
  for file in $FILES; do
    touch $file
    local expected=(
      "%{%B%}$SPACESHIP_ERLANG_PREFIX%{%b%}"
      "%{%B%F{$SPACESHIP_ERLANG_COLOR}%}"
      "${SPACESHIP_ERLANG_SYMBOL}"
      "v$ERLANG_VERSION"
      "%{%b%f%}"
      "%{%B%}$SPACESHIP_ERLANG_SUFFIX%{%b%}"
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
