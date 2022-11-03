#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# HOOKS
# Zsh hooks for advanced actions
# custom hooks for sections
# ------------------------------------------------------------------------------

# Execution time start
spaceship_exec_time_start() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return

  # The Timer is started here, but the end is taken in prompt_spaceship_precmd,
  # as this method is a precmd hook and runs right before the prompt gets rendered.
  # So we can calculate the duration there.
  SPACESHIP_EXEC_TIME_start=$EPOCHREALTIME
}

# Execution time end
spaceship_exec_time_stop() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  [[ -n $SPACESHIP_EXEC_TIME_duration ]] && unset SPACESHIP_EXEC_TIME_duration
  [[ -z $SPACESHIP_EXEC_TIME_start ]] && return

  SPACESHIP_EXEC_TIME_duration=$((EPOCHREALTIME - SPACESHIP_EXEC_TIME_start))

  # Reset start time
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
  spaceship::worker::init

  # Start building cache from sections
  spaceship::core::start

  # Initiate the first render
  spaceship::populate
}

# A hook right before the command is started executing
prompt_spaceship_preexec() {
  # Stop running prompt async jobs
  spaceship::worker::flush

  # Start measuring exec_time right before executing the command
  spaceship_exec_time_start
}

# A hook after changing the working directory
prompt_spaceship_chpwd() {
  spaceship::worker::eval builtin cd -q $PWD

  # Restart execution time recording once dir is changed
  spaceship_exec_time_start
}
