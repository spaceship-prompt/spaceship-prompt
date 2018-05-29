#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  source lib/utils.zsh
  source lib/section.zsh
}

setUp() {
  SPACESHIP_PROMPT_PREFIXES_SHOW=true
  SPACESHIP_PROMPT_SUFFIXES_SHOW=true
}

tearDown() {
  unset SPACESHIP_PROMPT_PREFIXES_SHOW
  unset SPACESHIP_PROMPT_SUFFIXES_SHOW
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_section() {
  local color="cyan" content="content" prefix="prefix" suffix="suffix"

  local expected_none="%{%B%}%{%b%}%{%B%f%}%{%b%f%}%{%B%}%{%b%}"
  local actual_none="$(spaceship::section)"

  assertEquals "render section without arguments" "$expected_none" "$actual_none"

  local expected_short="%{%B%}%{%b%}%{%B%F{$color}%}$content%{%b%f%}%{%B%}%{%b%}"
  local actual_short="$(spaceship::section $color $content)"

  assertEquals "render short section" "$expected_short" "$actual_short"

  local expected_suffix="%{%B%}%{%b%}%{%B%F{$color}%}$content%{%b%f%}%{%B%}$suffix%{%b%}"
  local actual_suffix="$(spaceship::section $color $prefix $content $suffix)"

  assertEquals "render full section with suffix" "$expected_suffix" "$actual_suffix"

  spaceship_prompt_opened=true
  local expected="%{%B%}$prefix%{%b%}%{%B%F{$color}%}$content%{%b%f%}%{%B%}$suffix%{%b%}"
  local actual="$(spaceship::section $color $prefix $content $suffix)"

  assertEquals "render full section with prefix and suffix" "$expected" "$actual"
}

test_compose_prompt() {
  spaceship_foo() { echo -n 'foo' }
  spaceship_bar() { echo -n 'bar' }

  local TEST_SPACESHIP_ORDER=(foo bar)

  local expected="foobar"
  local actual="$(spaceship::compose_prompt $TEST_SPACESHIP_ORDER)"

  assertEquals "render spaceship sections" "$expected" "$actual"

  local TEST_SPACESHIP_ORDER_NOT_FOUND=(foo bar baz)

  local expected_not_found="foobar%{%B%}%{%b%}%{%B%F{red}%}'baz' not found%{%b%f%}%{%B%}%{%b%}"
  local actual_not_found="$(spaceship::compose_prompt $TEST_SPACESHIP_ORDER_NOT_FOUND)"

  assertEquals "render missing sections" "$expected_not_found" "$actual_not_found"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source modules/shunit2/shunit2
