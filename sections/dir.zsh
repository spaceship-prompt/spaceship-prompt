#
# Working directory
#
# Current directory. Return only three last items of path

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

: "${SPACESHIP_DIR_SHOW=true}"
: "${SPACESHIP_DIR_PREFIX="in "}"
: "${SPACESHIP_DIR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
: "${SPACESHIP_DIR_TRUNC=3}"
: "${SPACESHIP_DIR_TRUNC_REPO=true}"
: "${SPACESHIP_DIR_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_dir() {
  [[ $SPACESHIP_DIR_SHOW == false ]] && return

  local dir

  # Threat repo root as a top-level directory or not
  if _is_git && [[ $SPACESHIP_DIR_TRUNC_REPO == true ]]; then
    local git_root=$(git rev-parse --show-toplevel)
    dir="$git_root:t${$(expr $(pwd) : "$git_root\(.*\)")}"
  else
    dir="%${SPACESHIP_DIR_TRUNC}~"
  fi

  _prompt_section \
    "$SPACESHIP_DIR_COLOR" \
    "$SPACESHIP_DIR_PREFIX" \
    "$dir" \
    "$SPACESHIP_DIR_SUFFIX"
}
