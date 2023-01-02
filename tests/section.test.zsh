#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "lib/section.zsh"
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

  local color="cyan" symbol="symbol" content="content" prefix="prefix" suffix="suffix"

  local expected_none="($delimiter$delimiter$delimiter$delimiter$delimiter$delimiter)"
  local actual_none="$(spaceship::section)"

  assertEquals "section without arguments" "$expected_none" "$actual_none"

  local expected_short="($delimiter$color$delimiter$delimiter$delimiter$delimiter$content$delimiter)"
  local actual_short="$(spaceship::section --color $color $content)"

  assertEquals "short section" "$expected_short" "$actual_short"

  local expected_suffix="($delimiter$color$delimiter$prefix$delimiter$suffix$delimiter$symbol$delimiter$content$delimiter)"
  local actual_suffix="$(spaceship::section --color $color --prefix $prefix --suffix $suffix --symbol $symbol $content)"

  assertEquals "full section" "$expected_suffix" "$actual_suffix"
}

test_section_v3() {
  local delimiter="·|·"

  local color="cyan" content="content" prefix="prefix" suffix="suffix"

  local expected_none="($delimiter$delimiter$delimiter$delimiter$delimiter$delimiter)"
  local actual_none="$(spaceship::section)"

  assertEquals "section without arguments" "$expected_none" "$actual_none"

  local expected_short="($delimiter$color$delimiter$delimiter$delimiter$delimiter$content$delimiter)"
  local actual_short="$(spaceship::section::v3 $color $content)"

  assertEquals "short section" "$expected_short" "$actual_short"

  local expected_suffix="($delimiter$color$delimiter$prefix$delimiter$suffix$delimiter$delimiter$content$delimiter)"
  local actual_suffix="$(spaceship::section::v3 $color $prefix $content $suffix)"

  assertEquals "full section" "$expected_suffix" "$actual_suffix"
}

test_render_section() {
  local delimiter="·|·"
  local input=""

  local color="cyan" symbol="symbol" content="content" prefix="prefix" suffix="suffix"

  input="($delimiter$delimiter$delimiter)"
  local actual_none="$(spaceship::section::render $input)"
  local expected_none=""

  assertEquals "render empty section" "$expected_none" "$actual_none"

  input="($delimiter$color$delimiter$delimiter$delimiter$symbol$delimiter$content$delimiter)"
  local actual_short="$(spaceship::section::render $input)"
  local expected_short="%{%B%F{$color}%}$symbol$content%{%b%f%}"

  assertEquals "render short section" "$expected_short" "$actual_short"

  input="($delimiter$color$delimiter$prefix$delimiter$suffix$delimiter$symbol$delimiter$content$delimiter$suffix)"
  local actual_suffix="$(spaceship::section::render $input)"
  local expected_suffix="%{%B%F{$color}%}$symbol$content%{%b%f%}%{%B%}$suffix%{%b%}"

  assertEquals "render full section with suffix" "$expected_suffix" "$actual_suffix"

  _spaceship_prompt_opened=true
  input="($delimiter$color$delimiter$prefix$delimiter$suffix$delimiter$symbol$delimiter$content$delimiter)"
  local actual="$(spaceship::section::render $input)"
  local expected="%{%B%}$prefix%{%b%}%{%B%F{$color}%}$symbol$content%{%b%f%}%{%B%}$suffix%{%b%}"

  assertEquals "render full section with prefix and suffix" "$expected" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
