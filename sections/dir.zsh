#
# Working directory
#
# Current directory. Return only three last items of path

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DIR_SHOW="${SPACESHIP_DIR_SHOW=true}"
SPACESHIP_DIR_PREFIX="${SPACESHIP_DIR_PREFIX="in "}"
SPACESHIP_DIR_SUFFIX="${SPACESHIP_DIR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DIR_TRUNC="${SPACESHIP_DIR_TRUNC=3}"
SPACESHIP_DIR_TRUNC_REPO="${SPACESHIP_DIR_TRUNC_REPO=true}"
SPACESHIP_DIR_COLOR="${SPACESHIP_DIR_COLOR="cyan"}"
SPACESHIP_DIR_LOCK_SYMBOL="${SPACESHIP_DIR_LOCK_SYMBOL="🔒"}"
SPACESHIP_DIR_LOCK_COLOR="${SPACESHIP_DIR_LOCK_COLOR=red}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_dir() {
  [[ $SPACESHIP_DIR_SHOW == false ]] && return

  local dir

  [[ -w . ]] && SPACESHIP_WRITE_PERM_SYMBOL=''

  # Threat repo root as a top-level directory or not
  if [[ $SPACESHIP_DIR_TRUNC_REPO == true ]] && spaceship::is_git; then
    local git_root=$(git rev-parse --show-toplevel)
    dir="$git_root:t${$(expr $(pwd) : "$git_root\(.*\)")}"
  else
    dir="%${SPACESHIP_DIR_TRUNC}~"
  fi

  if [[ ! -w . ]]; then
    SPACESHIP_DIR_SUFFIX="%F{$SPACESHIP_DIR_LOCK_COLOR} $SPACESHIP_DIR_LOCK_SYMBOL %f"
  fi

  spaceship::section \
    "$SPACESHIP_DIR_COLOR" \
    "$SPACESHIP_DIR_PREFIX" \
    "$dir" \
    "$SPACESHIP_DIR_SUFFIX"
}
