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

  OCAML_VERSION="4.14.0"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(ocaml)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_OCAML_SHOW="true"
  SPACESHIP_OCAML_PREFIX="via "
  SPACESHIP_OCAML_SUFFIX=""
  SPACESHIP_OCAML_SYMBOL="🐫 "
  SPACESHIP_OCAML_COLOR="yellow"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_OCAML_SHOW
  unset SPACESHIP_OCAML_PREFIX
  unset SPACESHIP_OCAML_SUFFIX
  unset SPACESHIP_OCAML_SYMBOL
  unset SPACESHIP_OCAML_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_ocaml_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_ocaml_directories() {
  DIRS=(_opam esy.lock)
  for dir in $DIRS; do
    touch $dir
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_OCAML_COLOR}%}${SPACESHIP_OCAML_SYMBOL}v$OCAML_VERSION%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $dir" "$expected" "$actual"
    rm -f $dir
  done
}

test_ocaml_files() {
  FILES=(dune dune-project jbuild jbuild-ignore .merlin)
  for file in $FILES; do
    touch $file
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_OCAML_COLOR}%}${SPACESHIP_OCAML_SYMBOL}v$OCAML_VERSION%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "$expected" "$actual"
    rm $file
  done
}

test_ocaml_extensions() {
  EXTENSIONS=(ml mli re rei)
  for ext in $EXTENSIONS; do
    touch "file.$ext"
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_OCAML_COLOR}%}${SPACESHIP_OCAML_SYMBOL}v$OCAML_VERSION%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with .$ext files" "$expected" "$actual"
    rm "file.$ext"
  done
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
