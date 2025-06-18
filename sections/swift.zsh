#
# Swift
#
# Swift is a powerful and intuitive programming language for all Apple platforms.
# Link: https://developer.apple.com/swift/

BIRD=$'\xF0\x9F\x90\xA6'

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SWIFT_ASYNC="${SPACESHIP_SWIFT_ASYNC=true}"
SPACESHIP_SWIFT_SHOW="${SPACESHIP_SWIFT_SHOW=true}"
SPACESHIP_SWIFT_PREFIX="${SPACESHIP_SWIFT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_SWIFT_SUFFIX="${SPACESHIP_SWIFT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SWIFT_SYMBOL="${SPACESHIP_SWIFT_SYMBOL="$BIRD "}"
SPACESHIP_SWIFT_COLOR="${SPACESHIP_SWIFT_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Deprecations
# ------------------------------------------------------------------------------

spaceship::deprecated SPACESHIP_SWIFT_SHOW_LOCAL "Use %BSPACESHIP_SWIFTENV_SHOW_LOCAL%b instead"
spaceship::deprecated SPACESHIP_SWIFT_SHOW_GLOBAL "Use %BSPACESHIP_SWIFTENV_SHOW_GLOBAL%b instead"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_swift() {
  [[ $SPACESHIP_SWIFT_SHOW == false ]] && return

  spaceship::upsearch -s "*.xcworkspace" "*.xcodeproj" "Package.swift" || return

  spaceship::exists swift || return

  local swift_version=$(swift --version 2>/dev/null | head -n 1 | sed -En 's/^.*Apple Swift version (([[:digit:]]+\.)*[[:digit:]]+).*$/\1/ip')

  [[ -z $swift_version ]] && return

  spaceship::section::v4 \
    --prefix "$SPACESHIP_SWIFT_PREFIX" \
    --suffix "$SPACESHIP_SWIFT_SUFFIX" \
    --symbol "$SPACESHIP_SWIFT_SYMBOL" \
    --color "$SPACESHIP_SWIFT_COLOR" \
    "v$swift_version"
}
