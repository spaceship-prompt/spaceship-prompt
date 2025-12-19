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

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(rlang)
  R_VERSION='4.3.1 "Beagle Scouts"'

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_RLANG_SHOW="true"
  SPACESHIP_RLANG_PREFIX="with "
  SPACESHIP_RLANG_SUFFIX=" "
  SPACESHIP_RLANG_SYMBOL="📊 "
  SPACESHIP_RLANG_COLOR="blue"
  SPACESHIP_RLANG_VERBOSE=true
  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_RLANG_SHOW
  unset SPACESHIP_RLANG_PREFIX
  unset SPACESHIP_RLANG_SUFFIX
  unset SPACESHIP_RLANG_SYMBOL
  unset SPACESHIP_RLANG_COLOR
  unset SPACESHIP_RLANG_VERBOSE
}

test_rlang_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_rlang_configs() {
  FILES=('*.R' '*.Rd' '*.Rmd' '*.Rproj' '*.Rsx')
  for file in $FILES; do
    touch $file
    local expected="%{%B%}$SPACESHIP_RLANG_PREFIX%{%b%}%{%B%F{$SPACESHIP_RLANG_COLOR}%}$SPACESHIP_RLANG_SYMBOL$R_VERSION%{%b%f%}%{%B%} %{%b%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_rlang_files() {
  FILES=('.Rprofile')
  for file in $FILES; do
    touch $file
    local expected="%{%B%}$SPACESHIP_RLANG_PREFIX%{%b%}%{%B%F{$SPACESHIP_RLANG_COLOR}%}$SPACESHIP_RLANG_SYMBOL$R_VERSION%{%b%f%}%{%B%} %{%b%}"
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
