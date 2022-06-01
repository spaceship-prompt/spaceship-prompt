#
# Mercurial (hg) branch
#
# Show current Mercurial branch

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_HG_BRANCH_SHOW="${SPACESHIP_HG_BRANCH_SHOW=true}"
SPACESHIP_HG_BRANCH_ASYNC="${SPACESHIP_HG_BRANCH_ASYNC=true}"
SPACESHIP_HG_BRANCH_PREFIX="${SPACESHIP_HG_BRANCH_PREFIX="$SPACESHIP_HG_SYMBOL"}"
SPACESHIP_HG_BRANCH_SUFFIX="${SPACESHIP_HG_BRANCH_SUFFIX=""}"
SPACESHIP_HG_BRANCH_COLOR="${SPACESHIP_HG_BRANCH_COLOR="magenta"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_hg_branch() {
  [[ $SPACESHIP_HG_BRANCH_SHOW == false ]] && return

  spaceship::is_hg || return

  local hg_info=$(hg log -r . --template '{activebookmark}')

  if [[ -z $hg_info ]]; then
    hg_info=$(hg branch)
  fi

  spaceship::section \
    --color "$SPACESHIP_HG_BRANCH_COLOR" \
    "$SPACESHIP_HG_BRANCH_PREFIX$hg_info$SPACESHIP_HG_BRANCH_SUFFIX"
}
