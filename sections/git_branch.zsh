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

  git_current_branch="${git_current_branch#heads/}"
  git_current_branch="${git_current_branch/.../}"

  # Build commit SHA info if enabled
  if [[ $SPACESHIP_GIT_BRANCH_SHOW_COMMIT == true ]]; then
    local git_commit_info_pre="$SPACESHIP_GIT_BRANCH_PREFIX_COMMIT$SPACESHIP_GIT_BRANCH_COMMIT_SYMBOL"
    local git_commit_info_suf="$SPACESHIP_GIT_BRANCH_SUFFIX_COMMIT"
    local commit_sha=$(git rev-parse --short HEAD 2> /dev/null)
    local git_commit_info="$git_commit_info_pre$commit_sha$git_commit_info_suf"
  fi

  # Build tag info if enabled
  if [[ $SPACESHIP_GIT_BRANCH_SHOW_TAG == true ]]; then
    local git_tag_info_pre="$SPACESHIP_GIT_BRANCH_PREFIX_TAG$SPACESHIP_GIT_BRANCH_TAG_SYMBOL"
    local git_tag_info_suf="$SPACESHIP_GIT_BRANCH_SUFFIX_TAG"
    local tag=$(git describe --tags --exact-match HEAD 2>/dev/null)
    local git_tag_info="$git_tag_info_pre$tag$git_tag_info_suf"
  fi

  # Build prompt depending on current git status
  git_current_branch="$git_current_branch$git_commit_info" && $SPACESHIP_GIT_BRANCH_SHOW_COMMIT
  if [[ $SPACESHIP_GIT_BRANCH_SHOW_TAG ]]; then
    if [[ $vcs_info_msg_0_ == *"tags"* ]] || [[ $vcs_info_msg_0_ == $tag ]]; then
      git_current_branch="$git_tag_info_pre$git_tag_info_suf$git_current_branch"
    elif [[ ! -z $tag ]]; then
      git_current_branch="$git_current_branch$git_tag_info"
    fi
  fi

  spaceship::section \
    "$SPACESHIP_GIT_BRANCH_COLOR" \
    "$SPACESHIP_GIT_BRANCH_PREFIX${git_current_branch}$SPACESHIP_GIT_BRANCH_SUFFIX"
}
