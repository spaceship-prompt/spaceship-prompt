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

  PERL_VERSION="5.30.3"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(perl)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_PERL_SHOW="true"
  SPACESHIP_PERL_PREFIX="via "
  SPACESHIP_PERL_SUFFIX=""
  SPACESHIP_PERL_SYMBOL="🐪 "
  SPACESHIP_PERL_COLOR="blue"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_PERL_SHOW
  unset SPACESHIP_PERL_PREFIX
  unset SPACESHIP_PERL_SUFFIX
  unset SPACESHIP_PERL_SYMBOL
  unset SPACESHIP_PERL_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$expected" "$actual"
}

test_perl_upsearch_file() {
  FILES=(META.json META.yml META.yaml .perl-version cpanfile)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}$SPACESHIP_PERL_PREFIX%{%b%}%{%B%F{$SPACESHIP_PERL_COLOR}%}${SPACESHIP_PERL_SYMBOL}v$PERL_VERSION%{%b$SPACESHIP_PERL_SUFFIX%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_perl_file_extension() {
  FILES=(first.pl second.pm)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}$SPACESHIP_PERL_PREFIX%{%b%}%{%B%F{$SPACESHIP_PERL_COLOR}%}${SPACESHIP_PERL_SYMBOL}v$PERL_VERSION%{%b$SPACESHIP_PERL_SUFFIX%f%}"
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
