#
# swiftenv
#
# swiftenv allows you to easily install, and switch between multiple versions of Swift.
# Link: https://swiftenv.fuller.li/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SWIFTENV_ASYNC="${SPACESHIP_SWIFTENV_ASYNC=true}"
SPACESHIP_SWIFTENV_SHOW_LOCAL="${SPACESHIP_SWIFTENV_SHOW_LOCAL=true}"
SPACESHIP_SWIFTENV_SHOW_GLOBAL="${SPACESHIP_SWIFTENV_SHOW_GLOBAL=false}"
SPACESHIP_SWIFTENV_PREFIX="${SPACESHIP_SWIFTENV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_SWIFTENV_SUFFIX="${SPACESHIP_SWIFTENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SWIFTENV_SYMBOL="${SPACESHIP_SWIFTENV_SYMBOL="🐦 "}"
SPACESHIP_SWIFTENV_COLOR="${SPACESHIP_SWIFTENV_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Swift
spaceship_swiftenv() {
  spaceship::exists swiftenv || return

  local swift_version

  if [[ $SPACESHIP_SWIFTENV_SHOW_GLOBAL == true ]] ; then
    swift_version=$(swiftenv version | sed 's/ .*//')
  elif [[ $SPACESHIP_SWIFTENV_SHOW_LOCAL == true ]] ; then
    if swiftenv version | grep ".swift-version" > /dev/null; then
      swift_version=$(swiftenv version | sed 's/ .*//')
    fi
  fi

  [ -n "${swift_version}" ] || return

  spaceship::section \
    --color "$SPACESHIP_SWIFTENV_COLOR" \
    --prefix "$SPACESHIP_SWIFTENV_PREFIX" \
    --suffix "$SPACESHIP_SWIFTENV_SUFFIX" \
    --symbol "$SPACESHIP_SWIFTENV_SYMBOL" \
    "$swift_version"
}
