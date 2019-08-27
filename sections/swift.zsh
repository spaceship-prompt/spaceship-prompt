#
# Swift
#
# A general-purpose, multi-paradigm, compiled programming language by Apple Inc.
# Link: https://developer.apple.com/swift/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SWIFT_SHOW_LOCAL="${SPACESHIP_SWIFT_SHOW_LOCAL=true}"
SPACESHIP_SWIFT_SHOW_GLOBAL="${SPACESHIP_SWIFT_SHOW_GLOBAL=false}"
SPACESHIP_SWIFT_PREFIX="${SPACESHIP_SWIFT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_SWIFT_SUFFIX="${SPACESHIP_SWIFT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SWIFT_SYMBOL="${SPACESHIP_SWIFT_SYMBOL="🐦 "}"
SPACESHIP_SWIFT_COLOR="${SPACESHIP_SWIFT_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Swift
spaceship_swift() {

  local 'swift_version'

  if spaceship::exists swiftenv; then

    # Reads swift version from swiftenv
    if [[ $SPACESHIP_SWIFT_SHOW_GLOBAL == true ]] \
    || ([[ $SPACESHIP_SWIFT_SHOW_LOCAL == true ]] && [ -f Package.swift ]) \
    || ([[ $SPACESHIP_SWIFT_SHOW_LOCAL == true ]] && (swiftenv version | grep ".swift-version" > /dev/null))
    then
      swift_version=$( swiftenv version | sed 's/ .*//' )
    fi

  elif spaceship::exists swift; then

    # Reads swift version from SPM tools-version
    if [[ $SPACESHIP_SWIFT_SHOW_LOCAL == true && -f Package.swift ]] ; then
      swift_version=$( swift package tools-version | sed 's/ .*//'  )
    fi

  else # Neither swiftenv nor SPM installed
    return
  fi

  [ -n "${swift_version}" ] || return

  spaceship::section \
    "$SPACESHIP_SWIFT_COLOR" \
    "$SPACESHIP_SWIFT_PREFIX" \
    "${SPACESHIP_SWIFT_SYMBOL}${swift_version}" \
    "$SPACESHIP_SWIFT_SUFFIX"
}
