#
# Ember.js
#
# An open-source JavaScript web framework, based on the MVVM pattern.
# Link: https://www.emberjs.com/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_EMBER_SHOW="${SPACESHIP_EMBER_SHOW=true}"
SPACESHIP_EMBER_PREFIX="${SPACESHIP_EMBER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_EMBER_SUFFIX="${SPACESHIP_EMBER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_EMBER_SYMBOL="${SPACESHIP_EMBER_SYMBOL="🐹 "}"
SPACESHIP_EMBER_COLOR="${SPACESHIP_EMBER_COLOR="210"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Ember, exception system.
spaceship_ember() {
  [[ $SPACESHIP_EMBER_SHOW == false ]] && return

  # Show EMBER status only for folders w/ ember-cli-build.js files
  [[ -f ember-cli-build.js && -f node_modules/ember-cli/package.json ]] || return

  local ember_version=$(grep '"version":' ./node_modules/ember-cli/package.json | cut -d\" -f4)
  [[ $ember_version == "system" || $ember_version == "ember" ]] && return

  spaceship::section \
    "$SPACESHIP_EMBER_COLOR" \
    "$SPACESHIP_EMBER_PREFIX" \
    "${SPACESHIP_EMBER_SYMBOL}${ember_version}" \
    "$SPACESHIP_EMBER_SUFFIX"
}
