# Java

# Java is a class-based, object-oriented programming language
# Link: https://www.java.com

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
SPACESHIP_JAVA_SHOW="${SPACESHIP_JAVA_SHOW=true}"
SPACESHIP_JAVA_ASYNC="${SPACESHIP_JAVA_ASYNC=true}"
SPACESHIP_JAVA_PREFIX="${SPACESHIP_JAVA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_JAVA_SUFFIX="${SPACESHIP_JAVA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_JAVA_SYMBOL="${SPACESHIP_JAVA_SYMBOL="☕ "}"
SPACESHIP_JAVA_COLOR="${SPACESHIP_JAVA_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------
spaceship_java() {
  [[ $SPACESHIP_JAVA_SHOW == false ]] && return

  # Check if java binary exists
  spaceship::exists java || return

  # Detect java project
  local java_project_globs=('pom.xml' 'build.gradle*' 'settings.gradle*' 'build.xml')
  local is_java_project="$(spaceship::upsearch $java_project_globs)"
  [[ -n "$is_java_project" || -n *.(java|class|jar|war)(#qN^/) ]] || return

  # Extract java version
  local java_version=$(java -version 2>&1 | spaceship::grep version | awk -F '"' '{print $2}')

  # Check if java version is not empty
  [[ -z "$java_version" ]] && return

  spaceship::section \
    --color "$SPACESHIP_JAVA_COLOR" \
    --prefix "$SPACESHIP_JAVA_PREFIX" \
    --suffix "$SPACESHIP_JAVA_SUFFIX" \
    --symbol "$SPACESHIP_JAVA_SYMBOL" \
    "v${java_version}"
}
