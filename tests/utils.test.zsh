#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "lib/utils.zsh"
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_exists() {
  mock() {}

  assertTrue  "command should exist"     '$(spaceship::exists cd)'
  assertFalse "command should not exist" '$(spaceship::exists d41d8cd)'
  assertTrue  "function should exist"    '$(spaceship::exists mock)'
}

test_defined() {
  mock() {}

  assertFalse "command should not exist"  '$(spaceship::defined cd)'
  assertTrue  "function should exist"     '$(spaceship::defined mock)'
  assertFalse "function should not exist" '$(spaceship::defined d41d8cd)'
}

test_is_git() {
  local REPO="$SHUNIT_TMPDIR/utils/is_git"
  mkdir -p $REPO/foo
  cd $REPO
  # Init a Git repo in $REPO
  command git init > /dev/null

  assertTrue "should be a git repo" '$(spaceship::is_git)'
  cd foo
  assertTrue "foo should be in git repo" '$(spaceship::is_git)'
  cd ../..
  assertFalse "should not be a git repo" '$(spaceship::is_git)'
}

test_is_hg() {
  # Skip this test case if Mercurial is not istalled
  if ! spaceship::exists hg; then
    startSkipping
  fi

  local REPO="$SHUNIT_TMPDIR/utils/is_hg"
  mkdir -p $REPO/foo
  mkdir -p "$REPO/../foo with space"
  cd $REPO

  if spaceship::exists hg; then
    command hg init
  fi

  assertTrue "should be a hg repo" '$(spaceship::is_hg)'
  cd foo
  assertTrue "foo should be in hg repo" '$(spaceship::is_hg)'
  cd "../../foo with space"
  assertFalse "'foo with space' directory should not be in hg repo" '$(spaceship::is_hg)'
  cd ../..
  assertFalse "should not be a hg repo" '$(spaceship::is_hg)'

  if isSkipping; then
    endSkipping
  fi
}

test_is_section_async() {
  SPACESHIP_PROMPT_ASYNC=true

  # Test when section is async
  SPACESHIP_FOO_ASYNC=true
  assertTrue "should return sync flag" '$(spaceship::is_section_async foo)'

  # Test when section is not async
  SPACESHIP_FOO_ASYNC=false
  assertFalse "should not return sync flag" '$(spaceship::is_section_async foo)'

  # Should use the default value
  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_FOO_ASYNC=true
  assertFalse "should use global sync flag" '$(spaceship::is_section_async foo)'
  SPACESHIP_PROMPT_ASYNC=true

  # System sections should not be async
  SPACESHIP_USER_ASYNC=true
  assertFalse "user section should be always false" '$(spaceship::is_section_async user)'
  SPACESHIP_DIR_ASYNC=true
  assertFalse "dir section should be always false" '$(spaceship::is_section_async dir)'
  SPACESHIP_HOST_ASYNC=true
  assertFalse "host section should be always false" '$(spaceship::is_section_async host)'
  SPACESHIP_EXEC_TIME_ASYNC=true
  assertFalse "exec_time section should be always false" '$(spaceship::is_section_async exec_time)'
  SPACESHIP_ASYNC_ASYNC=true
  assertFalse "async section should be always false" '$(spaceship::is_section_async async)'
  SPACESHIP_LINE_SEP_ASYNC=true
  assertFalse "line_sep section should be always false" '$(spaceship::is_section_async line_sep)'
  SPACESHIP_JOBS_ASYNC=true
  assertFalse "jobs section should be always false" '$(spaceship::is_section_async jobs)'
  SPACESHIP_EXIT_CODE_ASYNC=true
  assertFalse "exit_code section should be always false" '$(spaceship::is_section_async exit_code)'
  SPACESHIP_CHAR_ASYNC=true
  assertFalse "char section should be always false" '$(spaceship::is_section_async char)'
}

test_is_prompt_async() {
  SPACESHIP_PROMPT_ASYNC=true
  ASYNC_INIT_DONE=1

  assertTrue "should be true when prompt is async" '$(spaceship::is_prompt_async)'

  SPACESHIP_PROMPT_ASYNC=false
  ASYNC_INIT_DONE=1
  assertFalse "should be false when prompt is sync" '$(spaceship::is_prompt_async)'

  SPACESHIP_PROMPT_ASYNC=true
  ASYNC_INIT_DONE=0
  assertFalse "should be false when async is not loaded" '$(spaceship::is_prompt_async)'
}

test_deprecated() {
  SPACESHIP_TEST='deprecated'
  local e_expected="%{%B%}SPACESHIP_TEST%{%b%} is deprecated.%{ %}"
  local expected="$(print -P "$e_expected")"
  local actual=$(spaceship::deprecated SPACESHIP_TEST)

  assertEquals "render deprecation warning" "$expected" "$actual"

  local desc="Use SOMETHING instead!"
  local e_expected=$e_expected$desc
  local expected="$(print -P "$e_expected")"
  local actual=$(spaceship::deprecated SPACESHIP_TEST "$desc")

  assertEquals "render deprecation warning with description" "$expected" "$actual"

  unset SPACESHIP_TEST
}

test_displaytime() {
  local LC_NUMERIC="en_US.UTF-8"
  local expected='14d 6h 56m 7.0s'
  local actual=$(spaceship::displaytime 1234567)

  assertEquals "$expected" "$actual"
}

test_union() {
  local arr1=('a' 'b' 'c') arr2=('b' 'c' 'd') arr3=('c' 'd' 'e')
  local expected=('a' 'b' 'c' 'd' 'e')
  local actual=$(spaceship::union $arr1 $arr2 $arr3)

  assertEquals "union of arrays" "$expected" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
