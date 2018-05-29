#
# Git branch
#
# Show current git branch

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_BRANCH_SHOW="${SPACESHIP_GIT_BRANCH_SHOW=true}"
SPACESHIP_GIT_BRANCH_SYMBOL="${SPACESHIP_GIT_BRANCH_SYMBOL=" "}"
SPACESHIP_GIT_BRANCH_PREFIX="${SPACESHIP_GIT_BRANCH_PREFIX="on "}"
SPACESHIP_GIT_BRANCH_SUFFIX="${SPACESHIP_GIT_BRANCH_SUFFIX=" "}"
SPACESHIP_GIT_BRANCH_COLOR="${SPACESHIP_GIT_BRANCH_COLOR="magenta"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_async_job_load_git_branch() {
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return

  async_job spaceship spaceship_async_job_git_branch "$PWD"
}

spaceship_async_job_git_branch() {
  builtin cd -q "$1" 2>/dev/null

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b|%a'

  vcs_info

  local git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return

  git_current_branch="${git_current_branch#heads/}"
  git_current_branch="${git_current_branch/.../}"

  echo "$git_current_branch"
}

spaceship_git_branch() {
  [[ -z "${SPACESHIP_ASYNC_RESULTS[spaceship_async_job_git_branch]}" ]] && return

  spaceship::section \
    "$SPACESHIP_GIT_BRANCH_COLOR" \
    "$SPACESHIP_GIT_BRANCH_PREFIX" \
    "${SPACESHIP_GIT_BRANCH_SYMBOL}${SPACESHIP_ASYNC_RESULTS[spaceship_async_job_git_branch]}" \
    "$SPACESHIP_GIT_BRANCH_SUFFIX"
}
