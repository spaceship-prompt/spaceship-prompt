#
# Scala
#
# Scala is a strongly typed language supporting the functional and object oriented paradigms.
# Link: https://www.scala-lang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SCALA_SHOW="${SPACESHIP_SCALA_SHOW=true}"
SPACESHIP_SCALA_ASYNC="${SPACESHIP_SCALA_ASYNC=true}"
SPACESHIP_SCALA_PREFIX="${SPACESHIP_SCALA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_SCALA_SUFFIX="${SPACESHIP_SCALA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SCALA_SYMBOL="${SPACESHIP_SCALA_SYMBOL="🆂 "}"
SPACESHIP_SCALA_COLOR="${SPACESHIP_SCALA_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_scala() {
  [[ $SPACESHIP_SCALA_SHOW == false ]] && return

  spaceship::exists scalac || return

  local is_scala_context="$(spaceship::upsearch .scalaenv .sbtenv .metals)"
  [[ -n "$is_scala_context" || -n *.scala(#qN^/) || -n *.sbt(#qN^/) ]] || return

  # pipe version info into stdout; won't work otherwise
  local scala_version=$(scalac -version 2>&1 | spaceship::grep -Eo "[0-9]+\.[0-9]+\.[0-9]+")

  [[ -z "$scala_version" || "${scala_version}" == "system" ]] && return

  spaceship::section::v4 \
    --color "$SPACESHIP_SCALA_COLOR" \
    --prefix "$SPACESHIP_SCALA_PREFIX" \
    --suffix "$SPACESHIP_SCALA_SUFFIX" \
    --symbol "$SPACESHIP_SCALA_SYMBOL" \
    "v$scala_version"
}
