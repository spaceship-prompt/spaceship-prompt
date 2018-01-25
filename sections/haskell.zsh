#
# Haskell Stack
#
# An advanced, purely functional programming language.
# Link: https://www.haskell.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_HASKELL_SHOW="${SPACESHIP_HASKELL_SHOW=true}"
SPACESHIP_HASKELL_PREFIX="${SPACESHIP_HASKELL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_HASKELL_SUFFIX="${SPACESHIP_HASKELL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HASKELL_SYMBOL="${SPACESHIP_HASKELL_SYMBOL="λ "}"
SPACESHIP_HASKELL_COLOR="${SPACESHIP_HASKELL_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Haskell Tool Stack.
spaceship_haskell() {
  [[ $SPACESHIP_HASKELL_SHOW == false ]] && return

  # If there are stack files in current directory
  [[ -f stack.yaml ]] || return

  # The command is stack, so do not change this to haskell.
  spaceship::exists stack || return

  local haskell_version=$(stack ghc -- --numeric-version --no-install-ghc)

  spaceship::section \
    "$SPACESHIP_HASKELL_COLOR" \
    "$SPACESHIP_HASKELL_PREFIX" \
    "${SPACESHIP_HASKELL_SYMBOL}v${haskell_version}" \
    "$SPACESHIP_HASKELL_SUFFIX"
}
