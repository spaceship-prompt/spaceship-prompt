#
# Git branch
#
# Show current git branch

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_BRANCH_SHOW="${SPACESHIP_GIT_BRANCH_SHOW=true}"
SPACESHIP_GIT_BRANCH_REMOTE_SHOW="${SPACESHIP_GIT_BRANCH_REMOTE_SHOW=true}"
SPACESHIP_GIT_BRANCH_ASYNC="${SPACESHIP_GIT_BRANCH_ASYNC=false}"
SPACESHIP_GIT_BRANCH_PREFIX="${SPACESHIP_GIT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"}"
SPACESHIP_GIT_BRANCH_SUFFIX="${SPACESHIP_GIT_BRANCH_SUFFIX=""}"
SPACESHIP_GIT_BRANCH_COLOR="${SPACESHIP_GIT_BRANCH_COLOR="magenta"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_branch() {
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return

  vcs_info

  local INDEX INDEX_PARTS git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return

  git_current_branch="${git_current_branch#heads/}"
  git_current_branch="${git_current_branch/.../}"
  # If we want to show the remote with the branch name, check if the branch
  # is tracking a remote and use that info if there.
  if [[ $SPACESHIP_GIT_BRANCH_REMOTE_SHOW == true ]]; then
    INDEX=$(command git status --porcelain -b 2> /dev/null)
    INDEX_PARTS=(${(@s:...:)INDEX})
    [[ ${#INDEX_PARTS[@]} -eq 2 ]] && git_current_branch="${INDEX_PARTS[2]}"
  fi

  spaceship::section \
    --color "$SPACESHIP_GIT_BRANCH_COLOR" \
    "$SPACESHIP_GIT_BRANCH_PREFIX$git_current_branch$SPACESHIP_GIT_BRANCH_SUFFIX"
}
