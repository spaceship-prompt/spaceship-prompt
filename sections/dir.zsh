# DIR
SPACESHIP_DIR_SHOW="${SPACESHIP_DIR_SHOW:=true}"
SPACESHIP_DIR_PREFIX="${SPACESHIP_DIR_PREFIX:="in "}"
SPACESHIP_DIR_SUFFIX="${SPACESHIP_DIR_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DIR_TRUNC="${SPACESHIP_DIR_TRUNC:=3}"
SPACESHIP_DIR_COLOR="${SPACESHIP_DIR_COLOR:="cyan"}"

SPACESHIP_DIR_TRUNC_IN_GIT="${SPACESHIP_DIR_TRUNC_IN_GIT:=false}"

# DIR
# Current directory. Return only three last items of path
spaceship_dir() {
  [[ $SPACESHIP_DIR_SHOW == false ]] && return

  if _is_git && [[ $SPACESHIP_DIR_TRUNC_IN_GIT == true ]]; then
    GIT_ROOT=$(git rev-parse --show-toplevel)

    _prompt_section \
      "$SPACESHIP_DIR_COLOR" \
      "$SPACESHIP_DIR_PREFIX" \
      "$GIT_ROOT:t${$(expr $(pwd) : "$GIT_ROOT\(.*\)")}" \
      "$SPACESHIP_DIR_SUFFIX"
  else
    _prompt_section \
      "$SPACESHIP_DIR_COLOR" \
      "$SPACESHIP_DIR_PREFIX" \
      "%${SPACESHIP_DIR_TRUNC}~" \
      "$SPACESHIP_DIR_SUFFIX"
  fi
}
