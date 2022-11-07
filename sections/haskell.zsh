#
# Haskell
#
# An advanced, purely functional programming language.
# Link: https://www.haskell.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_HASKELL_SHOW="${SPACESHIP_HASKELL_SHOW=true}"
SPACESHIP_HASKELL_ASYNC="${SPACESHIP_HASKELL_ASYNC=true}"
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

  # If there are stack files in the context
  local is_haskell_project=$(spaceship::upsearch stack.yaml)
  [[ -n "$is_haskell_project" || -n *.hs(#qN^/) || -n *.cabal(#qN) ]] || return

  local haskell_version

  # Extracting Haskell version
  if spaceship::exists cabal; then
    haskell_version=$(ghc -- --numeric-version --no-install-ghc)
  elif spaceship::exists stack; then
    haskell_version=$(stack ghc -- --numeric-version --no-install-ghc)
  else
    return
  fi

  spaceship::section \
    --color "$SPACESHIP_HASKELL_COLOR" \
    --prefix "$SPACESHIP_HASKELL_PREFIX" \
    --suffix "$SPACESHIP_HASKELL_SUFFIX" \
    --symbol "$SPACESHIP_HASKELL_SYMBOL" \
    "v$haskell_version"
}
