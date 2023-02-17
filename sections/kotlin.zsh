#
# Kotlin
#
# A modern, concise and safe programming language
# Link: https://kotlinlang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_KOTLIN_SHOW="${SPACESHIP_KOTLIN_SHOW=true}"
SPACESHIP_KOTLIN_ASYNC="${SPACESHIP_KOTLIN_ASYNC=true}"
SPACESHIP_KOTLIN_PREFIX="${SPACESHIP_KOTLIN_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_KOTLIN_SUFFIX="${SPACESHIP_KOTLIN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_KOTLIN_SYMBOL="${SPACESHIP_KOTLIN_SYMBOL="🅺 "}"
SPACESHIP_KOTLIN_COLOR="${SPACESHIP_KOTLIN_COLOR="magenta"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_kotlin() {
  [[ $SPACESHIP_KOTLIN_SHOW == false ]] && return

  spaceship::exists kotlinc || return

  [[ -n *.kt(#qN^/) || *.kts(#qN^/) ]] || return

  # Extract kotlin version
  local kotlin_version=$(kotlinc -version 2>&1 | spaceship::grep -oE '([0-9]+\.)([0-9]+\.)?([0-9]+)' | head -n 1)
  [[ -z "$kotlin_version" ]] && return

  spaceship::section \
    --color "$SPACESHIP_KOTLIN_COLOR" \
    --prefix "$SPACESHIP_KOTLIN_PREFIX" \
    --suffix "$SPACESHIP_KOTLIN_SUFFIX" \
    --symbol "$SPACESHIP_KOTLIN_SYMBOL" \
    "v$kotlin_version"
}
