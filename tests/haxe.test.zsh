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
  SPACESHIP_PROMPT_ORDER=(haxe)
  HAXE_VERSION="4.3.1"
  
  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_HAXE_SHOW="true"
  SPACESHIP_HAXE_PREFIX="with "
  SPACESHIP_HAXE_SUFFIX=" "
  SPACESHIP_HAXE_SYMBOL="⌘ "
  SPACESHIP_HAXE_COLOR="166"
  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_HAXE_SHOW
  unset SPACESHIP_HAXE_PREFIX
  unset SPACESHIP_HAXE_SUFFIX
  unset SPACESHIP_HAXE_SYMBOL
  unset SPACESHIP_HAXE_COLOR
}

test_haxe_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_haxe_configs() {
  FILES=(project.xml Project.xml application.xml haxelib.json hxformat.json .haxerc)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}$SPACESHIP_HAXE_PREFIX%{%b%}%{%B%F{$SPACESHIP_HAXE_COLOR}%}$SPACESHIP_HAXE_SYMBOL$HAXE_VERSION%{%b%f%}%{%B%} %{%b%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_haxe_files() {
  FILES=(build.hxml main.hx)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}$SPACESHIP_HAXE_PREFIX%{%b%}%{%B%F{$SPACESHIP_HAXE_COLOR}%}$SPACESHIP_HAXE_SYMBOL$HAXE_VERSION%{%b%f%}%{%B%} %{%b%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------
source tests/shunit2/shunit2
