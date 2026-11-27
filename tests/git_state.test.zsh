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
  SPACESHIP_PROMPT_ORDER=(git)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_GIT_SHOW="true"
  SPACESHIP_GIT_PREFIX="on "
  SPACESHIP_GIT_SUFFIX=""
  SPACESHIP_GIT_SYMBOL=" "

  SPACESHIP_GIT_STATE_SHOW="true"
  SPACESHIP_GIT_STATE_PREFIX=" ["
  SPACESHIP_GIT_STATE_SUFFIX="]"
  SPACESHIP_GIT_STATE_COLOR="red"
  SPACESHIP_GIT_STATE_REBASE_REBASING="rebase"
  SPACESHIP_GIT_STATE_REBASE_APPLYING="am"
  SPACESHIP_GIT_STATE_MERGING="merge"
  SPACESHIP_GIT_STATE_REVERTING="revert"
  SPACESHIP_GIT_STATE_CHERRY_PICKING="cherry-pick"
  SPACESHIP_GIT_STATE_BISECTING="bisect"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_GIT_SHOW
  unset SPACESHIP_GIT_PREFIX
  unset SPACESHIP_GIT_SUFFIX
  unset SPACESHIP_GIT_SYMBOL

  unset SPACESHIP_GIT_STATE_SHOW
  unset SPACESHIP_GIT_STATE_PREFIX
  unset SPACESHIP_GIT_STATE_SUFFIX
  unset SPACESHIP_GIT_STATE_COLOR
  unset SPACESHIP_GIT_STATE_REBASE_REBASING
  unset SPACESHIP_GIT_STATE_REBASE_APPLYING
  unset SPACESHIP_GIT_STATE_MERGING
  unset SPACESHIP_GIT_STATE_REVERTING
  unset SPACESHIP_GIT_STATE_CHERRY_PICKING
  unset SPACESHIP_GIT_STATE_BISECTING
}

# ------------------------------------------------------------------------------
# HELPERS
# ------------------------------------------------------------------------------

init_git_repo() {
  git init -q
  git config user.email "test@test.com"
  git config user.name "Test User"
  echo "init" > file.txt
  git add file.txt
  git commit -q -m "initial commit"
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_git_state_no_repo() {
  local no_state_expected=""
  local no_state_actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render state outside git repo" "$no_state_expected" "$no_state_actual"
}

test_git_state_clean() {
  init_git_repo
  local state_part="$(spaceship_git_state)"
  local clean_expected=""
  assertEquals "should return empty string in clean repo" "$clean_expected" "$state_part"
}

test_git_state_rebase_merge() {
  init_git_repo
  mkdir -p .git/rebase-merge
  touch .git/rebase-merge/done
  local state_part="$(spaceship_git_state)"
  assertContains "$state_part" "rebase"
  rm -rf .git/rebase-merge
}

test_git_state_rebase_apply() {
  init_git_repo
  mkdir -p .git/rebase-apply
  touch .git/rebase-apply/applying
  local state_part="$(spaceship_git_state)"
  assertContains "$state_part" "am"
  rm -rf .git/rebase-apply
}

test_git_state_rebase_applying() {
  init_git_repo
  mkdir -p .git/rebase-apply
  touch .git/rebase-apply/done
  local state_part="$(spaceship_git_state)"
  assertContains "$state_part" "rebase"
  rm -rf .git/rebase-apply
}

test_git_state_merge() {
  init_git_repo
  echo "merge-head" > .git/MERGE_HEAD
  local state_part="$(spaceship_git_state)"
  assertContains "$state_part" "merge"
  rm .git/MERGE_HEAD
}

test_git_state_revert() {
  init_git_repo
  echo "revert-head" > .git/REVERT_HEAD
  local state_part="$(spaceship_git_state)"
  assertContains "$state_part" "revert"
  rm .git/REVERT_HEAD
}

test_git_state_cherry_pick() {
  init_git_repo
  echo "cherry-pick-head" > .git/CHERRY_PICK_HEAD
  local state_part="$(spaceship_git_state)"
  assertContains "$state_part" "cherry-pick"
  rm .git/CHERRY_PICK_HEAD
}

test_git_state_bisect() {
  init_git_repo
  echo "bisect log" > .git/BISECT_LOG
  local state_part="$(spaceship_git_state)"
  assertContains "$state_part" "bisect"
  rm .git/BISECT_LOG
}

test_git_state_hidden_when_disabled() {
  init_git_repo
  SPACESHIP_GIT_STATE_SHOW="false"
  echo "merge-head" > .git/MERGE_HEAD
  local state_part="$(spaceship_git_state)"
  assertEquals "" "$state_part"
  rm .git/MERGE_HEAD
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
