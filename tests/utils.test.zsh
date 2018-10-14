#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  source lib/utils.zsh
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
  cd $REPO

  if spaceship::exists hg; then
    command hg init
  fi

  assertTrue "should be a hg repo" '$(spaceship::is_hg)'
  cd foo
  assertTrue "foo should be in hg repo" '$(spaceship::is_hg)'
  cd ../..
  assertFalse "should not be a hg repo" '$(spaceship::is_hg)'

  if isSkipping; then
    endSkipping
  fi
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
  local expected='14d 6h 56m 7s'
  local actual=$(spaceship::displaytime 1234567)

  assertEquals "$expected" "$actual"
}

test_union() {
  local arr1=('a' 'b' 'c') arr2=('b' 'c' 'd') arr3=('c' 'd' 'e')
  local expected=('a' 'b' 'c' 'd' 'e')
  local actual=$(spaceship::union $arr1 $arr2 $arr3)

  assertEquals "union of arrays" "$expected" "$actual"
}

test_parse_semver() {
  spaceship::parse_semver asdf

  assertFalse "return false when parsing invalid semver" "$?"

  local expected=('3' '2' '1' 'alpha.2' 'build1')
  local actual=$(spaceship::parse_semver 3.2.1-alpha.2+build1)

  assertEquals "parse full semver" "$expected" "$actual"

  local expected=('3' '2' '1')
  local actual=$(spaceship::parse_semver 3.2.1)

  assertEquals "parse base semver" "$expected" "$actual"

  local expected=('3' '2' '1' 'build1')
  local actual=$(spaceship::parse_semver 3.2.1+build1)

  assertEquals "parse semver without prerelease" "$expected" "$actual"

  local expected=('3' '2' '1' 'alpha.2')
  local actual=$(spaceship::parse_semver 3.2.1-alpha.2)

  assertEquals "parse semver without build" "$expected" "$actual"
}

test_compare_semver() {
  local expected=0
  local actual="$(spaceship::compare_semver 1.2.3 1.2.3)"

  assertEquals "identical versions" "$expected" "$actual"

  local expected=1
  local actual="$(spaceship::compare_semver 0.19.0 0.18.1)"

  assertEquals "semver1 greater than semver2" "$expected" "$actual"

  local expected=-1
  local actual="$(spaceship::compare_semver 1.2.3 1.2.4)"

  assertEquals "semver1 less than semver2" "$expected" "$actual"

  # For testing the pre-releases, this list is strictly increasing in value
  local versions=(
    '1.0.0-alpha'
    '1.0.0-alpha.1'
    '1.0.0-alpha.beta'
    '1.0.0-beta'
    '1.0.0-beta.2'
    '1.0.0-beta.11'
    '1.0.0-rc.1'
    '1.0.0'
  )
  for (( i = 1; i <= ${#versions} - 1; i++ )); do
    local v1="${versions[$i]}"
    local v2="${versions[(( i + 1 ))]}"

    local expected=-1
    local actual="$(spaceship::compare_semver ${v1} ${v2})"

    assertEquals "pre-release ${v1} less than ${v2}" "$expected" "$actual"
  done

  local actual=$(spaceship::compare_semver 1.2.3 1.23)

  assertFalse "return false on parse error" $actual
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source modules/shunit2/shunit2
