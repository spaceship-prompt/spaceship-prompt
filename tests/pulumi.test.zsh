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
  SPACESHIP_PROMPT_ORDER=(pulumi)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_PULUMI_SHOW="true"
  SPACESHIP_PULUMI_ASYNC="true"
  SPACESHIP_PULUMI_PREFIX="via "
  SPACESHIP_PULUMI_SUFFIX=""
  SPACESHIP_PULUMI_SYMBOL=" "
  SPACESHIP_PULUMI_COLOR="133"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_PULUMI_SHOW
  unset SPACESHIP_PULUMI_ASYNC
  unset SPACESHIP_PULUMI_PREFIX
  unset SPACESHIP_PULUMI_SUFFIX
  unset SPACESHIP_PULUMI_SYMBOL
  unset SPACESHIP_PULUMI_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_pulumi_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_pulumi_file_with_yaml() {
  touch Pulumi.yaml
  touch Pulumi.dev.yml

  local yaml_expected="%{%B%}via %{%b%}%{%B%F{133}%} dev%{%b%f%}"
  local yaml_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with Pulumi.yaml" "$yaml_expected" "$yaml_actual"

  rm Pulumi.yaml
}

test_pulumi_file_with_yml() {
  touch Pulumi.yml
  touch Pulumi.dev.yml

  local yml_expected="%{%B%}via %{%b%}%{%B%F{133}%} dev%{%b%f%}"
  local yml_actual="$(spaceship::testkit::render_prompt)"

  assertEquals "should render with Pulumi.yml" "$yml_expected" "$yml_actual"

  rm Pulumi.yml
}
# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
