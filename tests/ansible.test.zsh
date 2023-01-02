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

  ANSIBLE_VERSION="2.13.5"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(ansible)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_ANSIBLE_SHOW="true"
  SPACESHIP_ANSIBLE_PREFIX="via "
  SPACESHIP_ANSIBLE_SUFFIX=""
  SPACESHIP_ANSIBLE_SYMBOL="🅐 "
  SPACESHIP_ANSIBLE_COLOR="white"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_ANSIBLE_SHOW
  unset SPACESHIP_ANSIBLE_PREFIX
  unset SPACESHIP_ANSIBLE_SUFFIX
  unset SPACESHIP_ANSIBLE_SYMBOL
  unset SPACESHIP_ANSIBLE_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_ansible_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_ansible_configs() {
  FILES=(ansible.cfg .ansible.cfg)
  for file in $FILES; do
    touch $file
    local expected=(
      "%{%B%}$SPACESHIP_ANSIBLE_PREFIX%{%b%}"
      "%{%B%F{$SPACESHIP_ANSIBLE_COLOR}%}"
      "${SPACESHIP_ANSIBLE_SYMBOL}"
      "v$ANSIBLE_VERSION%{%b%f%}"
    )
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "${(j::)expected}" "$actual"
    rm $file
  done
}

test_ansible_playbooks() {
  FILES=(playbook.yml playbook.yaml)
  for file in $FILES; do
    touch $file
    echo "tasks: []" > $file
    local expected=(
      "%{%B%}$SPACESHIP_ANSIBLE_PREFIX%{%b%}"
      "%{%B%F{$SPACESHIP_ANSIBLE_COLOR}%}"
      "${SPACESHIP_ANSIBLE_SYMBOL}"
      "v$ANSIBLE_VERSION"
      "%{%b%f%}"
    )
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "${(j::)expected}" "$actual"
    rm $file
  done
}

test_ansible_yml_files() {
  FILES=(regular.yml regular.yaml)
  for file in $FILES; do
    touch $file
    local expected=""
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
