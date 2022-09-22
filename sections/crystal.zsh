#
# Crystal
#
# Crystal is a programming that aimes to be "fast as C, slick as Ruby."
# Link: https://www.crystal-lang.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_CRYSTAL_SHOW="${SPACESHIP_CRYSTAL_SHOW=true}"
SPACESHIP_CRYSTAL_ASYNC="${SPACESHIP_CRYSTAL_ASYNC=true}"
SPACESHIP_CRYSTAL_PREFIX="${SPACESHIP_CRYSTAL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_CRYSTAL_SUFFIX="${SPACESHIP_CRYSTAL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_CRYSTAL_SYMBOL="${SPACESHIP_CRYSTAL_SYMBOL="🔮 "}"
SPACESHIP_CRYSTAL_COLOR="${SPACESHIP_CRYSTAL_COLOR=069}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Crystal
spaceship_crystal() {
  [[ $SPACESHIP_CRYSTAL_SHOW == false ]] && return

  # Return when crystal is not installed
  spaceship::exists crystal || return

  # If we are in a Crystal-specific project
  local is_crystal_project="$(spaceship::upsearch shard.yml)"
  [[ -n "$is_crystal_project" || -n *.cr(#qN^/) ]] || return

  local crystal_version=$(crystal --version | awk '/Crystal*/ {print $2}')

  spaceship::section \
    --color "$SPACESHIP_CRYSTAL_COLOR" \
    --prefix "$SPACESHIP_CRYSTAL_PREFIX" \
    --suffix "$SPACESHIP_CRYSTAL_SUFFIX" \
    --symbol "$SPACESHIP_CRYSTAL_SYMBOL" \
    "v$crystal_version"
}
