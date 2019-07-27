#
# Gradle
#
# Gradle is an open-source build automation tool focused on flexibility and performance.
# Link: https://gradle.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GRADLE_SHOW="${SPACESHIP_GRADLE_SHOW=true}"
SPACESHIP_GRADLE_PREFIX="${SPACESHIP_GRADLE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_GRADLE_SUFFIX="${SPACESHIP_GRADLE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GRADLE_SYMBOL="${SPACESHIP_GRADLE_SYMBOL="⬡ "}"
SPACESHIP_GRADLE_DEFAULT_VERSION="${SPACESHIP_GRADLE_DEFAULT_VERSION=""}"
SPACESHIP_GRADLE_COLOR="${SPACESHIP_GRADLE_COLOR="green"}"

SPACESHIP_GRADLE_JVM_SHOW="${SPACESHIP_GRADLE_JVM_SHOW=true}"
SPACESHIP_GRADLE_JVM_PREFIX="${SPACESHIP_GRADLE_JVM_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_GRADLE_JVM_SUFFIX="${SPACESHIP_GRADLE_JVM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GRADLE_JVM_SYMBOL="${SPACESHIP_GRADLE_JVM_SYMBOL="☕️ "}"
SPACESHIP_GRADLE_JVM_DEFAULT_VERSION="${SPACESHIP_GRADLE_JVM_DEFAULT_VERSION=""}"
SPACESHIP_GRADLE_JVM_COLOR="${SPACESHIP_GRADLE_JVM_COLOR="magenta"}"

# ------------------------------------------------------------------------------
# Utils
# ------------------------------------------------------------------------------

spaceship::gradle::find_root_project() {
  local root="$1"

  while [ "$root" ] && \
        [ ! -f "$root/settings.gradle" ] && \
        [ ! -f "$root/settings.gradle.kts" ]; do
    root="${root%/*}"
  done

  print "$root"
}

spaceship::gradle::versions() {
  local gradle_exe="$1" gradle_version_output gradle_version jvm_version

  gradle_version_output=$("$gradle_exe" --version)
  gradle_version=$(echo "$gradle_version_output" | awk '{ if ($1 ~ /^Gradle/) { print "v" $2 } }')
  jvm_version=$(echo "$gradle_version_output" | awk '{ if ($1 ~ /^JVM:/) { print "v" $2 } }')

  print gradle "$gradle_version" jvm "$jvm_version"
}

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of gradle.
spaceship_gradle() {
  [[ $SPACESHIP_GRADLE_SHOW == false ]] && return

  local gradle_root_dir

  gradle_root_dir=$(spaceship::gradle::find_root_project "$(pwd -P)")

  # Show Gradle status only for applicable folders
  [[ -n "$gradle_root_dir" ]] &>/dev/null || return

  local -A gradle_versions

  if [[ -f "$gradle_root_dir/gradlew" ]]; then
    gradle_versions=($(spaceship::gradle::versions "$gradle_root_dir/gradlew"))
  elif spaceship::exists gradle; then
    gradle_versions=($(spaceship::gradle::versions gradle))
  else
    return
  fi

  [[ "${gradle_versions[gradle]}" == "$SPACESHIP_GRADLE_DEFAULT_VERSION" ]] && return

  spaceship::section \
    "$SPACESHIP_GRADLE_COLOR" \
    "$SPACESHIP_GRADLE_PREFIX" \
    "${SPACESHIP_GRADLE_SYMBOL}${gradle_versions[gradle]}" \
    "$SPACESHIP_GRADLE_SUFFIX"

  [[ $SPACESHIP_GRADLE_JVM_SHOW == false ]] && return

  [[ "${gradle_versions[jvm]}" == "$SPACESHIP_GRADLE_JVM_DEFAULT_VERSION" ]] && return

  spaceship::section \
    "$SPACESHIP_GRADLE_JVM_COLOR" \
    "$SPACESHIP_GRADLE_JVM_PREFIX" \
    "${SPACESHIP_GRADLE_JVM_SYMBOL}${gradle_versions[jvm]}" \
    "$SPACESHIP_GRADLE_JVM_SUFFIX"
}
