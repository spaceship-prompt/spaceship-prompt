#
#  Kubernetes (kubectl)
#
# Kubernetes is an open-source system for deployment, scaling,
# and management of containerized applications.
# Link: https://kubernetes.io/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_KUBECTL_VERSION_SHOW="${SPACESHIP_KUBECTL_VERSION_SHOW=true}"
SPACESHIP_KUBECTL_VERSION_PREFIX="${SPACESHIP_KUBECTL_VERSION_PREFIX=""}"
SPACESHIP_KUBECTL_VERSION_SUFFIX="${SPACESHIP_KUBECTL_VERSION_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_KUBECTL_VERSION_COLOR="${SPACESHIP_KUBECTL_VERSION_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current kubectl version
spaceship_kubectl_version() {
  [[ $SPACESHIP_KUBECTL_VERSION_SHOW == false ]] && return

  spaceship::exists kubectl || return

  # if kubectl can't connect kubernetes cluster, kubernetes version section will be not shown
  local kubectl_version=$(kubectl version --short 2>/dev/null | grep "Server Version" | sed 's/Server Version: \(.*\)/\1/')
  [[ -z $kubectl_version ]] && return

  spaceship::section \
    "$SPACESHIP_KUBECTL_VERSION_COLOR" \
    "$SPACESHIP_KUBECTL_VERSION_PREFIX" \
    "${kubectl_version}" \
    "$SPACESHIP_KUBECTL_VERSION_SUFFIX"
}
