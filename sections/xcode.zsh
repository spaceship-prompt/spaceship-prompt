#
# Xcode
#
# Xcode is a suite of tools developers use to build apps for Apple platforms.
# Link: https://developer.apple.com/xcode/

HAMMER=$'\xF0\x9F\x94\xA8'

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_XCODE_ASYNC="${SPACESHIP_XCODE_ASYNC=true}"
SPACESHIP_XCODE_SHOW="${SPACESHIP_XCODE_SHOW=true}"
SPACESHIP_XCODE_PREFIX="${SPACESHIP_XCODE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_XCODE_SUFFIX="${SPACESHIP_XCODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_XCODE_SYMBOL="${SPACESHIP_XCODE_SYMBOL="$HAMMER "}"
SPACESHIP_XCODE_COLOR="${SPACESHIP_XCODE_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Deprecations
# ------------------------------------------------------------------------------

spaceship::deprecated SPACESHIP_XCODE_SHOW_LOCAL "Use %BSPACESHIP_XCENV_SHOW_LOCAL%b instead"
spaceship::deprecated SPACESHIP_XCODE_SHOW_GLOBAL "Use %BSPACESHIP_XCENV_SHOW_GLOBAL%b instead"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_xcode() {
  [[ $SPACESHIP_XCODE_SHOW == false ]] && return

  spaceship::upsearch -s "*.xcworkspace" "*.xcodeproj" "Package.swift" || return

  spaceship::exists xed || return

  local xcode_version=$(xed --version | awk '{ print $NF }')

  [[ -z $xcode_version ]] && return

  spaceship::section::v4 \
    --prefix "$SPACESHIP_XCODE_PREFIX" \
    --suffix "$SPACESHIP_XCODE_SUFFIX" \
    --symbol "$SPACESHIP_XCODE_SYMBOL" \
    --color "$SPACESHIP_XCODE_COLOR" \
    "v$xcode_version"
}

if command -v xed >/dev/null 2>&1
then
  (xed --version >/dev/null 2>&1 &) # Perform once in background since first execution is slow.
fi
