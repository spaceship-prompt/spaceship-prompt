#
# Background jobs
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_JOBS_SHOW="${SPACESHIP_JOBS_SHOW=true}"
SPACESHIP_JOBS_PREFIX="${SPACESHIP_JOBS_PREFIX=""}"
SPACESHIP_JOBS_SUFFIX="${SPACESHIP_JOBS_SUFFIX=" "}"
SPACESHIP_JOBS_SYMBOL="${SPACESHIP_JOBS_SYMBOL="✦"}"
SPACESHIP_JOBS_COLOR="${SPACESHIP_JOBS_COLOR="blue"}"
SPACESHIP_JOBS_SPACE_PREFIX="${SPACESHIP_JOBS_SPACE_PREFIX=""}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show icon if there's a working jobs in the background
spaceship_jobs() {
  [[ $SPACESHIP_JOBS_SHOW == false ]] && return

  local jobs_amount=$( jobs -d | awk '!/pwd/' | wc -l | tr -d " ")

  [[ $jobs_amount -gt 0 ]] || return
  [[ $jobs_amount -eq 1 ]] && jobs_amount=''

  spaceship::section \
    "$SPACESHIP_JOBS_COLOR" \
    "$SPACESHIP_JOBS_PREFIX" \
    "${SPACESHIP_JOBS_SYMBOL}${SPACESHIP_JOBS_SPACE_PREFIX}${jobs_amount}" \
    "$SPACESHIP_JOBS_SUFFIX"
}
