#
# Elm
#
# A delightful language for reliable webapps.
# Link: https://elm-lang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ELM_SHOW="${SPACESHIP_ELM_SHOW=true}"
SPACESHIP_ELM_PREFIX="${SPACESHIP_ELM_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_ELM_SUFFIX="${SPACESHIP_ELM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ELM_SYMBOL="${SPACESHIP_ELM_SYMBOL="🌳 "}"
SPACESHIP_ELM_COLOR="${SPACESHIP_ELM_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Elm.
spaceship_elm() {
  [[ $SPACESHIP_ELM_SHOW == false ]] && return

  [[ -f elm.json || -f elm-package.json || -d elm-stuff || -n *.elm(#qN^/) ]] || return

  spaceship::exists elm || return

  local elm_version=$(elm --version 2> /dev/null)

  spaceship::section \
    "$SPACESHIP_ELM_COLOR" \
    "$SPACESHIP_ELM_PREFIX" \
    "${SPACESHIP_ELM_SYMBOL}v${elm_version}" \
    "$SPACESHIP_ELM_SUFFIX"
}
