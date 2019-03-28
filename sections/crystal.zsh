#
# Crystal
#
# A compiled object-oriented language with static type-checking
# Link: https://crystal-lang.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_CRYSTAL_SHOW="${SPACESHIP_CRYSTAL_SHOW=true}"
SPACESHIP_CRYSTAL_PREFIX="${SPACESHIP_CRYSTAL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_CRYSTAL_SUFFIX="${SPACESHIP_CRYSTAL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_CRYSTAL_SYMBOL="${SPACESHIP_CRYSTAL_SYMBOL="💎 "}"
SPACESHIP_CRYSTAL_COLOR="${SPACESHIP_CRYSTAL_COLOR="black"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Crystal
spaceship_crystal() {
  [[ $SPACESHIP_CRYSTAL_SHOW == false ]] && return

  # Show Crystal version only for Crystal-specific folders
  [[ -f shard.yml || -n *.cr(#qN^/) ]] || return

  local 'crystal_version'

  if spaceship::exists crystal; then
    crystal_version=$(crystal -v | awk '/Crystal*/ {print $2}')
  else
    return
  fi

  [[ -z $crystal_version ]] && return

  spaceship::section \
    "$SPACESHIP_CRYSTAL_COLOR" \
    "$SPACESHIP_CRYSTAL_PREFIX" \
    "${SPACESHIP_CRYSTAL_SYMBOL}${crystal_version}" \
    "$SPACESHIP_CRYSTAL_SUFFIX"
}
