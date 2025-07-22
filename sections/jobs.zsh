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
SPACESHIP_JOBS_AMOUNT_PREFIX="${SPACESHIP_JOBS_AMOUNT_PREFIX=""}"
SPACESHIP_JOBS_AMOUNT_SUFFIX="${SPACESHIP_JOBS_AMOUNT_SUFFIX=""}"
SPACESHIP_JOBS_AMOUNT_THRESHOLD="${SPACESHIP_JOBS_AMOUNT_THRESHOLD=1}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show icon if there's a working jobs in the background
spaceship_jobs() {
  [[ $SPACESHIP_JOBS_SHOW == false ]] && return

  local jobs_amount=${#jobstates}

  # Workaround for Zsh < 5.9 (#1449)
  if ! is-at-least 5.9; then
    jobs_amount=0;
    while IFS= read -r line; do
      [[ -n ${line//[[:space:]]/} ]] && ((jobs_amount++))
    done <<< "$(jobs)"
  fi

  [[ $jobs_amount -gt 0 ]] || return

  if [[ $jobs_amount -le $SPACESHIP_JOBS_AMOUNT_THRESHOLD ]]; then
    jobs_amount=''
    SPACESHIP_JOBS_AMOUNT_PREFIX=''
    SPACESHIP_JOBS_AMOUNT_SUFFIX=''
  fi

  spaceship::section \
    --color "$SPACESHIP_JOBS_COLOR" \
    --prefix "$SPACESHIP_JOBS_PREFIX" \
    --suffix "$SPACESHIP_JOBS_SUFFIX" \
    --symbol "$SPACESHIP_JOBS_SYMBOL" \
    "$SPACESHIP_JOBS_AMOUNT_PREFIX$jobs_amount$SPACESHIP_JOBS_AMOUNT_SUFFIX"
}
