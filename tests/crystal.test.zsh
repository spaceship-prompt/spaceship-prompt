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

  CRYSTAL_VERSION="1.5.1"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(crystal)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_CRYSTAL_SHOW="true"
  SPACESHIP_CRYSTAL_PREFIX="via "
  SPACESHIP_CRYSTAL_SUFFIX=""
  SPACESHIP_CRYSTAL_SYMBOL="🔮 "
  SPACESHIP_CRYSTAL_COLOR="069"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_CRYSTAL_SHOW
  unset SPACESHIP_CRYSTAL_PREFIX
  unset SPACESHIP_CRYSTAL_SUFFIX
  unset SPACESHIP_CRYSTAL_SYMBOL
  unset SPACESHIP_CRYSTAL_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_crystal_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_crystal_shard() {
  touch shard.yml
  local shard_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_CRYSTAL_COLOR}%}${SPACESHIP_CRYSTAL_SYMBOL}v$CRYSTAL_VERSION%{%b%f%}"
  local shard_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with shard.yml" "$shard_expected" "$shard_actual"
  rm shard.yml
}

test_crystal_files() {
  touch main.cr
  local cr_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_CRYSTAL_COLOR}%}${SPACESHIP_CRYSTAL_SYMBOL}v${CRYSTAL_VERSION}%{%b%f%}"
  local cr_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with main.cr" "$cr_expected" "$cr_actual"
  rm main.cr
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
