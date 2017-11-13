#
# Java
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

: ${SPACESHIP_JAVA_SHOW=true}
: ${SPACESHIP_JAVA_PREFIX="on "}
: ${SPACESHIP_JAVA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}
: ${SPACESHIP_JAVA_SYMBOL="☕ "}
: ${SPACESHIP_JAVA_COLOR="green"}

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current Java version.
spaceship_java() {
  [[ $SPACESHIP_JAVA_SHOW == false ]] && return

  # Check if java is available
  spaceship::exists java || return

  # Check if maven or gradle project
  [[ -f pom.xml || -f build.gradle || -f build.gradle.kts ]] || return

  local java_version=$(java -version 2>&1 | grep '^java version ' | awk -F '"' '{print $2}')

  spaceship::section \
    "$SPACESHIP_JAVA_COLOR" \
    "$SPACESHIP_JAVA_PREFIX" \
    "${SPACESHIP_JAVA_SYMBOL}v${java_version}" \
    "$SPACESHIP_JAVA_SUFFIX"
}
