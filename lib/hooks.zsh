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
