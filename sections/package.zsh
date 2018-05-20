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

  spaceship::exists npm || return

  local 'package_version'

  if spaceship::exists jq; then
    package_version=$(jq -r '.version' package.json 2>/dev/null)
  else
    package_version=$(grep -E '^  "version": "v?([0-9]+\.){1,}' package.json | cut -d\" -f4  2>/dev/null)
  fi

  [[ -z $package_version ]] && return

  spaceship::section \
    "$SPACESHIP_PACKAGE_COLOR" \
    "$SPACESHIP_PACKAGE_PREFIX" \
    "${SPACESHIP_PACKAGE_SYMBOL}${package_version}" \
    "$SPACESHIP_PACKAGE_SUFFIX"
}
