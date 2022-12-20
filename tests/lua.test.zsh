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

  LUA_VERSION="5.4.4"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(lua)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_LUA_SHOW="true"
  SPACESHIP_LUA_PREFIX="via "
  SPACESHIP_LUA_SUFFIX=""
  SPACESHIP_LUA_SYMBOL="🌙 "
  SPACESHIP_LUA_COLOR="cyan"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_LUA_SHOW
  unset SPACESHIP_LUA_PREFIX
  unset SPACESHIP_LUA_SUFFIX
  unset SPACESHIP_LUA_SYMBOL
  unset SPACESHIP_LUA_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_lua_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$expected" "$actual"
}

test_lua_upsearch_file() {
  FILES=(.lua-version)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_LUA_COLOR}%}${SPACESHIP_LUA_SYMBOL}v${LUA_VERSION}%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with file $file" "$expected" "$actual"
    rm $file
  done
}

test_lua_upsearch_dir() {
  DIRS=(lua)
  for dir in $DIRS; do
    mkdir $dir
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_LUA_COLOR}%}${SPACESHIP_LUA_SYMBOL}v${LUA_VERSION}%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with dir $dir" "$expected" "$actual"
    rm -rf $dir
  done
}

test_lua_file_extension() {
  FILES=(first.lua second.lua)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_LUA_COLOR}%}${SPACESHIP_LUA_SYMBOL}v${LUA_VERSION}%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with extension for file $file" "$expected" "$actual"
    rm $file
  done
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
