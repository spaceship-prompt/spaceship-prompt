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

  DART_VERSION="2.19.0"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(dart)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_DART_SHOW="true"
  SPACESHIP_DART_PREFIX="via "
  SPACESHIP_DART_SUFFIX=""
  SPACESHIP_DART_SYMBOL="🎯 "
  SPACESHIP_DART_COLOR="blue"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_DART_SHOW
  unset SPACESHIP_DART_PREFIX
  unset SPACESHIP_DART_SUFFIX
  unset SPACESHIP_DART_SYMBOL
  unset SPACESHIP_DART_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$expected" "$actual"
}

test_dart_upsearch_file() {
  FILES=(pubspec.yaml pubspec.yml pubspec.lock)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DART_COLOR}%}${SPACESHIP_DART_SYMBOL}v$DART_VERSION%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_dart_upsearch_dir() {
  DIRS=(dart_tool)
  for dir in $DIRS; do
    mkdir $dir
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DART_COLOR}%}${SPACESHIP_DART_SYMBOL}v$DART_VERSION%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $dir" "$expected" "$actual"
    rm -rf $dir
  done
}

test_dart_file_extension() {
  FILES=(first.dart second.dart)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DART_COLOR}%}${SPACESHIP_DART_SYMBOL}v$DART_VERSION%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_dart_flutter() {
  # alias to mock dart command bundled with flutter
  alias "dart"="printf 'Dart SDK version: 2.18.1 (stable) (Tue Sep 13 11:42:55 2022 +0200) on \"macos_x64\"'\n"
  local DART_VERSION="2.18.1"
  file="main.dart"
  touch $file
  local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DART_COLOR}%}${SPACESHIP_DART_SYMBOL}v$DART_VERSION%{%b%f%}"
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with $file" "$expected" "$actual"
  rm $file
}

test_dart_sdk() {
  # alias to mock dart command installed as dart-sdk
  alias "dart"="printf 'Dart SDK version: 2.19.0-edge.efb509c114dcaf54d0a011f717b48893d71ec9c3 (be) (Thu Sep 29 01:58:56 2022 +0000) on \"macos_x64\"'\n"
  local DART_VERSION="2.19.0"
  file="main.dart"
  touch $file
  local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DART_COLOR}%}${SPACESHIP_DART_SYMBOL}v$DART_VERSION%{%b%f%}"
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with $file" "$expected" "$actual"
  rm $file
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
