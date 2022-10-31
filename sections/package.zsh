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
#   * Maven
#   * Gradle
#   * Python (using pyproject.toml)
#   * Dart (Flutter)

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
  SPACESHIP_PACKAGE_ORDER=(npm lerna cargo composer julia maven gradle python dart)
fi

# ------------------------------------------------------------------------------
# Package Managers
# ------------------------------------------------------------------------------

spaceship_package::npm() {
  spaceship::exists npm || return

  local package_json=$(spaceship::upsearch package.json) || return

  local package_version="$(spaceship::datafile --json $package_json version)"
  local is_private_package="$(spaceship::datafile --json $package_json private)"

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

  local lerna_json=$(spaceship::upsearch lerna.json) || return

  local package_version="$(spaceship::datafile --json $lerna_json version)"

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

  local composer_json=$(spaceship::upsearch composer.json) || return

  spaceship::datafile --json $composer_json "version"
}

spaceship_package::julia() {
  spaceship::exists julia || return

  local project_toml=$(spaceship::upsearch Project.toml) || return

  spaceship::datafile --toml $project_toml "version"
}

spaceship_package::maven() {
  spaceship::upsearch -s pom.xml || return

  local maven_exe=$(spaceship::upsearch mvnw) || (spaceship::exists mvn && maven_exe="mvn") || return

  $maven_exe help:evaluate -q -DforceStdout -D"expression=project.version" 2>/dev/null
}

spaceship_package::gradle() {
  spaceship::upsearch -s settings.gradle settings.gradle.kts || return

  local gradle_exe=$(spaceship::upsearch gradlew) || (spaceship::exists gradle && gradle_exe="gradle") || return

  $gradle_exe properties --no-daemon --console=plain -q 2>/dev/null | grep "^version:" | awk '{printf $2}'
}

spaceship_package::python() {
  local pyproject_toml=$(spaceship::upsearch pyproject.toml) || return

  spaceship::datafile --toml $project_toml "tool.poetry.version"
  if [[ $? != 0 ]]; then
    spaceship::datafile --toml $project_toml "project.version"
  fi
}

spaceship_package::dart() {
  spaceship::exists dart || return

  local pubspec_file=$(spaceship::upsearch pubspec.yaml pubspec.yml) || return

  spaceship::datafile --yaml $pubspec_file "version" 
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
      --color "$SPACESHIP_PACKAGE_COLOR" \
      --prefix "$SPACESHIP_PACKAGE_PREFIX" \
      --suffix "$SPACESHIP_PACKAGE_SUFFIX" \
      --symbol "$SPACESHIP_PACKAGE_SYMBOL" \
      "$package_version"

    return
  done
}
