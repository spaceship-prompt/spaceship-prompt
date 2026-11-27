#
# Nim
#
# Nim is a statically typed compiled systems programming language.
# Link: https://nim-lang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_NIM_SHOW="${SPACESHIP_NIM_SHOW=true}"
SPACESHIP_NIM_ASYNC="${SPACESHIP_NIM_ASYNC=true}"
SPACESHIP_NIM_PREFIX="${SPACESHIP_NIM_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_NIM_SUFFIX="${SPACESHIP_NIM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_NIM_SYMBOL="${SPACESHIP_NIM_SYMBOL="👑 "}"
SPACESHIP_NIM_COLOR="${SPACESHIP_NIM_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_nim() {
  [[ $SPACESHIP_NIM_SHOW == false ]] && return

  spaceship::exists nim || return

  local is_nim_project="$(spaceship::upsearch "*.nimble" nim.cfg config.nims)"
  [[ -n "$is_nim_project" || -n *.nim(#qN^/) ]] || return

  local nim_version="$(nim --version 2>/dev/null | awk 'NR==1 {print $4}')"

  [[ -n "$nim_version" ]] || return

  spaceship::section \
    --color "$SPACESHIP_NIM_COLOR" \
    --prefix "$SPACESHIP_NIM_PREFIX" \
    --suffix "$SPACESHIP_NIM_SUFFIX" \
    --symbol "$SPACESHIP_NIM_SYMBOL" \
    "v$nim_version"
}
