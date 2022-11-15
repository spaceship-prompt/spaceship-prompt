# Kotlin

# Modern programming language that makes developers happier
# Link: https://kotlinlang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
SPACESHIP_KOTLIN_SHOW="${SPACESHIP_KOTLIN_SHOW=true}"
SPACESHIP_KOTLIN_ASYNC="${SPACESHIP_KOTLIN_ASYNC=true}"
SPACESHIP_KOTLIN_PREFIX="${SPACESHIP_KOTLIN_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_KOTLIN_SUFFIX="${SPACESHIP_KOTLIN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_KOTLIN_SYMBOL="${SPACESHIP_KOTLIN_SYMBOL="K"}"
SPACESHIP_KOTLIN_COLOR="${SPACESHIP_KOTLIN_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------
spaceship_kotlin() {
  [[ $SPACESHIP_KOTLIN_SHOW == false ]] && return

  # Check if kotlin binary exists
  spaceship::exists kotlin || return

  # Detect kotlin project
  local kotlin_project_globs=('pom.xml' 'build.gradle*' 'settings.gradle*' 'build.xml')
  local is_kotlin_project="$(spaceship::upsearch $kotlin_project_globs)"
  [[ -n "$is_kotlin_project" || -n *.(kt|kts)(#qN^/) ]] || return

  # Extract kotlin version
  local kotlin_version=$(kotlin -version 2>&1 | spaceship::grep version | cut -d " " --f 3)

  # Check if kotlin version is not empty
  [[ -z "$kotlin_version" ]] && return

  spaceship::section \
    --color "$SPACESHIP_KOTLIN_COLOR" \
    --prefix "$SPACESHIP_KOTLIN_PREFIX" \
    --suffix "$SPACESHIP_KOTLIN_SUFFIX" \
    --symbol "$SPACESHIP_KOTLIN_SYMBOL" \
    "v${kotlin_version}"
}
