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

  DOCKER_COMPOSE_STATUSES=(
    "%{%F{green}%}A%{%f%}"  # adminer is up
    "%{%F{red}%}D%{%f%}"    # database is down
    "%{%F{yellow}%}W%{%f%}" # watchtower is paused
  )

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(docker_compose)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_DOCKER_COMPOSE_SHOW="true"
  SPACESHIP_DOCKER_COMPOSE_PREFIX="runs "
  SPACESHIP_DOCKER_COMPOSE_SUFFIX=""
  SPACESHIP_DOCKER_COMPOSE_SYMBOL="🐙 "
  SPACESHIP_DOCKER_COMPOSE_COLOR="cyan"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_DOCKER_COMPOSE_SHOW
  unset SPACESHIP_DOCKER_COMPOSE_PREFIX
  unset SPACESHIP_DOCKER_COMPOSE_SUFFIX
  unset SPACESHIP_DOCKER_COMPOSE_SYMBOL
  unset SPACESHIP_DOCKER_COMPOSE_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_docker_compose_no_files() {
  local no_files_expected=""
  local no_files_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_docker_compose_configs() {
  FILES=(docker-compose.yml docker-compose.yaml compose.yml compose.yaml)
  for file in $FILES; do
    touch $file
    local expected=(
      "%{%B%}$SPACESHIP_DOCKER_COMPOSE_PREFIX%{%b%}"
      "%{%B%F{$SPACESHIP_DOCKER_COMPOSE_COLOR}%}"
      "${SPACESHIP_DOCKER_COMPOSE_SYMBOL}"
      "${(j::)DOCKER_COMPOSE_STATUSES}"
      "%{%b%f%}"
    )
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with $file" "${(j::)expected}" "$actual"
    rm $file
  done
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
