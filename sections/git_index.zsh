#
# Git index
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_INDEX_SHOW="${SPACESHIP_GIT_INDEX_SHOW=true}"
SPACESHIP_GIT_INDEX_PREFIX="${SPACESHIP_GIT_INDEX_PREFIX=" ("}"
SPACESHIP_GIT_INDEX_SUFFIX="${SPACESHIP_GIT_INDEX_SUFFIX=")"}"
SPACESHIP_GIT_INDEX_ASSUME_UNCHANGED="${SPACESHIP_GIT_INDEX_ASSUME_UNCHANGED="⤒"}"
SPACESHIP_GIT_INDEX_SKIP_WORKTREE="${SPACESHIP_GIT_INDEX_SKIP_WORKTREE="↧"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# See git help update-index to know more about index formats
git_index() {

  local FILES git_index=""

  FILES=$(command git ls-files -v $(git rev-parse --show-toplevel))

  # Check whether any file has the --assume-unchanged bit set
  if $(echo "$FILES" | grep '^[[:lower:]]' &> /dev/null); then
    git_index="$SPACESHIP_GIT_INDEX_ASSUME_UNCHANGED$git_index"
  fi

  # Check whether any file has the --skip-worktree bit set
  if $(echo "$FILES" | grep '^[sS]' &> /dev/null); then
    git_index="$SPACESHIP_GIT_INDEX_SKIP_WORKTREE$git_index"
  fi

  echo "$git_index"
}

spaceship_git_index() {
  [[ $SPACESHIP_GIT_INDEX_SHOW == false ]] && return

  git_index=$(git_index)
  if [[ -n $git_index ]]; then
    # Status prefixes are colorized
    spaceship::section \
      "$SPACESHIP_GIT_INDEX_COLOR" \
      "$SPACESHIP_GIT_INDEX_PREFIX$git_index$SPACESHIP_GIT_INDEX_SUFFIX"
  fi
}
