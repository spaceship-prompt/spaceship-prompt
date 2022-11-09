#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "lib/hooks.zsh"
}

setUp() {
  SPACESHIP_EXEC_TIME_SHOW=true
  SPACESHIP_GIT_BRANCH_SHOW=true
}

tearDown() {
  unset SPACESHIP_EXEC_TIME_SHOW
  unset SPACESHIP_GIT_BRANCH_SHOW
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_exec_time_preexec_hook() {
  local EPOCHREALTIME='123456'
  local expected="$EPOCHREALTIME"

  # Hook call should call `date` and save time to $SPACESHIP_EXEC_TIME_start
  spaceship_exec_time_start

  assertEquals "should save starting time" "$expected" "$SPACESHIP_EXEC_TIME_start"

  unset SPACESHIP_EXEC_TIME_start

  SPACESHIP_EXEC_TIME_SHOW=false
  spaceship_exec_time_start
  assertNull "should not call hook" "$SPACESHIP_EXEC_TIME_start"
}

test_exec_time_precmd_hook() {
  local date_start_mock='123'
  local date_stop_mock='321'
  local date_duration_mock='198'
  local EPOCHREALTIME=$date_stop_mock

  SPACESHIP_EXEC_TIME_start="$date_start_mock"

  spaceship_exec_time_stop
  assertEquals "should calculate duration" "$date_duration_mock" "$SPACESHIP_EXEC_TIME_duration"
  assertNull "$SPACESHIP_EXEC_TIME_start"

  spaceship_exec_time_stop
  assertNull "should not calculate without starting time" "$SPACESHIP_EXEC_TIME_duration"

  SPACESHIP_EXEC_TIME_SHOW=false
  SPACESHIP_EXEC_TIME_start="$date_start_mock"
  spaceship_exec_time_stop
  assertNull "should not calculate duration" "$SPACESHIP_EXEC_TIME_duration"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
