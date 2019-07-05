# ------------------------------------------------------------------------------
# HOOKS
# Zsh hooks for advanced actions
# custom hooks for sections
# ------------------------------------------------------------------------------

# TODO: Let sections register their own hooks via `spaceship::register_hook`

# Execution time start
spaceship_exec_time_preexec_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return

  # The Timer is started here, but the end
  # is taken in spaceship::prepare_prompts, as this
  # method is a precmd hook and runs right
  # before the prompt gets rendered. So we
  # can calculate the duration there.
  SPACESHIP_EXEC_TIME_start=${EPOCHREALTIME}
}

# Execution time end
spaceship_exec_time_precmd_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return

  SPACESHIP_EXEC_TIME_duration=$((EPOCHREALTIME - SPACESHIP_EXEC_TIME_start))

  # Reset start time
  SPACESHIP_EXEC_TIME_start=0x7FFFFFFF
}

# vcs_info hook
spaceship_exec_vcs_info_precmd_hook() {
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return
  vcs_info
}

# Hook to save exit code and prepare prompts
spaceship::prepare_prompts() {
  # Retrieve exit code of last command to use in exit_code
  # Must be captured before any other command in prompt is executed
  # Must be the very first line in all entry prompt functions, or the value
  # will be overridden by a different command execution - do not move this line!
  RETVAL=$?
  RETVALS=( "$pipestatus[@]" )

  # Stop measuring exec_time, must be the first precmd action
  spaceship_exec_time_precmd_hook

  # Restarts just the worker - in order to update worker with current shell values
  if [[ "${__SS_DATA[async]}" == "true" ]]; then
    # restart async worker, all unfetched and incomplete work will be lost
    async_stop_worker "spaceship_async_worker"
    async_start_worker "spaceship_async_worker" -n
    # setopt before call register to avoid callback by async_worker_eval
    async_worker_eval "spaceship_async_worker" 'setopt extendedglob'
    async_register_callback "spaceship_async_worker" "spaceship::async_callback"
  fi

  spaceship::compose_prompt
}

spaceship::chpwd_hook() {
  spaceship_exec_time_preexec_hook
}