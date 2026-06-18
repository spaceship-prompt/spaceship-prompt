#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"
  TEST_REPO_ROOT="$PWD"
  export SPACESHIP_CONFIG="$TEST_REPO_ROOT/tests/stubs/missing-spaceship-config"

  source "lib/utils.zsh"
  source "lib/config.zsh"
}

setUp() {
  ORIGINAL_PWD="$PWD"
  LOAD_SECTIONS_CALLS=0

  SPACESHIP_PER_DIRECTORY_CONFIG=false
  SPACESHIP_PER_DIRECTORY_CONFIG_FILE=".spaceshiprc"
  SPACESHIP_PROMPT_ORDER=(user dir)
  SPACESHIP_RPROMPT_ORDER=()
  SPACESHIP_USER_SHOW=true
  SPACESHIP_GIT_ORDER=(git_branch git_status git_commit)

  unset SPACESHIP_HOST_SHOW
  unset SPACESHIP_LOCAL_ONLY

  _SPACESHIP_CONFIG_BASELINE=()
  _SPACESHIP_CONFIG_FILES=()
  _SPACESHIP_CONFIG_BASELINE_READY=false

  spaceship::core::load_sections() {
    (( LOAD_SECTIONS_CALLS += 1 ))
  }
}

tearDown() {
  cd "$ORIGINAL_PWD"
  export SPACESHIP_CONFIG="$TEST_REPO_ROOT/tests/stubs/missing-spaceship-config"

  unset SPACESHIP_PER_DIRECTORY_CONFIG
  unset SPACESHIP_PER_DIRECTORY_CONFIG_FILE
  unset SPACESHIP_PROMPT_ORDER
  unset SPACESHIP_RPROMPT_ORDER
  unset SPACESHIP_USER_SHOW
  unset SPACESHIP_GCLOUD_SHOW
  unset SPACESHIP_GIT_ORDER
  unset SPACESHIP_HOST_SHOW
  unset SPACESHIP_LOCAL_ONLY
  unset LOAD_SECTIONS_CALLS

  if (( $+functions[spaceship::core::load_sections] )); then
    unset -f spaceship::core::load_sections
  fi
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_per_directory_config_disabled_when_flag_false() {
  local repo="$SHUNIT_TMPDIR/config/disabled"
  mkdir -p "$repo"
  print "SPACESHIP_USER_SHOW=always" > "$repo/.spaceshiprc"

  spaceship::config::capture_baseline
  cd "$repo"
  spaceship::config::apply_per_directory

  assertEquals "should not load local config when disabled" true "$SPACESHIP_USER_SHOW"
}

test_per_directory_config_overrides_baseline() {
  local repo="$SHUNIT_TMPDIR/config/enabled"
  mkdir -p "$repo"
  print "SPACESHIP_USER_SHOW=always" > "$repo/.spaceshiprc"

  SPACESHIP_PER_DIRECTORY_CONFIG=true
  spaceship::config::capture_baseline

  cd "$repo"
  spaceship::config::apply_per_directory

  assertEquals "should apply local config" always "$SPACESHIP_USER_SHOW"
}

test_per_directory_config_stacks_parent_to_child() {
  local parent="$SHUNIT_TMPDIR/config/stacked"
  local child="$parent/child"
  mkdir -p "$child"
  print "SPACESHIP_USER_SHOW=always\nSPACESHIP_GIT_ORDER=(git_branch)" > "$parent/.spaceshiprc"
  print "SPACESHIP_USER_SHOW=false" > "$child/.spaceshiprc"

  SPACESHIP_PER_DIRECTORY_CONFIG=true
  spaceship::config::capture_baseline

  cd "$child"
  spaceship::config::apply_per_directory

  assertEquals "child should override parent" false "$SPACESHIP_USER_SHOW"
  assertEquals "parent config should still apply" "git_branch" "${(j: :)SPACESHIP_GIT_ORDER}"
}

test_per_directory_config_restores_baseline_when_leaving() {
  local configured="$SHUNIT_TMPDIR/config/restore/project"
  local plain="$SHUNIT_TMPDIR/config/restore/plain"
  mkdir -p "$configured" "$plain"
  print "SPACESHIP_USER_SHOW=always\nSPACESHIP_LOCAL_ONLY=value" > "$configured/.spaceshiprc"

  SPACESHIP_PER_DIRECTORY_CONFIG=true
  spaceship::config::capture_baseline

  cd "$configured"
  spaceship::config::apply_per_directory
  assertEquals "should apply configured directory" always "$SPACESHIP_USER_SHOW"
  assertEquals "should set local-only option" value "$SPACESHIP_LOCAL_ONLY"

  cd "$plain"
  spaceship::config::apply_per_directory

  assertEquals "should restore baseline option" true "$SPACESHIP_USER_SHOW"
  assertNull "should remove local-only option" "$SPACESHIP_LOCAL_ONLY"
}

test_per_directory_config_skips_global_config_file() {
  local home="$SHUNIT_TMPDIR/config/global"
  local project="$home/project"
  mkdir -p "$project"
  export SPACESHIP_CONFIG="$home/.spaceshiprc"
  print "SPACESHIP_USER_SHOW=always" > "$SPACESHIP_CONFIG"

  SPACESHIP_PER_DIRECTORY_CONFIG=true
  spaceship::config::capture_baseline

  cd "$project"
  spaceship::config::apply_per_directory

  assertEquals "should not source global config as local config" true "$SPACESHIP_USER_SHOW"
}

test_per_directory_config_reloads_sections_when_order_changes() {
  local repo="$SHUNIT_TMPDIR/config/order"
  mkdir -p "$repo"
  print "SPACESHIP_PROMPT_ORDER=(user git)" > "$repo/.spaceshiprc"

  SPACESHIP_PER_DIRECTORY_CONFIG=true
  spaceship::config::capture_baseline

  cd "$repo"
  spaceship::config::apply_per_directory

  assertEquals "should reload sections after prompt order changes" 1 "$LOAD_SECTIONS_CALLS"
  assertEquals "should keep local prompt order" "user git" "${(j: :)SPACESHIP_PROMPT_ORDER}"
}

test_per_directory_config_captures_late_zshrc_assignment() {
  local parent="$SHUNIT_TMPDIR/config/late-zshrc"
  local child="$parent/child"
  mkdir -p "$child"
  print "SPACESHIP_USER_SHOW=always" > "$parent/.spaceshiprc"
  print "SPACESHIP_GCLOUD_SHOW=true" > "$child/.spaceshiprc"

  SPACESHIP_PER_DIRECTORY_CONFIG=true

  # Simulate a section default loaded before the user's later .zshrc assignment.
  SPACESHIP_GCLOUD_SHOW=true
  SPACESHIP_GCLOUD_SHOW=false

  cd "$child"
  spaceship::config::sync_per_directory
  assertEquals "child config should override late zshrc assignment" true "$SPACESHIP_GCLOUD_SHOW"

  cd "$parent"
  spaceship::config::apply_per_directory

  assertEquals "parent should restore late zshrc assignment" false "$SPACESHIP_GCLOUD_SHOW"
}

test_per_directory_sync_does_not_reapply_after_baseline_capture() {
  SPACESHIP_PER_DIRECTORY_CONFIG=true
  SPACESHIP_GCLOUD_SHOW=false

  spaceship::config::sync_per_directory
  SPACESHIP_GCLOUD_SHOW=manual
  spaceship::config::sync_per_directory

  assertEquals "sync should not reset runtime assignments after startup" manual "$SPACESHIP_GCLOUD_SHOW"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
