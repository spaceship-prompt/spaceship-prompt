#
# Git state
#
# Show active git operation state (rebase, merge, revert, am, cherry-pick, bisect).

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_STATE_SHOW="${SPACESHIP_GIT_STATE_SHOW=true}"
SPACESHIP_GIT_STATE_ASYNC="${SPACESHIP_GIT_STATE_ASYNC=false}"
SPACESHIP_GIT_STATE_PREFIX="${SPACESHIP_GIT_STATE_PREFIX=" ["}"
SPACESHIP_GIT_STATE_SUFFIX="${SPACESHIP_GIT_STATE_SUFFIX="]"}"
SPACESHIP_GIT_STATE_COLOR="${SPACESHIP_GIT_STATE_COLOR="red"}"
SPACESHIP_GIT_STATE_REBASE_REBASING="${SPACESHIP_GIT_STATE_REBASE_REBASING="rebase"}"
SPACESHIP_GIT_STATE_REBASE_APPLYING="${SPACESHIP_GIT_STATE_REBASE_APPLYING="am"}"
SPACESHIP_GIT_STATE_MERGING="${SPACESHIP_GIT_STATE_MERGING="merge"}"
SPACESHIP_GIT_STATE_REVERTING="${SPACESHIP_GIT_STATE_REVERTING="revert"}"
SPACESHIP_GIT_STATE_CHERRY_PICKING="${SPACESHIP_GIT_STATE_CHERRY_PICKING="cherry-pick"}"
SPACESHIP_GIT_STATE_BISECTING="${SPACESHIP_GIT_STATE_BISECTING="bisect"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_state() {
  [[ $SPACESHIP_GIT_STATE_SHOW == false ]] && return

  spaceship::is_git || return

  local git_dir="$(command git rev-parse --git-dir 2>/dev/null)"
  local git_state=""

  if [[ -d "$git_dir/rebase-merge" ]]; then
    git_state="$SPACESHIP_GIT_STATE_REBASE_REBASING"
  elif [[ -d "$git_dir/rebase-apply" ]]; then
    if [[ -f "$git_dir/rebase-apply/applying" ]]; then
      git_state="$SPACESHIP_GIT_STATE_REBASE_APPLYING"
    else
      git_state="$SPACESHIP_GIT_STATE_REBASE_REBASING"
    fi
  elif [[ -f "$git_dir/MERGE_HEAD" ]]; then
    git_state="$SPACESHIP_GIT_STATE_MERGING"
  elif [[ -f "$git_dir/REVERT_HEAD" ]]; then
    git_state="$SPACESHIP_GIT_STATE_REVERTING"
  elif [[ -f "$git_dir/CHERRY_PICK_HEAD" ]]; then
    git_state="$SPACESHIP_GIT_STATE_CHERRY_PICKING"
  elif [[ -f "$git_dir/BISECT_LOG" ]]; then
    git_state="$SPACESHIP_GIT_STATE_BISECTING"
  fi

  [[ -z "$git_state" ]] && return

  spaceship::section \
    --color "$SPACESHIP_GIT_STATE_COLOR" \
    --prefix "$SPACESHIP_GIT_STATE_PREFIX" \
    --suffix "$SPACESHIP_GIT_STATE_SUFFIX" \
    "$git_state"
}
