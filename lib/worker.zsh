#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# WORKER
# Spaceship wrapper around zsh-async
# ------------------------------------------------------------------------------

# Unique array of async jobs
typeset -ahU SPACESHIP_JOBS=()

# Load zsh-async if not loaded yet
spaceship::worker::load() {
  if ! (( ASYNC_INIT_DONE )); then
    builtin source "$SPACESHIP_ROOT/async.zsh"
    spaceship::precompile "$SPACESHIP_ROOT/async.zsh"
  fi
}

# Lower worker priority to avoid slowing down the prompt
spaceship::worker::renice() {
  if command -v renice >/dev/null; then
    command renice +15 -p $$
  fi

  if command -v ionice >/dev/null; then
    command ionice -c 3 -p $$
  fi
}

# This should be called to in callback to update the job counter
spaceship::worker::callback() {
  SPACESHIP_JOBS=("${(@)SPACESHIP_JOBS:#${1}}")
}

# Start the worker and prepare the environment
spaceship::worker::init() {
  if spaceship::is_prompt_async; then
    SPACESHIP_JOBS=()
    # restart worker
    async_stop_worker "spaceship"
    async_start_worker "spaceship" -n -u
    # setopt before call register to avoid callback by async_worker_eval
    async_worker_eval "spaceship" setopt extendedglob
    async_worker_eval "spaceship" spaceship::worker::renice
    async_register_callback "spaceship" spaceship::core::async_callback
  fi
}

# Flush jobs for stopped worker
spaceship::worker::flush() {
  if spaceship::is_prompt_async; then
    async_flush_jobs "spaceship"
  fi
}

# Eval command inside the worker
spaceship::worker::eval() {
  if spaceship::is_prompt_async; then
    async_worker_eval "spaceship" "$@"
  fi
}

# Run a job in a worker
spaceship::worker::run() {
  if spaceship::is_prompt_async; then
    SPACESHIP_JOBS+=("$1")
    async_job "spaceship" "$@"
  fi
}
