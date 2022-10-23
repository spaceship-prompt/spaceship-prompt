#
# Node.js
#
# Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
# Link: https://nodejs.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_NODE_SHOW="${SPACESHIP_NODE_SHOW=true}"
SPACESHIP_NODE_ASYNC="${SPACESHIP_NODE_ASYNC=true}"
SPACESHIP_NODE_PREFIX="${SPACESHIP_NODE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_NODE_SUFFIX="${SPACESHIP_NODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_NODE_SYMBOL="${SPACESHIP_NODE_SYMBOL="⬢ "}"
SPACESHIP_NODE_DEFAULT_VERSION="${SPACESHIP_NODE_DEFAULT_VERSION=""}"
SPACESHIP_NODE_COLOR="${SPACESHIP_NODE_COLOR="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of node, exception system.
spaceship_node() {
  [[ $SPACESHIP_NODE_SHOW == false ]] && return

  # Show NODE status only for JS-specific folders
  local is_node_project="$(spaceship::upsearch package.json .nvmrc .node-version node_modules)"
  [[ -n "$is_node_project" || -n *.js(#qN^/) || -n *.cjs(#qN^/) || -n *.mjs(#qN^/) ]] || return

  local node_version

  if spaceship::exists fnm; then
    node_version=$(fnm current 2>/dev/null)
  elif spaceship::exists nvm; then
    node_version=$(nvm current 2>/dev/null)
  elif spaceship::exists nodenv; then
    node_version=$(nodenv version-name)
  elif spaceship::exists node; then
    node_version=$(node -v 2>/dev/null)
  else
    return
  fi

  # Do not show system or default versions
  [[ $node_version == "system" || $node_version == "node" ]] && return
  [[ $node_version == $SPACESHIP_NODE_DEFAULT_VERSION ]] && return

  spaceship::section \
    --color "$SPACESHIP_NODE_COLOR" \
    --prefix "$SPACESHIP_NODE_PREFIX" \
    --suffix "$SPACESHIP_NODE_SUFFIX" \
    --symbol "$SPACESHIP_NODE_SYMBOL" \
    "$node_version"
}
