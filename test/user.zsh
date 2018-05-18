#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

function setUp() {
  export TERM="xterm-256color"

  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_USER_SHOW='always'
  SPACESHIP_PROMPT_ORDER=(user)

  autoload -U promptinit; promptinit
  prompt spaceship
}

function tearDown() {
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_USER_SHOW
  unset SPACESHIP_PROMPT_ORDER
}

function testUser() {
  assertEquals "%{%B%}%{%b%}%{%B%F{yellow}%}%n%{%b%f%}%{%B%} %{%b%}" "$(spaceship_prompt)"
}

source shunit2/shunit2
