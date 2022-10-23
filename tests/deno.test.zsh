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

  DENO_VERSION="$($PWD/tests/stubs/deno)"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(deno)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_DENO_SHOW="true"
  SPACESHIP_DENO_PREFIX="via "
  SPACESHIP_DENO_SUFFIX=""
  SPACESHIP_DENO_SYMBOL="🦕 "
  SPACESHIP_DENO_COLOR="cyan"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_DENO_SHOW
  unset SPACESHIP_DENO_PREFIX
  unset SPACESHIP_DENO_SUFFIX
  unset SPACESHIP_DENO_SYMBOL
  unset SPACESHIP_DENO_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_deno_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_deno_configs() {
  touch deno.json

  local json_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DENO_COLOR}%}${SPACESHIP_DENO_SYMBOL}v$DENO_VERSION%{%b%f%}"
  local json_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with deno.json" "$json_expected" "$json_actual"

  rm deno.json
  touch deno.jsonc

  local jsonc_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DENO_COLOR}%}${SPACESHIP_DENO_SYMBOL}v$DENO_VERSION%{%b%f%}"
  local jsonc_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with deno.jsonc" "$jsonc_expected" "$jsonc_actual"
}

test_deno_files() {
  touch mod.ts
  local mod_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DENO_COLOR}%}${SPACESHIP_DENO_SYMBOL}v${DENO_VERSION}%{%b%f%}"
  local mod_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with mod.ts" "$mod_expected" "$mod_actual"
  rm mod.ts

  touch dep.ts
  local dep_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DENO_COLOR}%}${SPACESHIP_DENO_SYMBOL}v${DENO_VERSION}%{%b%f%}"
  local dep_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with dep.ts" "$dep_expected" "$dep_actual"
  rm dep.ts

  touch main.ts
  local main_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DENO_COLOR}%}${SPACESHIP_DENO_SYMBOL}v${DENO_VERSION}%{%b%f%}"
  local main_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with main.ts" "$main_expected" "$main_actual"
  rm main.ts

  touch cli.ts
  local cli_expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_DENO_COLOR}%}${SPACESHIP_DENO_SYMBOL}v${DENO_VERSION}%{%b%f%}"
  local cli_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should render with cli.ts" "$cli_expected" "$cli_actual"
  rm cli.ts
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
