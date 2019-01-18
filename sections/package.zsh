#
# Package
#
# Current package version.
# These package managers supported:
#   * NPM
#   * Cargo

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
  local 'package_version'

  [[ -f package.json ]] && spaceship::exists npm && {
    if spaceship::exists jq; then
      package_version=$(jq -r '.version' package.json 2>/dev/null)
    elif spaceship::exists python; then
      package_version=$(python -c "import json; print(json.load(open('package.json'))['version'])" 2>/dev/null)
    elif spaceship::exists node; then
      package_version=$(node -p "require('./package.json').version" 2> /dev/null)
    fi
  }

  [[ -f Cargo.toml ]] && spaceship::exists cargo && {
    local pkgid=$(cargo pkgid)
    package_version=${pkgid##*\#}
  }

  [[ -z $package_version || "$package_version" == "null" || "$package_version" == "undefined" ]] && return

  spaceship::section \
    "$SPACESHIP_PACKAGE_COLOR" \
    "$SPACESHIP_PACKAGE_PREFIX" \
    "${SPACESHIP_PACKAGE_SYMBOL}v${package_version}" \
    "$SPACESHIP_PACKAGE_SUFFIX"
}
