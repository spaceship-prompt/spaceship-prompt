#
# Git branch
#
# Show current git branch

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_BRANCH_SHOW="${SPACESHIP_GIT_BRANCH_SHOW=true}"
SPACESHIP_GIT_BRANCH_PREFIX="${SPACESHIP_GIT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"}"
SPACESHIP_GIT_BRANCH_SUFFIX="${SPACESHIP_GIT_BRANCH_SUFFIX=""}"
SPACESHIP_GIT_BRANCH_COLOR="${SPACESHIP_GIT_BRANCH_COLOR="magenta"}"

# Show current commit SHA configuration
SPACESHIP_GIT_BRANCH_SHOW_COMMIT="${SPACESHIP_GIT_BRANCH_SHOW_COMMIT=false}"
SPACESHIP_GIT_BRANCH_COMMIT_SYMBOL="${SPACESHIP_GIT_BRANCH_COMMIT_SYMBOL=" ¢ "}"
SPACESHIP_GIT_BRANCH_PREFIX_COMMIT="${SPACESHIP_GIT_BRANCH_PREFIX_COMMIT=""}"
SPACESHIP_GIT_BRANCH_SUFFIX_COMMIT="${SPACESHIP_GIT_BRANCH_SUFFIX_COMMIT=""}"

# Show tag configuration
SPACESHIP_GIT_BRANCH_SHOW_TAG="${SPACESHIP_GIT_BRANCH_SHOW_TAG=false}"
SPACESHIP_GIT_BRANCH_TAG_SYMBOL="${SPACESHIP_GIT_BRANCH_TAG_SYMBOL=" ŧ "}"
SPACESHIP_GIT_BRANCH_PREFIX_TAG="${SPACESHIP_GIT_BRANCH_PREFIX_TAG=""}"
SPACESHIP_GIT_BRANCH_SUFFIX_TAG="${SPACESHIP_GIT_BRANCH_SUFFIX_TAG=""}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_branch() {
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return

  local git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return

  # Show commit/tag info on detached HEAD
  if [[ $SPACESHIP_GIT_BRANCH_SHOW_COMMIT == true ]] || [[ $SPACESHIP_GIT_BRANCH_SHOW_TAG == true ]]; then
    local git_current_branch=$(git symbolic-ref HEAD --short 2> /dev/null)
  fi

  git_current_branch="${git_current_branch#heads/}"
  git_current_branch="${git_current_branch/.../}"

  # Add commit SHA info
  if [[ $SPACESHIP_GIT_BRANCH_SHOW_COMMIT == true ]]; then
    local git_commit_info="$SPACESHIP_GIT_BRANCH_PREFIX_COMMIT$SPACESHIP_GIT_BRANCH_COMMIT_SYMBOL"
    git_commit_info="$git_commit_info$(git rev-parse --short HEAD 2> /dev/null)$SPACESHIP_GIT_BRANCH_SUFFIX_COMMIT"
    git_current_branch="$git_current_branch$git_commit_info"
  fi

  # Add tag info
  if [[ $SPACESHIP_GIT_BRANCH_SHOW_TAG == true ]]; then
    local tag=$(git describe --tags --exact-match HEAD 2>/dev/null)
    if [[ ! -z $tag ]]; then
      local git_tag_info="$SPACESHIP_GIT_BRANCH_PREFIX_TAG$SPACESHIP_GIT_BRANCH_TAG_SYMBOL"
      git_tag_info="$git_tag_info$tag$SPACESHIP_GIT_BRANCH_SUFFIX_TAG"
    fi
    git_current_branch="$git_current_branch$git_tag_info"
  fi

  spaceship::section \
    "$SPACESHIP_GIT_BRANCH_COLOR" \
    "$SPACESHIP_GIT_BRANCH_PREFIX${git_current_branch}$SPACESHIP_GIT_BRANCH_SUFFIX"
}
