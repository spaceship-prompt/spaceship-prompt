#
# Maven
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

: ${SPACESHIP_MAVEN_SHOW=true}
: ${SPACESHIP_MAVEN_PREFIX="on "}
: ${SPACESHIP_MAVEN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}
: ${SPACESHIP_MAVEN_SYMBOL="𝑚 "}
: ${SPACESHIP_MAVEN_COLOR="yellow"}

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current Maven version
spaceship_maven() {
  [[ $SPACESHIP_MAVEN_SHOW == false ]] && return

  # Check if local ./mvnw first or system mvn is available
  { spaceship::exists ./mvnw && mvn_command="./mvnw" } || { spaceship::exists mvn && mvn_command=mvn } || return

  # Check if maven project
  [[ -f pom.xml ]] || return

  local mvn_version=$($mvn_command --version 2>&1 | grep '^Apache Maven' | awk -F ' ' '{print $3}')

  spaceship::section \
    "$SPACESHIP_MAVEN_COLOR" \
    "$SPACESHIP_MAVEN_PREFIX" \
    "${SPACESHIP_MAVEN_SYMBOL}v${mvn_version}" \
    "$SPACESHIP_MAVEN_SUFFIX"
}
