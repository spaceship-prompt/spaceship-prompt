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

  HELM_VERSION="v3.20.1"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(helm)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_HELM_SHOW="true"
  SPACESHIP_HELM_PREFIX="via "
  SPACESHIP_HELM_SUFFIX=""
  SPACESHIP_HELM_SYMBOL="🔮 "
  SPACESHIP_HELM_COLOR="blue"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_HELM_SHOW
  unset SPACESHIP_HELM_PREFIX
  unset SPACESHIP_HELM_SUFFIX
  unset SPACESHIP_HELM_SYMBOL
  unset SPACESHIP_HELM_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_helm_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}


test_helm_upsearch_file() {
	FILES=(helmfile.yaml Chart.yaml)
	for file in $FILES; do
		touch $file
		local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_HELM_COLOR}%}${SPACESHIP_HELM_SYMBOL}${HELM_VERSION}%{%b%f%}"
		local actual="$(spaceship::testkit::render_prompt)"
		assertEquals "should render with extension for file $file" "$expected" "$actual"
		rm $file
	done
}


# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
