#
# Kubernetes (kubectl)
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_KUBECTL_SHOW="${SPACESHIP_KUBECTL_SHOW=false}"
SPACESHIP_KUBECTL_ASYNC="${SPACESHIP_KUBECTL_ASYNC=true}"
SPACESHIP_KUBECTL_PREFIX="${SPACESHIP_KUBECTL_PREFIX="at "}"
SPACESHIP_KUBECTL_SUFFIX="${SPACESHIP_KUBECTL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_KUBECTL_COLOR="${SPACESHIP_KUBECTL_COLOR="white"}"
SPACESHIP_KUBECTL_SYMBOL="${SPACESHIP_KUBECTL_SYMBOL="☸️ "}"

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/kubectl_version.zsh"
source "$SPACESHIP_ROOT/sections/kubectl_context.zsh"

spaceship::precompile "$SPACESHIP_ROOT/sections/kubectl_version.zsh"
spaceship::precompile "$SPACESHIP_ROOT/sections/kubectl_context.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show both kubectl version and kubectl context:
#   spaceship_kubectl_version
#   spaceship_kubectl_context
spaceship_kubectl() {
  [[ $SPACESHIP_KUBECTL_SHOW == false ]] && return

  local kubectl_version="$(spaceship_kubectl_version)"
  local kubectl_context="$(spaceship_kubectl_context)"

  [[ -z $kubectl_version && -z $kubectl_context ]] && return

  local kubectl_version_section="$(spaceship::section::render $kubectl_version)"
  local kubectl_context_section="$(spaceship::section::render $kubectl_context)"

  spaceship::section \
    --color "$SPACESHIP_KUBECTL_COLOR" \
    --prefix "$SPACESHIP_KUBECTL_PREFIX" \
    --suffix "$SPACESHIP_KUBECTL_SUFFIX" \
    --symbol "$SPACESHIP_KUBECTL_SYMBOL" \
    "${kubectl_version_section}${kubectl_context_section}"
}
