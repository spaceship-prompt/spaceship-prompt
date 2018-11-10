#
# Package
#
# Current package version.
# These package managers supported:
#   * NPM

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_PACKAGE_SHOW="${SPACESHIP_PACKAGE_SHOW=true}"
SPACESHIP_PACKAGE_PREFIX="${SPACESHIP_PACKAGE_PREFIX="is "}"
SPACESHIP_PACKAGE_SUFFIX="${SPACESHIP_PACKAGE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PACKAGE_SYMBOL="${SPACESHIP_PACKAGE_SYMBOL="📦 "}"
SPACESHIP_PACKAGE_COLOR="${SPACESHIP_PACKAGE_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_package() {
  [[ $SPACESHIP_PACKAGE_SHOW == false ]] && return

  # Show package version only when repository is a package
  # @todo: add more package managers
  [[ -f package.json ]] || return

  spaceship::exists node || return

  # Grep and cut out package version
  local package_version=$(node -p "require('./package.json').version" 2> /dev/null)

  # Handle version not found
  if [[ ! "$package_version" || "$package_version" == "undefined" ]]; then
    package_version="⚠"
  else
    package_version="v${package_version}"
  fi

  spaceship::section \
    "$SPACESHIP_PACKAGE_COLOR" \
    "$SPACESHIP_PACKAGE_PREFIX" \
    "${SPACESHIP_PACKAGE_SYMBOL}${package_version}" \
    "$SPACESHIP_PACKAGE_SUFFIX"
}
