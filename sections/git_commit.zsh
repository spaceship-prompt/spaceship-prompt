#
# Git commit
#
# Show current git commit SHA

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_COMMIT_SHOW="${SPACESHIP_GIT_COMMIT_SHOW=true}"
SPACESHIP_GIT_COMMIT_PREFIX="${SPACESHIP_GIT_COMMIT_PREFIX=" at "}"
SPACESHIP_GIT_COMMIT_SUFFIX="${SPACESHIP_GIT_COMMIT_SUFFIX=""}"
SPACESHIP_GIT_COMMIT_COLOR="${SPACESHIP_GIT_COMMIT_COLOR="magenta"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_commit() {
  [[ $SPACESHIP_GIT_COMMIT_SHOW == false ]] && return

  local git_current_commit="$(git_prompt_short_sha)"
  [[ -z "$git_current_commit" ]] && return

  spaceship::section \
    "$SPACESHIP_GIT_COMMIT_COLOR" \
    "$SPACESHIP_GIT_COMMIT_PREFIX${git_current_commit}$SPACESHIP_GIT_COMMIT_SUFFIX"
}
