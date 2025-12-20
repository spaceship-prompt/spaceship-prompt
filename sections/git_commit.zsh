#
# Git commit
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_COMMIT_SHOW="${SPACESHIP_GIT_COMMIT_SHOW=false}"
SPACESHIP_GIT_COMMIT_ASYNC="${SPACESHIP_GIT_COMMIT_ASYNC=true}"
SPACESHIP_GIT_COMMIT_PREFIX="${SPACESHIP_GIT_COMMIT_PREFIX=" "}"
SPACESHIP_GIT_COMMIT_SYMBOL="${SPACESHIP_GIT_COMMIT_SYMBOL="#"}"
SPACESHIP_GIT_COMMIT_SUFFIX="${SPACESHIP_GIT_COMMIT_SUFFIX=""}"
SPACESHIP_GIT_COMMIT_COLOR="${SPACESHIP_GIT_COMMIT_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_commit() {
  [[ $SPACESHIP_GIT_COMMIT_SHOW == false ]] && return

  spaceship::is_git || return

  # Get commit short commit hash
  commit_hash=$(command git rev-parse --short HEAD 2>/dev/null)

  if [[ -n $commit_hash ]]; then
    spaceship::section \
      --color "$SPACESHIP_GIT_COMMIT_COLOR" \
      --prefix "$SPACESHIP_GIT_COMMIT_PREFIX" \
      --suffix "$SPACESHIP_GIT_COMMIT_SUFFIX" \
      --symbol "$SPACESHIP_GIT_COMMIT_SYMBOL" \
      "$commit_hash"
  fi
}
