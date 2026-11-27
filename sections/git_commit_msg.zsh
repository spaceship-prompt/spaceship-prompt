#
# Git commit message
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_COMMIT_MSG_SHOW="${SPACESHIP_GIT_COMMIT_MSG_SHOW=true}"
SPACESHIP_GIT_COMMIT_MSG_ASYNC="${SPACESHIP_GIT_COMMIT_MSG_ASYNC=true}"
SPACESHIP_GIT_COMMIT_MSG_PREFIX="${SPACESHIP_GIT_COMMIT_MSG_PREFIX=" 📓️ "}"
SPACESHIP_GIT_COMMIT_MSG_SUFFIX="${SPACESHIP_GIT_COMMIT_MSG_SUFFIX=""}"
SPACESHIP_GIT_COMMIT_MSG_COLOR="${SPACESHIP_GIT_COMMIT_MSG_COLOR="black"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_commit_msg() {
  [[ $SPACESHIP_GIT_COMMIT_MSG_SHOW == false ]] && return

  spaceship::is_git || return

  # vcs_info

  local git_commit_msg=$(command git show-branch --no-name HEAD)

  # Get first line of last commit message
  if [[ -n $git_commit_msg ]]; then
    # Commit prefixes are colorized
    spaceship::section \
      --color "$SPACESHIP_GIT_COMMIT_MSG_COLOR" \
      "$SPACESHIP_GIT_COMMIT_MSG_PREFIX$git_commit_msg$SPACESHIP_GIT_COMMIT_MSG_SUFFIX"
  fi
}
