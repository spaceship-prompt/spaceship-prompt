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
  SPACESHIP_PACKAGE_ORDER=(maven)

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
test_maven_no_exec_found() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without mvn or mvnw" "$expected" "$actual"
}

test_maven_exe_mvnw() {
  local prefix="%{%B%}${SPACESHIP_PACKAGE_PREFIX}%{%b%}%{%B%F{$SPACESHIP_PACKAGE_COLOR}%}${SPACESHIP_PACKAGE_SYMBOL}"
  local suffix="%{%b%f%}"
  local mocked_version="2.1.0-SNAPSHOT"
  local expected="${prefix}${mocked_version}${suffix}"
  echo "printf ${mocked_version}" >> ./mvnw && chmod +x ./mvnw
  local file="pom.xml"
  touch $file

  actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with $file" "$expected" "$actual"
  rm $file
  rm mvnw
}

test_maven_exe_mvn() {
  local prefix="%{%B%}${SPACESHIP_PACKAGE_PREFIX}%{%b%}%{%B%F{$SPACESHIP_PACKAGE_COLOR}%}${SPACESHIP_PACKAGE_SYMBOL}"
  local suffix="%{%b%f%}"
  local mocked_version="2.1.0-SNAPSHOT"
  local expected="${prefix}${mocked_version}${suffix}"
  local mvn() { printf ${mocked_version} }
  local file="pom.xml"
  touch $file

  actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with $file" "$expected" "$actual"
  rm $file
}

test_maven_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$expected" "$actual"
}

test_maven_upsearch_files() {
  local prefix="%{%B%}${SPACESHIP_PACKAGE_PREFIX}%{%b%}%{%B%F{$SPACESHIP_PACKAGE_COLOR}%}${SPACESHIP_PACKAGE_SYMBOL}"
  local suffix="%{%b%f%}"
  local mocked_version="2.1.0-SNAPSHOT"
  local mvn() { printf ${mocked_version} }
  local expected="${prefix}${mocked_version}${suffix}"

  FILES=( pom.xml )
  for file in $FILES; do
    touch $file
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_non_parseble_pom() {
  local output="[ERROR] Some problems were encountered while processing the POMs: [FATAL] Non-parseable POM"
  mvn() { printf ${output}; exit 1; }
  local expected="" # empty string

  FILES=( pom.xml )
  for file in $FILES; do
    touch $file
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

source tests/shunit2/shunit2
