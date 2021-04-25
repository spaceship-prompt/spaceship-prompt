

#
# Prints line counts of diff (added and removed)
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_STAT_SHOW="${SPACESHIP_GIT_STAT_SHOW=true}"
SPACESHIP_GIT_STAT_PREFIX="${SPACESHIP_GIT_STAT_PREFIX=" ["}"
SPACESHIP_GIT_STAT_SUFFIX="${SPACESHIP_GIT_STAT_SUFFIX="]"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_stat() {
  [[ $SPACESHIP_GIT_STAT_SHOW == false ]] && return

  spaceship::is_git || return
  # add all files
  $(git add .)
  # Shows count of lines added in green (with '+' prefix) and lines removed in red (with '-' prefix)
  # e.g. "+21 -7"
  
  git_stat=$(command git diff --staged --numstat HEAD | awk 'NF==3 {added+=$1; removed+=$2} END {printf("\x1B[32m+%d\x1B[0m \x1B[31m-%d\x1B[0m\n", added, removed)}')

  # Only show the stat if there are files staged.
  if [[ -n $git_status ]]; then
    if  ! git diff-index --quiet HEAD; then
      # stats are colorized, so no color is necessary.
      spaceship::section \
        'red' \
        "$SPACESHIP_GIT_STAT_PREFIX$git_stat$SPACESHIP_GIT_STAT_SUFFIX"
    fi
  fi
}