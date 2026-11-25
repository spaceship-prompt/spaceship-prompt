#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "lib/utils.zsh"
  source "lib/cache.zsh"
  source "lib/worker.zsh"
  source "lib/core.zsh"
  original_core_render=$functions[spaceship::core::render]
  source "lib/hooks.zsh"
  source "lib/section.zsh"
  source "lib/prompts.zsh"
  source "sections/async.zsh"

  spaceship_first() { spaceship::section "first"; }
  spaceship_second() { spaceship::section "second"; }
}

setUp() {
  source "async.zsh"
  functions[spaceship::core::render]=$original_core_render

  SPACESHIP_PROMPT_ASYNC=true
  SPACESHIP_FIRST_ASYNC=true
  SPACESHIP_SECOND_ASYNC=true
  SPACESHIP_PROMPT_ORDER=(first second async)
  SPACESHIP_RPROMPT_ORDER=()
  SPACESHIP_JOBS=()
  spaceship::cache::clear
}

tearDown() {
  unfunction zpty 2>/dev/null
  async_stop_worker "spaceship"
  trap - WINCH
}

# ------------------------------------------------------------------------------
# HELPERS
# ------------------------------------------------------------------------------

fail_worker_start() {
  zpty() {
    [[ "$1" == -b ]] && return 1
    builtin zpty "$@"
  }
}

assert_sync_prompt() {
  assertEquals "should disable async rendering" false "$SPACESHIP_PROMPT_ASYNC"
  assertEquals "should not retain canceled jobs" 0 "${#SPACESHIP_JOBS}"
  assertEquals "should render the first section" "$(spaceship_first)" "$(spaceship::cache::get first)"
  assertEquals "should render the second section" "$(spaceship_second)" "$(spaceship::cache::get second)"
  assertContains "prompt should include first section" "$(spaceship::prompt)" first
  assertContains "prompt should include second section" "$(spaceship::prompt)" second
  assertNull "should not show the async indicator" "$(spaceship_async)"
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_worker_start_failure() {
  fail_worker_start
  SPACESHIP_JOBS=(spaceship_first)

  spaceship::worker::init
  assertEquals "should report failed startup" 1 "$?"
  spaceship::core::start

  assert_sync_prompt
  assertNull "should not register a callback for a missing worker" "${ASYNC_CALLBACKS[spaceship]}"
}

test_worker_setup_failure() {
  async_worker_eval() { return 1; }

  spaceship::worker::init
  assertEquals "should report failed setup" 1 "$?"
  spaceship::core::start

  assert_sync_prompt
  builtin zpty -t spaceship 2>/dev/null
  assertEquals "should stop the partially initialized worker" 1 "$?"
}

test_worker_failed_submission_renders_canceled_sections() {
  spaceship::worker::init
  async_job() { return 0; }
  spaceship::core::refresh_section first
  assertEquals "should track accepted work" spaceship_first "$SPACESHIP_JOBS"

  async_job() { return 1; }
  spaceship::core::refresh_section second

  assert_sync_prompt
  builtin zpty -t spaceship 2>/dev/null
  assertEquals "should stop the failed worker" 1 "$?"
}

test_worker_missing_worker_recovery_keeps_replacement_jobs() {
  spaceship::worker::init
  local generation=$SPACESHIP_WORKER_GENERATION
  builtin zpty -d spaceship

  # Let the first submission report the real missing-worker error. Replacement
  # submissions succeed without completing, so their queue can be checked.
  local first_submission=true
  async_job() {
    if $first_submission; then
      first_submission=false
      _async_send_job "$0" "$@"
    else
      return 0
    fi
  }
  spaceship::worker::run spaceship_first

  assertEquals "should preserve async after recovery" true "$SPACESHIP_PROMPT_ASYNC"
  assertEquals "should restart once" "$((generation + 1))" "$SPACESHIP_WORKER_GENERATION"
  assertEquals "should retain replacement jobs" "spaceship_first spaceship_second" "$SPACESHIP_JOBS"
}

test_worker_failed_recovery_renders_synchronously() {
  spaceship::worker::init
  builtin zpty -d spaceship
  fail_worker_start

  spaceship::worker::run spaceship_first

  assert_sync_prompt
}

test_worker_watcher_failure_repaints_sync_prompt() {
  spaceship::worker::init
  fail_worker_start
  local renders=0
  spaceship::core::render() { (( renders += 1 )); }

  spaceship::core::async_callback '[async]' 2 "" 0 "worker failed" 0

  assert_sync_prompt
  assertEquals "should repaint the synchronous fallback" 1 "$renders"
}

test_worker_eval_recovery_repaints_sync_prompt() {
  spaceship::worker::init
  async_job() { return 1; }
  local renders=0
  spaceship::core::render() { (( renders += 1 )); }

  spaceship::core::async_callback '[async/eval]' 1 "" 0 "eval failed" 0

  assert_sync_prompt
  assertEquals "should repaint after submission fails during recovery" 1 "$renders"
}

test_worker_chpwd_start_failure() {
  fail_worker_start

  prompt_spaceship_chpwd
  prompt_spaceship_precmd

  assert_sync_prompt
}

test_worker_async_completion() {
  spaceship::worker::init
  assertEquals "should start the worker" 0 "$?"
  spaceship::core::start

  # Consume actual zsh-async results, with a bounded wait for the worker.
  local attempt
  for attempt in {1..100}; do
    async_process_results spaceship spaceship::core::async_callback
    [[ ${#SPACESHIP_JOBS} == 0 ]] && break
    sleep 0.01
  done

  assertEquals "should keep healthy async rendering" true "$SPACESHIP_PROMPT_ASYNC"
  assertEquals "should drain completed jobs" 0 "${#SPACESHIP_JOBS}"
  assertEquals "should cache the first result" "$(spaceship_first)" "$(spaceship::cache::get first)"
  assertEquals "should cache the second result" "$(spaceship_second)" "$(spaceship::cache::get second)"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
