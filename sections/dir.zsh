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
SPACESHIP_DIR_EXPAND_USER_PATH="${SPACESHIP_DIR_EXPAND_USER_PATH=false}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_dir() {
  [[ $SPACESHIP_DIR_SHOW == false ]] && return

  local dir

  # Threat repo root as a top-level directory or not
  if [[ $SPACESHIP_DIR_TRUNC_REPO == true ]] && spaceship::is_git; then
    local git_root=$(git rev-parse --show-toplevel)
    dir="$git_root:t${$(expr $(pwd) : "$git_root\(.*\)")}"
  else
    local path_start="~"
    if [[ $SPACESHIP_DIR_EXPAND_USER_PATH == true ]]; then
      local path_start="/"
    fi
    dir="%${SPACESHIP_DIR_TRUNC}${path_start}"
  fi

  spaceship::section \
    "$SPACESHIP_DIR_COLOR" \
    "$SPACESHIP_DIR_PREFIX" \
    "$dir" \
    "$SPACESHIP_DIR_SUFFIX"
}
