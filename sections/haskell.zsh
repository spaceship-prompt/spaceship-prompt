#
# Haskell
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
SPACESHIP_HASKELL_SUPPORT_CABAL="${SPACESHIP_HASKELL_SUPPORT_CABAL=true}"
SPACESHIP_HASKELL_SUPPORT_STACK="${SPACESHIP_HASKELL_SUPPORT_STACK=true}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Haskell compiler.
spaceship_haskell() {
  [[ $SPACESHIP_HASKELL_SHOW == false ]] && return

  local haskell_version
  if [[ ${SPACESHIP_HASKELL_SUPPORT_CABAL} == true &&
          -n *.cabal(#qN) ]] &&
       spaceship::exists cabal; then
    haskell_version=$(ghc -- --numeric-version --no-install-ghc)
  elif [[ ${SPACESHIP_HASKELL_SUPPORT_STACK} == true &&
            -f stack.yaml ]] &&
         spaceship::exists stack; then
    haskell_version=$(stack ghc -- --numeric-version --no-install-ghc)
  else
    return
  fi

  spaceship::section \
    "$SPACESHIP_HASKELL_COLOR" \
    "$SPACESHIP_HASKELL_PREFIX" \
    "${SPACESHIP_HASKELL_SYMBOL}v${haskell_version}" \
    "$SPACESHIP_HASKELL_SUFFIX"
}
