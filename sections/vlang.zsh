#
# V
#
# V is a simple, fast, safe, compiled language for developing maintainable software.
# Link: https://vlang.io/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_VLANG_SHOW="${SPACESHIP_VLANG_SHOW=true}"
SPACESHIP_VLANG_ASYNC="${SPACESHIP_VLANG_ASYNC=true}"
SPACESHIP_VLANG_PREFIX="${SPACESHIP_VLANG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_VLANG_SUFFIX="${SPACESHIP_VLANG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_VLANG_SYMBOL="${SPACESHIP_VLANG_SYMBOL="V "}"
SPACESHIP_VLANG_COLOR="${SPACESHIP_VLANG_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of V, exception system.
spaceship_vlang() {
  [[ $SPACESHIP_VLANG_SHOW == false ]] && return

  # Show V status only for folders containing V files
  local is_v_project=$(spaceship::upsearch v.mod vpkg.json .vpkg-lock.json)
  [[ -n "$is_v_project" || -n *.v(#qN^/) ]] || return

  local v_version

  if spaceship::exists v; then
    v_version=$(v version | cut -d' ' -f2)
  fi

  [[ -z "$v_version" ]] && return

  spaceship::section \
    --color "$SPACESHIP_VLANG_COLOR" \
    --prefix "$SPACESHIP_VLANG_PREFIX" \
    --suffix "$SPACESHIP_VLANG_SUFFIX" \
    --symbol "$SPACESHIP_VLANG_SYMBOL" \
    "v$v_version"
}
