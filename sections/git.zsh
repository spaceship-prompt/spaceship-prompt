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
SPACESHIP_GIT_STATUS_SHOW_NUMBER="${SPACESHIP_GIT_SHOW_NUMBER=false}"
# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/git_branch.zsh"
source "$SPACESHIP_ROOT/sections/git_status.zsh"
source "$SPACESHIP_ROOT/sections/git_status_num.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show both git branch and git status:
#   spaceship_git_branch
#   spaceship_git_status
spaceship_git() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  local git_branch="$(spaceship_git_branch)" 
  local git_status="$(spaceship_git_status)"
  local git_status_num="$(spaceship_git_status_num)"

  [[ -z $git_branch ]] && return

  local git_status_show=git_status

  if [ "$SPACESHIP_GIT_STATUS_SHOW_NUMBER" = true ]; then
    git_status_show=$git_status_num
  fi

  spaceship::section \
    'white' \
    "$SPACESHIP_GIT_PREFIX" \
    "${git_branch} ${git_status_show}" \
    "$SPACESHIP_GIT_SUFFIX"
}
