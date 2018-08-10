# ------------------------------------------------------------------------------
# HOOKS
# Zsh hooks for advanced actions
# custom hooks for sections
# ------------------------------------------------------------------------------

# TODO: Let sections register their own hooks via `spaceship::register_hook`

# Execution time start hook
spaceship_exec_time_preexec_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  SPACESHIP_EXEC_TIME_start=$(date +%s)
}

# Execution time end hook
spaceship_exec_time_precmd_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return
  [[ -n $SPACESHIP_EXEC_TIME_duration ]] && unset SPACESHIP_EXEC_TIME_duration
  [[ -z $SPACESHIP_EXEC_TIME_start ]] && return
  local SPACESHIP_EXEC_TIME_stop=$(date +%s)
  SPACESHIP_EXEC_TIME_duration=$(( $SPACESHIP_EXEC_TIME_stop - $SPACESHIP_EXEC_TIME_start ))
  unset SPACESHIP_EXEC_TIME_start
}

spaceship_preexec_hook() {
  # Start measuring exec_time, must be the first preexec action
  spaceship_exec_time_preexec_hook

  # Abort all unfinished async jobs from the previous prompt
  async_flush_jobs spaceship
}

spaceship_precmd_hook() {
  # Retrieve exit code of last command to use in exit_code
  # Must be captured before any other command in prompt is executed
  # Must be the very first line in all entry prompt functions, or the value
  # will be overridden by a different command execution - do not move this line!
  RETVAL=$?

  # Stop measuring exec_time, must be the first precmd action
  spaceship_exec_time_precmd_hook

  # Abort all unfinished async jobs from the previous prompt
  async_flush_jobs spaceship

  # Cleanup results from previous prompt, or they will flash for short amount of time
  unset SPACESHIP_ASYNC_RESULTS
  declare -gA SPACESHIP_ASYNC_RESULTS

  # Should it add a new line before the prompt?
  [[ $SPACESHIP_PROMPT_ADD_NEWLINE == true ]] && echo -n "$NEWLINE"

  # Draw initial prompt (no async jobs started yet)
  PROMPT=$(spaceship::compose_prompt $SPACESHIP_PROMPT_ORDER)

  # Load all async sections
  spaceship::async_load_prompt $SPACESHIP_PROMPT_ORDER
}
