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

  KOTLIN_VERSION="1.7.21-release-272"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(kotlin)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_KOTLIN_SHOW="true"
  SPACESHIP_KOTLIN_PREFIX="via "
  SPACESHIP_KOTLIN_SUFFIX=""
  SPACESHIP_KOTLIN_SYMBOL="K "
  SPACESHIP_KOTLIN_COLOR="blue"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_KOTLIN_SHOW
  unset SPACESHIP_KOTLIN_PREFIX
  unset SPACESHIP_KOTLIN_SUFFIX
  unset SPACESHIP_KOTLIN_SYMBOL
  unset SPACESHIP_KOTLIN_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_kotlin_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_kotlin_gradle() {
  touch build.gradle
  local gradle_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_KOTLIN_COLOR}%}${SPACESHIP_KOTLIN_SYMBOL}v$KOTLIN_VERSION%{%b%f%}"
  local gradle_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with build.gradle" "$shard_expected" "$shard_actual"
  rm build.gradle
}

test_kotlin_files() {
  touch main.kt
  local kt_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_KOTLIN_COLOR}%}${SPACESHIP_KOTLIN_SYMBOL}v${KOTLIN_VERSION}%{%b%f%}"
  local kt_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with main.kt" "$cr_expected" "$cr_actual"
  rm main.kt
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
