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
  SPACESHIP_PROMPT_ORDER=(terraform)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_TERRAFORM_SHOW="true"  # TODO: upsearch fails
  SPACESHIP_TERRAFORM_ASYNC="false"
  SPACESHIP_TERRAFORM_PREFIX="pre"
  SPACESHIP_TERRAFORM_SUFFIX="suf"
  SPACESHIP_TERRAFORM_SYMBOL="sym"
  SPACESHIP_TERRAFORM_COLOR=""

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_TERRAFORM_SHOW
  unset SPACESHIP_TERRAFORM_ASYNC
  unset SPACESHIP_TERRAFORM_PREFIX
  unset SPACESHIP_TERRAFORM_SUFFIX
  unset SPACESHIP_TERRAFORM_SYMBOL
  unset SPACESHIP_TERRAFORM_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_terraform_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$expected" "$actual"
}

test_terraform_files() {
  mkdir .terraform
  echo "env" > .terraform/environment
  local expected=(
    "%{%B%}$SPACESHIP_TERRAFORM_PREFIX%{%b%}"
    "%{%B%F{$SPACESHIP_TERRAFORM_COLOR}%}"
    "${SPACESHIP_TERRAFORM_SYMBOL}"
    "env"
    "%{%b%f%}"
  )
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render" "${expected}" "$actual"
  rm -fr .terraform
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
