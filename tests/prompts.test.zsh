#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  typeset -gAh SPACESHIP_CACHE

  source lib/utils.zsh
  source lib/renderer.zsh
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_compose_prompt() {
  spaceship_foo() { echo -n 'foo' }
  spaceship_bar() { echo -n 'bar' }

  SPACESHIP_PROMPT_ORDER=(foo bar)

  spaceship::load_sections
  spaceship::build_section_cache

  local expected="foobar"
  local actual="$(spaceship::compose_prompt $SPACESHIP_PROMPT_ORDER)"

  assertEquals "render spaceship sections" "$expected" "$actual"

  local SPACESHIP_PROMPT_ORDER=(foo bar baz)
  local warning_file="$SHUNIT_TMPDIR/warning.txt"
  spaceship::load_sections > $warning_file
  spaceship::build_section_cache

  local expected_prompt="foobar"
  local actual_prompt="$(spaceship::compose_prompt $SPACESHIP_PROMPT_ORDER)"

  assertEquals "skip missing sections" "$expected_not_found" "$actual_not_found"

  local expected_warning="[33mWarning![39m The '[36mbaz[39m' section was not found. Removing it from the prompt."
  local actual_warning="$(cat $warning_file)"

  assertEquals "should print warning" "$actual_warning" "$expected_warning"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
