#
# Git branch
#
# Show current git branch

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_BRANCH_SHOW="${SPACESHIP_GIT_BRANCH_SHOW:=true}"
SPACESHIP_GIT_BRANCH_PREFIX="${SPACESHIP_GIT_BRANCH_PREFIX:="$SPACESHIP_GIT_SYMBOL"}"
SPACESHIP_GIT_BRANCH_SUFFIX="${SPACESHIP_GIT_BRANCH_SUFFIX:=""}"
SPACESHIP_GIT_BRANCH_COLOR="${SPACESHIP_GIT_BRANCH_COLOR:="magenta"}"

# ------------------------------------------------------------------------------
# Helper
# ------------------------------------------------------------------------------

spaceship_git_branch_or_tag() {
  local tag=$(command git tag --points-at=HEAD)
  if [[ -z "$tag" ]]; then
    local ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null) ret=$?
    if [[ $ret != 0 ]]; then
      ref=$(command git rev-parse --short HEAD 2> /dev/null)
    fi
    tag=${ref#refs/heads/}
  fi
  echo $tag
}

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_branch() {
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return

  _is_git || return

  _prompt_section \
    "$SPACESHIP_GIT_BRANCH_COLOR" \
    "$SPACESHIP_GIT_BRANCH_PREFIX$(spaceship_git_branch_or_tag)$SPACESHIP_GIT_BRANCH_SUFFIX"
}
