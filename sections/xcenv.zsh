#
# xcenv
#
# Use xcenv to document and manage the Xcode version for your project and system.
# Link: https://xcenv.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_XCENV_ASYNC="${SPACESHIP_XCENV_ASYNC=true}"
SPACESHIP_XCENV_SHOW_LOCAL="${SPACESHIP_XCENV_SHOW_LOCAL=true}"
SPACESHIP_XCENV_SHOW_GLOBAL="${SPACESHIP_XCENV_SHOW_GLOBAL=false}"
SPACESHIP_XCENV_PREFIX="${SPACESHIP_XCENV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_XCENV_SUFFIX="${SPACESHIP_XCENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_XCENV_SYMBOL="${SPACESHIP_XCENV_SYMBOL="🛠 "}"
SPACESHIP_XCENV_COLOR="${SPACESHIP_XCENV_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Xcode
spaceship_xcenv() {
  spaceship::exists xcenv || return

  local xcode_path

  if [[ $SPACESHIP_XCENV_SHOW_GLOBAL == true ]] ; then
    xcode_path=$(xcenv version | sed 's/ .*//')
  elif [[ $SPACESHIP_XCENV_SHOW_LOCAL == true ]] ; then
    if xcenv version | grep ".xcode-version" > /dev/null; then
      xcode_path=$(xcenv version | sed 's/ .*//')
    fi
  fi

  if [ -n "${xcode_path}" ]; then
    local xcode_version_path=$xcode_path"/Contents/version.plist"
    if [ -f ${xcode_version_path} ]; then
      if spaceship::exists defaults; then
        local xcode_version=$(defaults read ${xcode_version_path} CFBundleShortVersionString)

        spaceship::section \
          --color "$SPACESHIP_XCENV_COLOR" \
          --prefix "$SPACESHIP_XCENV_PREFIX" \
          --suffix "$SPACESHIP_XCENV_SUFFIX" \
          --symbol "$SPACESHIP_XCENV_SYMBOL" \
          "$xcode_version"
      fi
    fi
  fi
}
