#
# Time
#
# Current time

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_TIME_SHOW="${SPACESHIP_TIME_SHOW=false}"
SPACESHIP_TIME_PREFIX="${SPACESHIP_TIME_PREFIX="at "}"
SPACESHIP_TIME_SUFFIX="${SPACESHIP_TIME_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_TIME_FORMAT="${SPACESHIP_TIME_FORMAT=}"
SPACESHIP_TIME_12HR="${SPACESHIP_TIME_12HR=false}"
SPACESHIP_TIME_COLOR="${SPACESHIP_TIME_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_time() {
  [[ $SPACESHIP_TIME_SHOW == false ]] && return

  local time_str

  if [[ -n $SPACESHIP_TIME_FORMAT ]]; then
    time_str="${SPACESHIP_TIME_FORMAT}"
  elif [[ $SPACESHIP_TIME_12HR == true ]]; then
    time_str="%D{%r}"
  else
    time_str="%D{%T}"
  fi

  spaceship::section \
    --color "$SPACESHIP_TIME_COLOR" \
    --prefix "$SPACESHIP_TIME_PREFIX" \
    --suffix "$SPACESHIP_TIME_SUFFIX" \
    "$time_str"
}
