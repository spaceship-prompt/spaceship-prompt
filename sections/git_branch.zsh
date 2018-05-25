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
SPACESHIP_GIT_BRANCH_COMMIT_PREFIX="${SPACESHIP_GIT_BRANCH_COMMIT_PREFIX=""}"
SPACESHIP_GIT_BRANCH_COMMIT_SUFFIX="${SPACESHIP_GIT_BRANCH_COMMIT_SUFFIX=""}"

# Show tag configuration
SPACESHIP_GIT_BRANCH_SHOW_TAG="${SPACESHIP_GIT_BRANCH_SHOW_TAG=false}"
SPACESHIP_GIT_BRANCH_TAG_SYMBOL="${SPACESHIP_GIT_BRANCH_TAG_SYMBOL=" ŧ "}"
SPACESHIP_GIT_BRANCH_TAG_PREFIX="${SPACESHIP_GIT_BRANCH_TAG_PREFIX=""}"
SPACESHIP_GIT_BRANCH_TAG_SUFFIX="${SPACESHIP_GIT_BRANCH_TAG_SUFFIX=""}"

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
    local git_commit_preffix="$SPACESHIP_GIT_BRANCH_COMMIT_PREFIX$SPACESHIP_GIT_BRANCH_COMMIT_SYMBOL"
    local git_commit_sha=$(git rev-parse --short HEAD 2> /dev/null)
    local git_commit_info="$git_commit_preffix$git_commit_sha$SPACESHIP_GIT_BRANCH_COMMIT_SUFFIX"
  fi

  git_current_branch+="$git_commit_info"

  # Build tag info if enabled
  if [[ $SPACESHIP_GIT_BRANCH_SHOW_TAG == true ]]; then
    local git_tag_preffix="$SPACESHIP_GIT_BRANCH_TAG_PREFIX$SPACESHIP_GIT_BRANCH_TAG_SYMBOL"
    local git_tag_name=$(git describe --tags --exact-match $git_commit_sha 2>/dev/null)
    local git_tag_info="$git_tag_preffix$git_tag_name$SPACESHIP_GIT_BRANCH_TAG_SUFFIX"
    if [[ -n $git_tag_name ]]; then
      git_current_branch+="$git_tag_info"
    fi
  fi

  spaceship::section \
    "$SPACESHIP_GIT_BRANCH_COLOR" \
    "$SPACESHIP_GIT_BRANCH_PREFIX${git_current_branch}$SPACESHIP_GIT_BRANCH_SUFFIX"
}
