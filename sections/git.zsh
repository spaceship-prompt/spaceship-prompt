#
# Git
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_SHOW="${SPACESHIP_GIT_SHOW=true}"
SPACESHIP_GIT_ASYNC="${SPACESHIP_GIT_ASYNC=true}"
SPACESHIP_GIT_PREFIX="${SPACESHIP_GIT_PREFIX="on "}"
SPACESHIP_GIT_SUFFIX="${SPACESHIP_GIT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_SYMBOL="${SPACESHIP_GIT_SYMBOL=" "}"

if [ -z "$SPACESHIP_GIT_ORDER" ]; then
  SPACESHIP_GIT_ORDER=(git_branch git_status)
fi

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/git_branch.zsh"
source "$SPACESHIP_ROOT/sections/git_status.zsh"

spaceship::precompile "$SPACESHIP_ROOT/sections/git_branch.zsh"
spaceship::precompile "$SPACESHIP_ROOT/sections/git_status.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show both git branch and git status:
#   spaceship_git_branch
#   spaceship_git_status
spaceship_git() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  # Refresh parts of the git section
  for subsection in "${SPACESHIP_GIT_ORDER[@]}"; do
    spaceship::core::refresh_section --sync "$subsection"
  done

  # Quit if no git ref is found
  local git_branch="$(spaceship::cache::get git_branch)"
  [[ -z $git_branch ]] && return

  local git_data="$(spaceship::core::compose_order $SPACESHIP_GIT_ORDER)"

  spaceship::section \
    --color 'white' \
    --prefix "$SPACESHIP_GIT_PREFIX" \
    --suffix "$SPACESHIP_GIT_SUFFIX" \
    "$git_data"
}
