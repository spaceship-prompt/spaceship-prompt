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
  SPACESHIP_PROMPT_ORDER=(nix_shell)

  source "spaceship.zsh"
}

setUp() {
  export IN_NIX_SHELL="pure"
  SPACESHIP_NIX_SHELL_SHOW="true"
  SPACESHIP_NIX_SHELL_PREFIX="via "
  SPACESHIP_NIX_SHELL_SUFFIX=" "
  SPACESHIP_NIX_SHELL_SYMBOL="❄ "
  SPACESHIP_NIX_SHELL_COLOR="yellow"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset IN_NIX_SHELL
  unset SPACESHIP_NIX_SHELL_SHOW
  unset SPACESHIP_NIX_SHELL_PREFIX
  unset SPACESHIP_NIX_SHELL_SUFFIX
  unset SPACESHIP_NIX_SHELL_SYMBOL
  unset SPACESHIP_NIX_SHELL_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_nix_shell_no_env() {
  unset IN_NIX_SHELL

  local no_env_expected=""
  local no_env_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without nix shell" "$no_env_expected" "$no_env_actual"
}

test_nix_shell_env() {
  local env_expected="%{%B%}$SPACESHIP_NIX_SHELL_PREFIX%{%b%}%{%B%F{$SPACESHIP_NIX_SHELL_COLOR}%}$SPACESHIP_NIX_SHELL_SYMBOL$IN_NIX_SHELL%{%b%f%}%{%B%}$SPACESHIP_NIX_SHELL_SUFFIX%{%b%}"
  local env_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with nix shell" "$env_expected" "$env_actual"
}

test_nix_shell_env_named() {
  export name="env_name"
  local env_expected="%{%B%}$SPACESHIP_NIX_SHELL_PREFIX%{%b%}%{%B%F{$SPACESHIP_NIX_SHELL_COLOR}%}$SPACESHIP_NIX_SHELL_SYMBOL$IN_NIX_SHELL ($name)%{%b%f%}%{%B%}$SPACESHIP_NIX_SHELL_SUFFIX%{%b%}"
  local env_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with nix shell" "$env_expected" "$env_actual"

}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
