#
# PureScript
#
# PureScript is a strongly-typed functional programming language that compiles to JavaScript
# Link: https://www.purescript.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_PURESCRIPT_SHOW="${SPACESHIP_PURESCRIPT_SHOW=true}"
SPACESHIP_PURESCRIPT_ASYNC="${SPACESHIP_PURESCRIPT_ASYNC=true}"
SPACESHIP_PURESCRIPT_PREFIX="${SPACESHIP_PURESCRIPT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_PURESCRIPT_SUFFIX="${SPACESHIP_PURESCRIPT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PURESCRIPT_SYMBOL="${SPACESHIP_PURESCRIPT_SYMBOL="⇔ "}"
SPACESHIP_PURESCRIPT_COLOR="${SPACESHIP_PURESCRIPT_COLOR="white"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_purescript() {
  [[ $SPACESHIP_PURESCRIPR_SHOW == false ]] && return

  # Check if PureScript binary is available
  spaceship::exists purescript || return

  # Show PureScript section only when we are in PS-specific project
  local is_purescript_context="$(spaceship::upsearch spago.dhall)"
  [[ -n "$is_purescript_context" || -n *.purs(#qN^/) ]] || return

  local purescript_version="$(purescript --version)"

  # Display zig section
  spaceship::section \
    --color "$SPACESHIP_PURESCRIPT_COLOR" \
    --prefix "$SPACESHIP_PURESCRIPT_PREFIX" \
    --suffix "$SPACESHIP_PURESCRIPT_SUFFIX" \
    --symbol "$SPACESHIP_PURESCRIPT_SYMBOL" \
    "v$purescript_version"
}
