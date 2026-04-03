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

  SINGULARITY_VERSION="4.3.7"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(singularityce)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_SINGULARITYCE_SHOW="true"
  SPACESHIP_SINGULARITYCE_PREFIX="via "
  SPACESHIP_SINGULARITYCE_SUFFIX=""
  SPACESHIP_SINGULARITYCE_SYMBOL="⬡ "
  SPACESHIP_SINGULARITYCE_COLOR="blue"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_SINGULARITYCE_SHOW
  unset SPACESHIP_SINGULARITYCE_PREFIX
  unset SPACESHIP_SINGULARITYCE_SUFFIX
  unset SPACESHIP_SINGULARITYCE_SYMBOL
  unset SPACESHIP_SINGULARITYCE_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_singularityce_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without .def files" "$expected" "$actual"
}

test_singularityce_def_file() {
  touch container.def
  local expected=(
    "%{%B%}$SPACESHIP_SINGULARITYCE_PREFIX%{%b%}"
    "%{%B%F{$SPACESHIP_SINGULARITYCE_COLOR}%}"
    "${SPACESHIP_SINGULARITYCE_SYMBOL}"
    "$SINGULARITY_VERSION"
    "%{%b%f%}"
  )
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with .def file" "${(j::)expected}" "$actual"
  rm container.def
}

test_singularityce_show_false() {
  SPACESHIP_SINGULARITYCE_SHOW=false
  touch container.def
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render when SHOW is false" "$expected" "$actual"
  rm container.def
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
