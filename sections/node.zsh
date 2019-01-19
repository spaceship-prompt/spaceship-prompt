#
# Node.js
#
# Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
# Link: https://nodejs.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_NODE_SHOW="${SPACESHIP_NODE_SHOW=true}"
SPACESHIP_NODE_PREFIX="${SPACESHIP_NODE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_NODE_SUFFIX="${SPACESHIP_NODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_NODE_SYMBOL="${SPACESHIP_NODE_SYMBOL="⬢ "}"
SPACESHIP_NODE_DEFAULT_VERSION="${SPACESHIP_NODE_DEFAULT_VERSION=""}"
SPACESHIP_NODE_COLOR="${SPACESHIP_NODE_COLOR="green"}"

SPACESHIP_PACKAGE_NPM_SHOW="${SPACESHIP_PACKAGE_NPM_SHOW="$SPACESHIP_PACKAGE_SHOW"}"
SPACESHIP_PACKAGE_NPM_PREFIX="${SPACESHIP_PACKAGE_NPM_PREFIX="$SPACESHIP_PACKAGE_PREFIX"}"
SPACESHIP_PACKAGE_NPM_SUFFIX="${SPACESHIP_PACKAGE_NPM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PACKAGE_NPM_SYMBOL="${SPACESHIP_PACKAGE_NPM_SYMBOL="$SPACESHIP_PACKAGE_SYMBOL"}"
SPACESHIP_PACKAGE_NPM_COLOR="${SPACESHIP_PACKAGE_NPM_COLOR="$SPACESHIP_PACKAGE_COLOR"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of node, exception system.
spaceship_node() {

  if [[ $SPACESHIP_PACKAGE_NPM_SHOW == true ]]; then
    local 'package_version'

    if [[ -f package.json ]] && spaceship::exists npm; then
      if spaceship::exists jq; then
        package_version=$(jq -r '.version' package.json 2>/dev/null)
      elif spaceship::exists python; then
        package_version=$(python -c "import json; print(json.load(open('package.json'))['version'])" 2>/dev/null)
      elif spaceship::exists node; then
        package_version=$(node -p "require('./package.json').version" 2>/dev/null)
      fi
    fi

    [[ -z $package_version || "$package_version" == "null" || "$package_version" == "undefined" ]] && return

    spaceship::section \
      "$SPACESHIP_PACKAGE_NPM_COLOR" \
      "$SPACESHIP_PACKAGE_NPM_PREFIX" \
      "${SPACESHIP_PACKAGE_NPM_SYMBOL}v${package_version}" \
      "$SPACESHIP_PACKAGE_NPM_SUFFIX"
  fi

  if [[ $SPACESHIP_NODE_SHOW == true ]] && \
    [[ -f package.json || -d node_modules || -n *.js(#qN^/) ]]; then

    local 'node_version'

    if spaceship::exists nvm; then
      node_version=$(nvm current 2>/dev/null)
      [[ $node_version == "system" || $node_version == "node" ]] && return
    elif spaceship::exists nodenv; then
      node_version=$(nodenv version-name)
      [[ $node_version == "system" || $node_version == "node" ]] && return
    elif spaceship::exists node; then
      node_version=$(node -v 2>/dev/null)
    else
      return
    fi

    [[ $node_version == $SPACESHIP_NODE_DEFAULT_VERSION ]] && return

    spaceship::section \
      "$SPACESHIP_NODE_COLOR" \
      "$SPACESHIP_NODE_PREFIX" \
      "${SPACESHIP_NODE_SYMBOL}${node_version}" \
      "$SPACESHIP_NODE_SUFFIX"
  fi
}
