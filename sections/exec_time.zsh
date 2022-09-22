#
# Execution time
#
# Execution time of the last command.

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_EXEC_TIME_SHOW="${SPACESHIP_EXEC_TIME_SHOW=true}"
SPACESHIP_EXEC_TIME_PREFIX="${SPACESHIP_EXEC_TIME_PREFIX="took "}"
SPACESHIP_EXEC_TIME_SUFFIX="${SPACESHIP_EXEC_TIME_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_EXEC_TIME_COLOR="${SPACESHIP_EXEC_TIME_COLOR="yellow"}"
SPACESHIP_EXEC_TIME_ELAPSED="${SPACESHIP_EXEC_TIME_ELAPSED=2}"
SPACESHIP_EXEC_TIME_PRECISION="${SPACESHIP_EXEC_TIME_PRECISION=1}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_exec_time() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return

  if (( SPACESHIP_EXEC_TIME_duration >= SPACESHIP_EXEC_TIME_ELAPSED )); then
    spaceship::section \
      --color "$SPACESHIP_EXEC_TIME_COLOR" \
      --prefix "$SPACESHIP_EXEC_TIME_PREFIX" \
      --suffix "$SPACESHIP_EXEC_TIME_SUFFIX" \
      "$(spaceship::displaytime $SPACESHIP_EXEC_TIME_duration $SPACESHIP_EXEC_TIME_PRECISION)"
  fi
}
