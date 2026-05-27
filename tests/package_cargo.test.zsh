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
  SPACESHIP_PACKAGE_ORDER=(cargo)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_PACKAGE_SHOW="true"
  SPACESHIP_PACKAGE_PREFIX="is "
  SPACESHIP_PACKAGE_SUFFIX=""
  SPACESHIP_PACKAGE_SYMBOL="📦 "
  SPACESHIP_PACKAGE_COLOR="red"

  mkdir -p "$SHUNIT_TMPDIR/.git" # stop upsearch here
  cd "$SHUNIT_TMPDIR"
  rm -f Cargo.toml Cargo.lock
  unfunction cargo &>/dev/null || true
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
  unfunction cargo &>/dev/null || true
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_cargo_pkgid_failure_renders_empty() {
  cargo() {
    printf '\033[31merror:\033[0m failed to load manifest for workspace member\n' >&2
    return 101
  }

  touch Cargo.toml

  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render when cargo pkgid fails" "" "$actual"
}

test_cargo_pkgid_success_renders_crate_version() {
  local prefix="%{%B%}${SPACESHIP_PACKAGE_PREFIX}%{%b%}%{%B%F{$SPACESHIP_PACKAGE_COLOR}%}${SPACESHIP_PACKAGE_SYMBOL}"
  local suffix="%{%b%f%}"
  local pkgid_suffix="spaceship-prompt#4.22.2"
  local version="4.22.2"
  local expected="${prefix}${version}${suffix}"

  cargo() {
    printf 'path+file:///tmp/demo#%s\n' "$pkgid_suffix"
  }

  touch Cargo.toml

  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render the crate@version suffix from cargo pkgid" "$expected" "$actual"
}

source tests/shunit2/shunit2
