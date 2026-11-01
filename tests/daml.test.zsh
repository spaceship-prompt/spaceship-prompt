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
  SPACESHIP_PROMPT_ORDER=(daml)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_DAML_SHOW="true"
  SPACESHIP_DAML_PREFIX="via "
  SPACESHIP_DAML_SUFFIX=""
  SPACESHIP_DAML_SYMBOL="Λ "
  SPACESHIP_DAML_COLOR="blue"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_DAML_SHOW
  unset SPACESHIP_DAML_PREFIX
  unset SPACESHIP_DAML_SUFFIX
  unset SPACESHIP_DAML_SYMBOL
  unset SPACESHIP_DAML_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# 

test_daml_env_var() {
  # Setup: Detect daml.yaml file and extract Daml version from environment variable.
  touch daml.yaml
  export DAML_SDK_VERSION_ENV="2.4.0"

  local expected="(·|·${SPACESHIP_DAML_COLOR}·|·${SPACESHIP_DAML_PREFIX}·|·${SPACESHIP_DAML_SUFFIX}·|·${SPACESHIP_DAML_SYMBOL}·|·v2.4.0·|·)"

  assertEquals "render daml from env var" "$expected" "$(spaceship_daml)"

  unset DAML_SDK_VERSION_ENV
}


test_daml_yaml_file() {
  # Setup: Detect daml.yaml file and extract Daml version from daml.yaml file.
  echo "sdk-version: 1.5.0" > daml.yaml

  local expected="(·|·${SPACESHIP_DAML_COLOR}·|·${SPACESHIP_DAML_PREFIX}·|·${SPACESHIP_DAML_SUFFIX}·|·${SPACESHIP_DAML_SYMBOL}·|·v1.5.0·|·)"

  assertEquals "render daml from daml.yaml file" "$expected" "$(spaceship_daml)"
}

test_daml_precedence() {
  # Setup: Both YAML and Env var exist, but with different versions
  echo "sdk-version: 1.5.0" > daml.yaml
  export DAML_SDK_VERSION_ENV="2.4.0"

  # Expected: The Env var (2.4.0) should override the YAML (1.5.0)
  local expected="(·|·${SPACESHIP_DAML_COLOR}·|·${SPACESHIP_DAML_PREFIX}·|·${SPACESHIP_DAML_SUFFIX}·|·${SPACESHIP_DAML_SYMBOL}·|·v2.4.0·|·)"

  assertEquals "env var should take precedence over daml.yaml" "$expected" "$(spaceship_daml)"

  unset DAML_SDK_VERSION_ENV
}

test_daml_no_yaml_file() {
  # Setup: Ensure no daml.yaml exists in the current test dir
  rm -f daml.yaml

  # Expected: The segment should abort and return an empty string
  local expected=""

  assertEquals "do not render if daml.yaml is missing" "$expected" "$(spaceship_daml)"
}

test_daml_show_false() {
  # Setup: A valid daml project, but the segment is disabled
  echo "sdk-version: 1.5.0" > daml.yaml
  SPACESHIP_DAML_SHOW="false"

  # Expected: The segment should abort and return an empty string
  local expected=""

  assertEquals "do not render if SPACESHIP_DAML_SHOW is false" "$expected" "$(spaceship_daml)"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2

