# Lua
#
# Lua is a powerful, efficient, lightweight, embeddable scripting language
# Link: https://lua.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
SPACESHIP_LUA_SHOW="${SPACESHIP_LUA_SHOW=true}"
SPACESHIP_LUA_ASYNC="${SPACESHIP_LUA_ASYNC=true}"
SPACESHIP_LUA_PREFIX="${SPACESHIP_LUA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_LUA_SUFFIX="${SPACESHIP_LUA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_LUA_SYMBOL="${SPACESHIP_LUA_SYMBOL="🌙 "}"
SPACESHIP_LUA_COLOR="${SPACESHIP_LUA_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section(s)
# ------------------------------------------------------------------------------
spaceship_lua() {
  [[ $SPACESHIP_LUA_SHOW == false ]] && return
  spaceship::exists lua || return

  local is_lua_project="$(spaceship::upsearch .lua-version lua)"
  [[ -n "$is_lua_project" || -n *.lua(#qN^/) ]] || return

  local lua_version=$(lua -v | awk '{print $2}')

  spaceship::section \
    --color "$SPACESHIP_LUA_COLOR" \
    --prefix "$SPACESHIP_LUA_PREFIX" \
    --suffix "$SPACESHIP_LUA_SUFFIX" \
    --symbol "${SPACESHIP_LUA_SYMBOL}" \
    "v${lua_version}"
}
