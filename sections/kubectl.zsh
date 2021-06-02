#
# Kubectl
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_KUBECTL_SHOW="${SPACESHIP_KUBECTL_SHOW=false}"
SPACESHIP_KUBECTL_PREFIX="${SPACESHIP_KUBECTL_PREFIX="at "}"
SPACESHIP_KUBECTL_SUFFIX="${SPACESHIP_KUBECTL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_KUBECTL_COLOR="${SPACESHIP_KUBECTL_COLOR="white"}"
# Additional space is added because ☸️ is much bigger than the other symbols
# See: https://github.com/spaceship-prompt/spaceship-prompt/pull/432
SPACESHIP_KUBECTL_SYMBOL="${SPACESHIP_KUBECTL_SYMBOL="☸️  "}"

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/kubectl_version.zsh"
source "$SPACESHIP_ROOT/sections/kubectl_context.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show both kubectl version and kubectl context:
#   spaceship_kubectl_version
#   spaceship_kubectl_context
spaceship_kubectl() {
  [[ $SPACESHIP_KUBECTL_SHOW == false ]] && return

  local kubectl_version="$(spaceship_kubectl_version)" kubectl_context="$(spaceship_kubectl_context)"

  [[ -z $kubectl_version && -z $kubectl_context ]] && return

  spaceship::section \
    "$SPACESHIP_KUBECTL_COLOR" \
    "$SPACESHIP_KUBECTL_PREFIX" \
    "${SPACESHIP_KUBECTL_SYMBOL}${kubectl_version}${kubectl_context}" \
    "$SPACESHIP_KUBECTL_SUFFIX"
}
