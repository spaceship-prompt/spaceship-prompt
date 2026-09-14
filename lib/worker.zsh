#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# WORKER
# Spaceship wrapper around zsh-async
# ------------------------------------------------------------------------------

# Unique array of async jobs
typeset -ahU SPACESHIP_JOBS=()
typeset -gi SPACESHIP_WORKER_GENERATION=0

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

# Fall back to synchronous rendering when the worker cannot accept work
spaceship::worker::disable() {
  SPACESHIP_PROMPT_ASYNC=false
  async_stop_worker "spaceship"
  SPACESHIP_JOBS=()
}

# Start the worker and prepare the environment
spaceship::worker::init() {
  if spaceship::is_prompt_async; then
    SPACESHIP_JOBS=()
    (( SPACESHIP_WORKER_GENERATION += 1 ))
    # restart worker
    async_stop_worker "spaceship"
    # Prepare the environment before registering the callback to avoid reentry
    # from async_worker_eval. Failed setup must not leave async rendering enabled.
    if async_start_worker "spaceship" -n -u \
      && async_worker_eval "spaceship" setopt extendedglob \
      && async_worker_eval "spaceship" spaceship::worker::renice \
      && async_register_callback "spaceship" spaceship::core::async_callback; then
      return 0
    fi
    spaceship::worker::disable
    return 1
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
    local generation=$SPACESHIP_WORKER_GENERATION
    SPACESHIP_JOBS+=("$1")
    if ! async_job "spaceship" "$@"; then
      # zsh-async can invoke the error callback synchronously and restart the
      # worker. Do not discard the replacement worker's queued jobs.
      if (( generation == SPACESHIP_WORKER_GENERATION )); then
        spaceship::worker::disable
        # Stopping the worker cancels earlier jobs too; rebuild their sections.
        spaceship::core::start
      fi
      return 1
    fi
  fi
}
