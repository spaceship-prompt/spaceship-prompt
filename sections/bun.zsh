#
# Bun
#
# Bun is a fast all-in-one JavaScript runtime
# Link: https://bun.sh/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_BUN_SHOW="${SPACESHIP_BUN_SHOW=true}"
SPACESHIP_BUN_ASYNC="${SPACESHIP_BUN_ASYNC=true}"
SPACESHIP_BUN_PREFIX="${SPACESHIP_BUN_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_BUN_SUFFIX="${SPACESHIP_BUN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_BUN_SYMBOL="${SPACESHIP_BUN_SYMBOL="🍞 "}"
SPACESHIP_BUN_COLOR="${SPACESHIP_BUN_COLOR="#fbf0df"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Haskell Tool Stack.
spaceship_bun() {
  [[ $SPACESHIP_BUN_SHOW == false ]] && return

  # Find Bun-specific files or return
  spaceship::upsearch -s bun.lockb bun.lock bunfig.toml || return

  # Find Bun binary
  spaceship::exists bun || return

  # Get Bun version
  local bun_version=$(bun --version)

  spaceship::section \
    --color "$SPACESHIP_BUN_COLOR" \
    --prefix "$SPACESHIP_BUN_PREFIX" \
    --suffix "$SPACESHIP_BUN_SUFFIX" \
    --symbol "$SPACESHIP_BUN_SYMBOL" \
    "v$bun_version"
}
