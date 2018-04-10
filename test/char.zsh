#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

function setUp() {
  export TERM="xterm-256color"

  autoload -U promptinit; promptinit
  prompt spaceship
}

function tearDown() {
  unset SPACESHIP_PROMPT_ORDER
}

function testChar() {
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(char)

  assertEquals "%{%B%}%{%b%}%{%B%F{green}%}➜ %{%b%f%}%{%B%}%{%b%}" "$(spaceship_prompt)"
  unset SPACESHIP_PROMPT_ORDER
}

source shunit2/shunit2
