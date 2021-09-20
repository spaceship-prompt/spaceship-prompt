#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

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
  local delimiter="·|·"

  local color="cyan" content="content" prefix="prefix" suffix="suffix"

  local expected_none="$delimiter$delimiter$delimiter"
  local actual_none="$(spaceship::section)"

  assertEquals "section without arguments" "$expected_none" "$actual_none"

  local expected_short="$color$delimiter$delimiter$content$delimiter"
  local actual_short="$(spaceship::section $color $content)"

  assertEquals "short section" "$expected_short" "$actual_short"

  local expected_suffix="$color$delimiter$prefix$delimiter$content$delimiter$suffix"
  local actual_suffix="$(spaceship::section $color $prefix $content $suffix)"

  assertEquals "full section" "$expected_suffix" "$actual_suffix"
}

test_render_section() {
  local delimiter="·|·"
  local input=""

  local color="cyan" content="content" prefix="prefix" suffix="suffix"

  input="$delimiter$delimiter$delimiter"
  local actual_none="$(spaceship::render_section $input)"
  local expected_none=""

  assertEquals "render empty section" "$expected_none" "$actual_none"

  input="$color$delimiter$delimiter$content$delimiter"
  local actual_short="$(spaceship::render_section $input)"
  local expected_short="%{%B%F{$color}%}$content%{%b%f%}"

  assertEquals "render short section" "$expected_short" "$actual_short"

  input="$color$delimiter$prefix$delimiter$content$delimiter$suffix"
  local actual_suffix="$(spaceship::render_section $input)"
  local expected_suffix="%{%B%F{$color}%}$content%{%b%f%}%{%B%}$suffix%{%b%}"

  assertEquals "render full section with suffix" "$expected_suffix" "$actual_suffix"

  _spaceship_prompt_opened=true
  input="$color$delimiter$prefix$delimiter$content$delimiter$suffix"
  local actual="$(spaceship::render_section $input)"
  local expected="%{%B%}$prefix%{%b%}%{%B%F{$color}%}$content%{%b%f%}%{%B%}$suffix%{%b%}"

  assertEquals "render full section with prefix and suffix" "$expected" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
