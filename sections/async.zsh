#
# Async Jobs Indicator
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ASYNC_SHOW="${SPACESHIP_ASYNC_SHOW=true}"
SPACESHIP_ASYNC_PREFIX="${SPACESHIP_ASYNC_PREFIX=""}"
SPACESHIP_ASYNC_SUFFIX="${SPACESHIP_ASYNC_SUFFIX=""}"
SPACESHIP_ASYNC_SYMBOL="${SPACESHIP_ASYNC_SYMBOL="…"}"
SPACESHIP_ASYNC_COLOR="${SPACESHIP_ASYNC_COLOR="gray"}"
SPACESHIP_ASYNC_SHOW_COUNT="${SPACESHIP_ASYNC_SHOW_COUNT=false}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows if there are any spaceship async jobs active
spaceship_async() {
  # Return if Spaceship works syncronosly
  spaceship::is_prompt_async || return

  # Return if this section is hidden
  [[ "$SPACESHIP_ASYNC_SHOW" == false ]] && return

  local jobs_count=${#SPACESHIP_JOBS}
  local content

  # If there are no jobs, we don't need to show anything
  (( $jobs_count == 0 )) && return

  # Display jobs counter
  if [[ "$SPACESHIP_ASYNC_SHOW_COUNT" == true ]]; then
    content="$jobs_count"
  fi

  spaceship::section \
    --color "$SPACESHIP_ASYNC_COLOR" \
    --prefix "$SPACESHIP_ASYNC_PREFIX" \
    --suffix "$SPACESHIP_ASYNC_SUFFIX" \
    --symbol "$SPACESHIP_ASYNC_SYMBOL" \
    "$content"
}
