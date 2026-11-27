#
# Git hash
#
# Show last git hash

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------


SPACESHIP_GIT_HASH_SHOW="${SPACESHIP_GIT_HASH_SHOW=true}"
SPACESHIP_GIT_HASH_ASYNC="${SPACESHIP_GIT_HASH_ASYNC=true}"
SPACESHIP_GIT_HASH_PREFIX="${SPACESHIP_GIT_HASH_PREFIX=" ※ "}"
SPACESHIP_GIT_HASH_SUFFIX="${SPACESHIP_GIT_HASH_SUFFIX=""}"
SPACESHIP_GIT_HASH_COLOR="${SPACESHIP_GIT_HASH_COLOR="magenta"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_hash() {
  [[ $SPACESHIP_GIT_HASH_SHOW == false ]] && return

  spaceship::is_git || return

  git_hash=$(command git rev-parse --short HEAD)

  spaceship::section \
    --color "$SPACESHIP_GIT_HASH_COLOR" \
    "$SPACESHIP_GIT_HASH_PREFIX$git_hash$SPACESHIP_GIT_HASH_SUFFIX"
}
