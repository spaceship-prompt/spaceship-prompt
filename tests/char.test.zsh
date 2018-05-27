#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ORDER=(char)
}

setUp() {
  autoload -U promptinit; promptinit
  prompt spaceship

  SPACESHIP_CHAR_PREFIX=""
  SPACESHIP_CHAR_SUFFIX=""
  SPACESHIP_CHAR_SYMBOL="➜ "
  SPACESHIP_CHAR_COLOR_SUCCESS="green"
  SPACESHIP_CHAR_COLOR_FAILURE="red"
  SPACESHIP_CHAR_COLOR_SECONDARY="yellow"
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_CHAR_PREFIX
  unset SPACESHIP_CHAR_SUFFIX
  unset SPACESHIP_CHAR_SYMBOL
  unset SPACESHIP_CHAR_COLOR_SUCCESS
  unset SPACESHIP_CHAR_COLOR_FAILURE
  unset SPACESHIP_CHAR_COLOR_SECONDARY
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

testChar() {
  local expected="$NEWLINE%{%B%}%{%b%}%{%B%F{$SPACESHIP_CHAR_COLOR_SUCCESS}%}➜ %{%b%f%}%{%B%}%{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render char" "$expected" "$actual"
}

testCharFailure() {
  local expected="$NEWLINE%{%B%}%{%b%}%{%B%F{$SPACESHIP_CHAR_COLOR_FAILURE}%}➜ %{%b%f%}%{%B%}%{%b%}"
  command false # this command should exit with non-zero code
  local actual="$(spaceship_prompt)"

  assertEquals "render char with failure" "$expected" "$actual"
}

testCharInline() {
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  local expected="%{%B%}%{%b%}%{%B%F{green}%}➜ %{%b%f%}%{%B%}%{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render char without newline" "$expected" "$actual"

  SPACESHIP_PROMPT_ADD_NEWLINE=true
}

testCharSymbol() {
  SPACESHIP_CHAR_SYMBOL='-> '

  local expected="$NEWLINE%{%B%}%{%b%}%{%B%F{green}%}$SPACESHIP_CHAR_SYMBOL%{%b%f%}%{%B%}%{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render char with custom symbol" "$expected" "$actual"
}

testCharPrefix() {
  SPACESHIP_CHAR_PREFIX='prefix'
  SPACESHIP_CHAR_SUFFIX=''

  local expected="$NEWLINE%{%B%}$SPACESHIP_CHAR_PREFIX%{%b%}%{%B%F{green}%}➜ %{%b%f%}%{%B%}$SPACESHIP_CHAR_SUFFIX%{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render char with prefix" "$expected" "$actual"
}

testCharSuffix() {
  SPACESHIP_CHAR_PREFIX=''
  SPACESHIP_CHAR_SUFFIX='suffix'

  local expected="$NEWLINE%{%B%}$SPACESHIP_CHAR_PREFIX%{%b%}%{%B%F{green}%}➜ %{%b%f%}%{%B%}$SPACESHIP_CHAR_SUFFIX%{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render char with suffix" "$expected" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source modules/shunit2/shunit2
