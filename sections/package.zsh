#
# Package
#
# Current package version.
# These package managers supported:
#   * npm
#   * Lerna
#   * Cargo
#   * Composer
#   * Julia

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_PACKAGE_SHOW="${SPACESHIP_PACKAGE_SHOW=true}"
SPACESHIP_PACKAGE_SHOW_PRIVATE="${SPACESHIP_PACKAGE_SHOW_PRIVATE=false}"
SPACESHIP_PACKAGE_ASYNC="${SPACESHIP_PACKAGE_ASYNC=true}"
SPACESHIP_PACKAGE_PREFIX="${SPACESHIP_PACKAGE_PREFIX="is "}"
SPACESHIP_PACKAGE_SUFFIX="${SPACESHIP_PACKAGE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PACKAGE_SYMBOL="${SPACESHIP_PACKAGE_SYMBOL="📦 "}"
SPACESHIP_PACKAGE_COLOR="${SPACESHIP_PACKAGE_COLOR="red"}"

if [ -z "$SPACESHIP_PACKAGE_ORDER" ]; then
  SPACESHIP_PACKAGE_ORDER=(npm lerna cargo composer julia)
fi

# ------------------------------------------------------------------------------
# Package Managers
# ------------------------------------------------------------------------------

spaceship_package::npm() {
  spaceship::exists npm || return
  spaceship::upsearch -s package.json || return

  local package_version="$(spaceship::datafile package.json version)"
  local is_private_package="$(spaceship::datafile package.json private)"

  if [[ "$SPACESHIP_PACKAGE_SHOW_PRIVATE" == false && "$is_private_package" == true ]]; then
    return 0
  fi

  if [[ "$package_version" == '0.0.0-development' || $package_version == '0.0.0-semantic'* ]]; then
    package_version="(semantic)"
  fi

  echo "$package_version"
}

spaceship_package::lerna() {
  # Show package version from lerna.json if is a lerna monorepo
  # Note: lerna does not have to be installed in the global context
  # so checking for lerna binary does not make sense
  spaceship::exists npm || return
  spaceship::upsearch -s lerna.json || return

  local package_version="$(spaceship::datafile lerna.json version)"

  if [[ "$package_version" == "independent" ]]; then
    package_version="($package_version)"
  fi

  echo "$package_version"
}

spaceship_package::cargo() {
  spaceship::exists cargo || return
  spaceship::upsearch -s Cargo.toml || return

  # Handle missing field `version` in Cargo.toml.
  # `cargo pkgid` need Cargo.lock exists too. If it does't, do not show package version
  # https://github.com/spaceship-prompt/spaceship-prompt/pull/617
  local pkgid=$(cargo pkgid 2>&1)
  echo "$pkgid" | grep -q "error:" && return
  echo "${pkgid##*\#}"
}

spaceship_package::composer() {
  spaceship::exists composer || return
  spaceship::upsearch -s composer.json || return

  spaceship::datafile composer.json "version"
}

spaceship_package::julia() {
  spaceship::exists julia || return
  spaceship::upsearch -s Project.toml || return

  spaceship::datafile Project.toml "version"
}

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_package() {
  [[ $SPACESHIP_PACKAGE_SHOW == false ]] && return

  # Show package version only when repository is a package
  local package_version

  for manager in "${SPACESHIP_PACKAGE_ORDER[@]}"; do
    package_version="$(spaceship_package::$manager)"

    if [[ -z $package_version || "$package_version" == "null" || "$package_version" == "undefined" ]]; then
      continue
    fi

    spaceship::section \
      "$SPACESHIP_PACKAGE_COLOR" \
      "$SPACESHIP_PACKAGE_PREFIX" \
      "${SPACESHIP_PACKAGE_SYMBOL}v${package_version}" \
      "$SPACESHIP_PACKAGE_SUFFIX"

    return
  done
}
