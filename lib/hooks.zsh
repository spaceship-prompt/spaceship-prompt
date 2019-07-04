# ------------------------------------------------------------------------------
# HOOKS
# Zsh hooks for advanced actions
# custom hooks for sections
# ------------------------------------------------------------------------------

# TODO: Let sections register their own hooks via `spaceship::register_hook`

# Execution time start
spaceship_exec_time_preexec_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  SPACESHIP_EXEC_TIME_start=$(date +%s)
}

# Execution time end
spaceship_exec_time_precmd_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  [[ -n $SPACESHIP_EXEC_TIME_duration ]] && unset SPACESHIP_EXEC_TIME_duration
  [[ -z $SPACESHIP_EXEC_TIME_start ]] && return
  local SPACESHIP_EXEC_TIME_stop=$(date +%s)
  SPACESHIP_EXEC_TIME_duration=$(( $SPACESHIP_EXEC_TIME_stop - $SPACESHIP_EXEC_TIME_start ))
  unset SPACESHIP_EXEC_TIME_start
}

# vcs_info hook
spaceship_exec_vcs_info_precmd_hook() {
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return
  vcs_info
}

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