#
# Git status
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_STATUS_SHOW="${SPACESHIP_GIT_STATUS_SHOW=true}"
SPACESHIP_GIT_STATUS_PREFIX="${SPACESHIP_GIT_STATUS_PREFIX=""}"
SPACESHIP_GIT_STATUS_SUFFIX="${SPACESHIP_GIT_STATUS_SUFFIX=" "}"
SPACESHIP_GIT_STATUS_STASHED="${SPACESHIP_GIT_STATUS_STASHED="⏺"}"
SPACESHIP_GIT_STATUS_UNMERGED="${SPACESHIP_GIT_STATUS_UNMERGED="⏺"}"
SPACESHIP_GIT_STATUS_DELETED="${SPACESHIP_GIT_STATUS_DELETED="⏺"}"
SPACESHIP_GIT_STATUS_MODIFIED="${SPACESHIP_GIT_STATUS_MODIFIED="⏺"}"
SPACESHIP_GIT_STATUS_UNTRACKED="${SPACESHIP_GIT_STATUS_UNTRACKED="⏺"}"
SPACESHIP_GIT_STATUS_ADDED="${SPACESHIP_GIT_STATUS_ADDED="⏺"}"
SPACESHIP_GIT_STATUS_AHEAD="${SPACESHIP_GIT_STATUS_AHEAD=""}"
SPACESHIP_GIT_STATUS_BEHIND="${SPACESHIP_GIT_STATUS_BEHIND=""}"
SPACESHIP_GIT_STATUS_DIVERGED="${SPACESHIP_GIT_STATUS_DIVERGED=""}"
SPACESHIP_GIT_STATUS_STASHED_COLOR="${SPACESHIP_GIT_STATUS_STASHED_COLOR="cyan"}"
SPACESHIP_GIT_STATUS_UNMERGED_COLOR="${SPACESHIP_GIT_STATUS_UNMERGED_COLOR="magenta"}"
SPACESHIP_GIT_STATUS_DELETED_COLOR="${SPACESHIP_GIT_STATUS_DELETED_COLOR="red"}"
SPACESHIP_GIT_STATUS_MODIFIED_COLOR="${SPACESHIP_GIT_STATUS_MODIFIED_COLOR="yellow"}"
SPACESHIP_GIT_STATUS_UNTRACKED_COLOR="${SPACESHIP_GIT_STATUS_UNTRACKED_COLOR="blue"}"
SPACESHIP_GIT_STATUS_ADDED_COLOR="${SPACESHIP_GIT_STATUS_ADDED_COLOR="green"}"
SPACESHIP_GIT_STATUS_AHEAD_COLOR="${SPACESHIP_GIT_STATUS_AHEAD_COLOR="yellow"}"
SPACESHIP_GIT_STATUS_BEHIND_COLOR="${SPACESHIP_GIT_STATUS_BEHIND_COLOR="yellow"}"
SPACESHIP_GIT_STATUS_DIVERGED_COLOR="${SPACESHIP_GIT_STATUS_DIVERGED_COLOR="yellow"}"
>>>>>>> 46fe21a... Make spaceship async, flatten git sections

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_async_job_load_git_status() {
  [[ $SPACESHIP_GIT_STATUS_SHOW == false ]] && return

  async_job spaceship spaceship_async_job_git_status "$PWD"
}

spaceship_async_job_git_status() {
  builtin cd -q "$1" 2>/dev/null

  spaceship::is_git || return

  local INDEX git_status=""

  INDEX=$(command git status --porcelain -b 2> /dev/null)

  # Check for untracked files
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNTRACKED$git_status"
  fi

  # Check for staged files
  if $(echo "$INDEX" | command grep '^A[ MDAU] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  elif $(echo "$INDEX" | command grep '^UA' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$git_status"
  fi

  # Check for modified files
  if $(echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_MODIFIED$git_status"
  fi

  # Check for renamed files
  if $(echo "$INDEX" | command grep '^R[ MD] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_RENAMED$git_status"
  fi

  # Check for deleted files
  if $(echo "$INDEX" | command grep '^[MARCDU ]D ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_DELETED$git_status"
  elif $(echo "$INDEX" | command grep '^D[ UM] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_DELETED$git_status"
  fi

  # Check for stashes
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    git_status="$SPACESHIP_GIT_STATUS_STASHED$git_status"
  fi

  # Check for unmerged files
  if $(echo "$INDEX" | command grep '^U[UDA] ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^AA ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^DD ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNMERGED$git_status"
  elif $(echo "$INDEX" | command grep '^[DA]U ' &> /dev/null); then
    git_status="$SPACESHIP_GIT_STATUS_UNMERGED$git_status"
  fi

  # Check whether branch is ahead
  local is_ahead=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    is_ahead=true
  fi

  # Check whether branch is behind
  local is_behind=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*behind' &> /dev/null); then
    is_behind=true
  fi

  # Check wheather branch has diverged
  if [[ "$is_ahead" == true && "$is_behind" == true ]]; then
    git_status="$SPACESHIP_GIT_STATUS_DIVERGED$git_status"
  else
    [[ "$is_ahead" == true ]] && git_status="$SPACESHIP_GIT_STATUS_AHEAD$git_status"
    [[ "$is_behind" == true ]] && git_status="$SPACESHIP_GIT_STATUS_BEHIND$git_status"
  fi

  echo "$git_status"
}

spaceship_git_status() {
  [[ -z "${SPACESHIP_ASYNC_RESULTS[spaceship_async_job_git_status]}" ]] && return

  spaceship::section \
    "" \
    "$SPACESHIP_GIT_STATUS_PREFIX" \
    "${SPACESHIP_ASYNC_RESULTS[spaceship_async_job_git_status]}"\
    "$SPACESHIP_GIT_STATUS_SUFFIX"
}
