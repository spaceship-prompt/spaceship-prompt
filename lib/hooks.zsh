# ------------------------------------------------------------------------------
# HOOKS
# Zsh hooks for advanced actions
# custom hooks for sections
# ------------------------------------------------------------------------------

# Execution time start
spaceship_exec_time_start() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  SPACESHIP_EXEC_TIME_start=$(date +%s)
}

# Execution time end
spaceship_exec_time_stop() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  [[ -n $SPACESHIP_EXEC_TIME_duration ]] && unset SPACESHIP_EXEC_TIME_duration
  [[ -z $SPACESHIP_EXEC_TIME_start ]] && return
  local SPACESHIP_EXEC_TIME_stop=$(date +%s)
  SPACESHIP_EXEC_TIME_duration=$(( $SPACESHIP_EXEC_TIME_stop - $SPACESHIP_EXEC_TIME_start ))
  unset SPACESHIP_EXEC_TIME_start
}

# A hook before every command
prompt_spaceship_precmd() {
  # Retrieve exit code of last command to use in exit_code
  # Must be captured before any other command in prompt is executed
  # Must be the very first line in all entry prompt functions, or the value
  # will be overridden by a different command execution - do not move this line!
  RETVAL=$?
  RETVALS=("$pipestatus[@]")

  # Stop measuring exec_time, must be the first precmd action
  spaceship_exec_time_stop

  # Restarts the async worker, in order to get an update-to-date shell environment
  if $(spaceship::is_async); then
    async_stop_worker "spaceship"
    async_start_worker "spaceship" #-n
    # setopt before call register to avoid callback by async_worker_eval
    async_worker_eval "spaceship" 'setopt extendedglob'
    async_register_callback "spaceship" "spaceship::async_callback"
  fi

  # Start caching
  spaceship::build_section_cache
}

# A hook right before the command is started executing
prompt_spaceship_preexec() {
  # Stop running prompt async jobs
  if $(spaceship::is_async); then
    async_flush_jobs "spaceship"
  fi

  # Start measuring exec_time right before executing the command
  spaceship_exec_time_start
}

# A hook after changing the working directory
prompt_spaceship_chpwd() {
  if $(spaceship::is_async); then
    async_worker_eval "spaceship" 'cd' "$PWD"
  fi

  # Restart execution time recording once dir is changed
  spaceship_exec_time_start
}
