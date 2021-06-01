#
# Git status With Numbers
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_STATUS_SHOW="${SPACESHIP_GIT_STATUS_SHOW=true}"
SPACESHIP_GIT_STATUS_PREFIX="${SPACESHIP_GIT_STATUS_PREFIX="["}"
SPACESHIP_GIT_STATUS_SUFFIX="${SPACESHIP_GIT_STATUS_SUFFIX="]"}"
SPACESHIP_GIT_STATUS_COLOR="${SPACESHIP_GIT_STATUS_COLOR="red"}"
SPACESHIP_GIT_STATUS_UNTRACKED="${SPACESHIP_GIT_STATUS_UNTRACKED="?"}"
SPACESHIP_GIT_STATUS_ADDED="${SPACESHIP_GIT_STATUS_ADDED="+"}"
SPACESHIP_GIT_STATUS_MODIFIED="${SPACESHIP_GIT_STATUS_MODIFIED="!"}"
SPACESHIP_GIT_STATUS_RENAMED="${SPACESHIP_GIT_STATUS_RENAMED="»"}"
SPACESHIP_GIT_STATUS_DELETED="${SPACESHIP_GIT_STATUS_DELETED="✘"}"
SPACESHIP_GIT_STATUS_STASHED="${SPACESHIP_GIT_STATUS_STASHED="$"}" 
SPACESHIP_GIT_STATUS_UNMERGED="${SPACESHIP_GIT_STATUS_UNMERGED="="}"
SPACESHIP_GIT_STATUS_AHEAD="${SPACESHIP_GIT_STATUS_AHEAD="⇡"}"
SPACESHIP_GIT_STATUS_BEHIND="${SPACESHIP_GIT_STATUS_BEHIND="⇣"}"
SPACESHIP_GIT_STATUS_DIVERGED="${SPACESHIP_GIT_STATUS_DIVERGED="⇕"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# We used to depend on OMZ git library,
# But it doesn't handle many of the status indicator combinations.
# Also, It's hard to maintain external dependency.
# See PR #147 at https://git.io/vQkkB
# See git help status to know more about status formats
spaceship_git_status_num() {
  [[ $SPACESHIP_GIT_STATUS_SHOW == false ]] && return

  spaceship::is_git || return

  local NUMBER INDEX git_status=""

  INDEX=$(command git status --porcelain -b 2> /dev/null)

  # Check for untracked files
  NUMBER=$(git status --porcelain | command grep -E '^\?\? ' | wc -l | awk '{$1=$1;print}')
  if [ $NUMBER != "0" ]; then
    git_status="$SPACESHIP_GIT_STATUS_UNTRACKED$NUMBER$git_status"
  fi

  # Check for staged files
  NUMBER=$(($(git status --porcelain | command grep '^A [ MDAU] ' | wc -l | awk '{$1=$1;print}') + $(git status --porcelain | command grep '^M[ MD] ' | wc -l | awk '{$1=$1;print}') + $(git status --porcelain | command grep '^UA ' | wc -l | awk '{$1=$1;print}') ))
  if [ $NUMBER != "0" ]; then
    git_status="$SPACESHIP_GIT_STATUS_ADDED$NUMBER$git_status"
  fi
  # Check for modified files
  NUMBER=$(($(git status --porcelain | command grep '^[ MARC]M ' | wc -l | awk '{$1=$1;print}') ))
  if [ $NUMBER != "0" ]; then
    git_status="$SPACESHIP_GIT_STATUS_MODIFIED$NUMBER$git_status"
  fi

  # Check for renamed files
  NUMBER=$(($(git status --porcelain | command grep '^R[ MD] ' | wc -l | awk '{$1=$1;print}') ))
  if [ $NUMBER != "0" ]; then
    git_status="$SPACESHIP_GIT_STATUS_RENAMED$NUMBER$git_status"
  fi

  # Check for deleted files
  NUMBER=$(($(git status --porcelain | command grep '^[MARCDU ]D ' | wc -l | awk '{$1=$1;print}') + $(git status --porcelain | command grep '^D[ UM] ' | wc -l | awk '{$1=$1;print}') ))
  if [ $NUMBER != "0" ]; then
    git_status="$SPACESHIP_GIT_STATUS_DELETED$NUMBER$git_status"
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

  if [ "$git_status" != "" ]; then
    git_status="$SPACESHIP_GIT_STATUS_PREFIX$git_status$SPACESHIP_GIT_STATUS_SUFFIX"
  fi
  if [[ -n$git_status ]]; then
    # Status prefixes are colorized
    spaceship::section \
      "$SPACESHIP_GIT_STATUS_COLOR" \
      "$git_status"
  fi
}