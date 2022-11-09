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

  DENO_VERSION="1.27.0"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(deno)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_DENO_SHOW="true"
  SPACESHIP_DENO_PREFIX="via "
  SPACESHIP_DENO_SUFFIX=""
  SPACESHIP_DENO_SYMBOL="🦕 "
  SPACESHIP_DENO_COLOR="cyan"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_DENO_SHOW
  unset SPACESHIP_DENO_PREFIX
  unset SPACESHIP_DENO_SUFFIX
  unset SPACESHIP_DENO_SYMBOL
  unset SPACESHIP_DENO_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_deno_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_deno_configs() {
  FILES=(deno.json deno.jsonc)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DENO_COLOR}%}${SPACESHIP_DENO_SYMBOL}v$DENO_VERSION%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_deno_files() {
  FILES=(mod.ts dep.ts main.ts cli.ts)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DENO_COLOR}%}${SPACESHIP_DENO_SYMBOL}v${DENO_VERSION}%{%b%f%}"
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
