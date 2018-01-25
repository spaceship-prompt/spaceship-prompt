#
# k8s - Show k8s context and namespace
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_K8S_SHOW="${SPACESHIP_K8S_SHOW=true}"
SPACESHIP_K8S_PREFIX="${SPACESHIP_K8S_PREFIX="at "}"
SPACESHIP_K8S_SUFFIX="${SPACESHIP_K8S_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/kubecontext.zsh"
source "$SPACESHIP_ROOT/sections/k8s_namespace.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show both k8s context and namespace:
#   spaceship_kubecontext
#   spaceship_k8s_namespace
spaceship_k8s() {
  [[ $SPACESHIP_K8S_SHOW == false ]] && return

  local k8s_context="$(spaceship_kubecontext)" k8s_namespace="$(spaceship_k8s_namespace)"

  [[ -z $k8s_context ]] && return

  spaceship::section \
    'white' \
    "$SPACESHIP_K8S_PREFIX" \
    "${k8s_context}${k8s_namespace}" \
    "$SPACESHIP_K8S_SUFFIX"
}