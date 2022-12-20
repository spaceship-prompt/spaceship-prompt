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

  SCALA_VERSION="3.2.0"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(scala)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_SCALA_SHOW="true"
  SPACESHIP_SCALA_PREFIX="via "
  SPACESHIP_SCALA_SUFFIX=""
  SPACESHIP_SCALA_SYMBOL="🆂 "
  SPACESHIP_SCALA_COLOR="red"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_SCALA_SHOW
  unset SPACESHIP_SCALA_PREFIX
  unset SPACESHIP_SCALA_SUFFIX
  unset SPACESHIP_SCALA_SYMBOL
  unset SPACESHIP_SCALA_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_scala_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$expected" "$actual"
}

test_scala_upsearch_file() {
  FILES=(.scalaenv .sbtenv)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_SCALA_COLOR}%}${SPACESHIP_SCALA_SYMBOL}v${SCALA_VERSION}%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with file $file" "$expected" "$actual"
    rm $file
  done
}

test_scala_upsearch_dir() {
  DIRS=(.metals)
  for dir in $DIRS; do
    mkdir $dir
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_SCALA_COLOR}%}${SPACESHIP_SCALA_SYMBOL}v${SCALA_VERSION}%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with dir $dir" "$expected" "$actual"
    rm -rf $dir
  done
}

test_scala_file_extension() {
  FILES=(first.scala second.sbt)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_SCALA_COLOR}%}${SPACESHIP_SCALA_SYMBOL}v${SCALA_VERSION}%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with extension for file $file" "$expected" "$actual"
    rm $file
  done
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
