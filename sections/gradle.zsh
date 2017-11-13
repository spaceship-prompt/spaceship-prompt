#
# Gradle
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

: ${SPACESHIP_GRADLE_SHOW=true}
: ${SPACESHIP_GRADLE_PREFIX="on "}
: ${SPACESHIP_GRADLE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}
: ${SPACESHIP_GRADLE_SYMBOL="⬡ "}
: ${SPACESHIP_GRADLE_COLOR="green"}

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current Gradle version
spaceship_gradle() {
  [[ $SPACESHIP_GRADLE_SHOW == false ]] && return

  # Check if local ./gradlew first or system gradle is available
  { spaceship::exists ./gradlew && gradle_command="./gradlew" } || { spaceship::exists gradle && gradle_command=gradle } || return

  # Check if gradle project
  [[ -f build.gradle || -f build.gradle.kts ]] || return

  local gradle_version=$($gradle_command --version 2>&1 | grep '^Gradle' | awk -F ' ' '{print $2}')

  spaceship::section \
    "$SPACESHIP_GRADLE_COLOR" \
    "$SPACESHIP_GRADLE_PREFIX" \
    "${SPACESHIP_GRADLE_SYMBOL}v${gradle_version}" \
    "$SPACESHIP_GRADLE_SUFFIX"
}
