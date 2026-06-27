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
  SPACESHIP_PROMPT_ORDER=(package)
  SPACESHIP_PACKAGE_ORDER=(gradle)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_PACKAGE_SHOW="true"
  SPACESHIP_PACKAGE_PREFIX="is "
  SPACESHIP_PACKAGE_SUFFIX=""
  SPACESHIP_PACKAGE_SYMBOL="📦 "
  SPACESHIP_PACKAGE_COLOR="red"

  mkdir -p "$SHUNIT_TMPDIR/.git"   # stop upsearch here
  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_PACKAGE_SHOW
  unset SPACESHIP_PACKAGE_PREFIX
  unset SPACESHIP_PACKAGE_SUFFIX
  unset SPACESHIP_PACKAGE_SYMBOL
  unset SPACESHIP_PACKAGE_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------
test_gradle_no_exec_found() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without gradle or gradlew" "$expected" "$actual"
}

test_gradle_exe_gradlew() {
  local prefix="%{%B%}${SPACESHIP_PACKAGE_PREFIX}%{%b%}%{%B%F{$SPACESHIP_PACKAGE_COLOR}%}${SPACESHIP_PACKAGE_SYMBOL}"
  local suffix="%{%b%f%}"
  local mocked_version="2.1.0-SNAPSHOT"
  local expected="${prefix}${mocked_version}${suffix}"
  echo "printf \"version: ${mocked_version}\"" >> ./gradlew && chmod +x ./gradlew
  local file="settings.gradle.kts"
  touch $file

  actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with $file" "$expected" "$actual"
  rm $file
  rm gradlew
}

test_gradle_exe_gradle() {
  local prefix="%{%B%}${SPACESHIP_PACKAGE_PREFIX}%{%b%}%{%B%F{$SPACESHIP_PACKAGE_COLOR}%}${SPACESHIP_PACKAGE_SYMBOL}"
  local suffix="%{%b%f%}"
  local mocked_version="2.1.0-SNAPSHOT"
  local gradle() { printf "version: ${mocked_version}"; }
  local expected="${prefix}${mocked_version}${suffix}"
  local file="settings.gradle.kts"
  touch $file

  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with $file" "$expected" "$actual"
  rm $file
}

test_gradle_upsearch_files() {
  local prefix="%{%B%}${SPACESHIP_PACKAGE_PREFIX}%{%b%}%{%B%F{$SPACESHIP_PACKAGE_COLOR}%}${SPACESHIP_PACKAGE_SYMBOL}"
  local suffix="%{%b%f%}"
  local mocked_version="2.1.0-SNAPSHOT"
  local gradle() { printf "version: ${mocked_version}"; }
  local expected="${prefix}${mocked_version}${suffix}"

  FILES=( settings.gradle settings.gradle.kts )
  for file in $FILES; do
    touch $file
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_gradle_with_unspecified_version() {
  local gradle() { printf "version: unspecified"; }
  local expected="" # empty string

  FILES=( settings.gradle settings.gradle.kts )
  for file in $FILES; do
    touch $file
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

source tests/shunit2/shunit2
