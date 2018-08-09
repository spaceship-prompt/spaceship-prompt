#
# Git
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_SHOW="${SPACESHIP_GIT_SHOW=true}"
SPACESHIP_GIT_PREFIX="${SPACESHIP_GIT_PREFIX="on "}"
SPACESHIP_GIT_SUFFIX="${SPACESHIP_GIT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_SYMBOL="${SPACESHIP_GIT_SYMBOL=" "}"

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/git_branch.zsh"
source "$SPACESHIP_ROOT/sections/git_status.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show both git branch and git status:
#   spaceship_git_branch
#   spaceship_git_status

spaceship_async_job_load_git() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  async_job spaceship spaceship_async_job_git_branch "$PWD"
  async_job spaceship spaceship_async_job_git_status "$PWD"
}

spaceship_git() {

  local git_branch=${SPACESHIP_ASYNC_RESULTS[spaceship_async_job_git_branch]}
  local git_status=${SPACESHIP_ASYNC_RESULTS[spaceship_async_job_git_status]}

  [[ -z $git_branch ]] && return

  spaceship::section \
    'white' \
    "$SPACESHIP_GIT_PREFIX" \
    "${git_branch}${git_status}" \
    "$SPACESHIP_GIT_SUFFIX"
}
