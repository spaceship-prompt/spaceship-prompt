#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

function setUp() {
  export TERM="xterm-256color"

  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(dir)

  autoload -U promptinit; promptinit
  prompt spaceship
}

function tearDown() {
  unset SPACESHIP_PROMPT_ORDER
}

function testHomeDirectory () {
  cd ~

  assertEquals "%{%B%}%{%b%}%{%B%F{cyan}%}%3~%{%b%f%}%{%B%} %{%b%}" "$(spaceship_prompt)"
}

function testGitRepoTruncatedSubdirectoty() {
  FOLDER=/tmp/spaceship-test/dir1/dir2/dir3
  mkdir -p $FOLDER/dir4/dir5

  cd $FOLDER
  command git init >/dev/null

  cd $FOLDER/dir4/dir5

  assertEquals "%{%B%}%{%b%}%{%B%F{cyan}%}dir3/dir4/dir5%{%b%f%}%{%B%} %{%b%}" "$(spaceship_prompt)"

  rm -rf /tmp/spaceship-test
}

function testGitSubmoduleTruncatedDirectory() {
  FOLDER=/tmp/spaceship-test/dir1/dir2/dir3
  MODULE_FOLDER=/tmp/spaceship-test/dir1/dir2/dir4

  mkdir -p $FOLDER
  mkdir -p $MODULE_FOLDER

  cd $MODULE_FOLDER
  command git init >/dev/null
  command touch sample.txt
  command git add sample.txt >/dev/null
  command git commit -m  "Add sample file" >/dev/null

  cd $FOLDER
  command git init >/dev/null
  command touch sample.txt
  command git add sample.txt >/dev/null
  command git commit -m "Add sample file" >/dev/null
  command git submodule add $MODULE_FOLDER 2&>/dev/null

  cd dir4
  assertEquals "%{%B%}%{%b%}%{%B%F{cyan}%}dir4%{%b%f%}%{%B%} %{%b%}" "$(spaceship_prompt)"

  rm -rf /tmp/spaceship-test
}

source shunit2/shunit2
