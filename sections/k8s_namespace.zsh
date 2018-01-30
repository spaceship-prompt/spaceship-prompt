#
# Kubernetes Namespace
#
# Kubernetes is an open-source system for deployment, scaling,
# and management of containerized applications.
# Link: https://kubernetes.io/
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_K8S_NAMESPACE_SHOW="${SPACESHIP_K8S_NAMESPACE_SHOW=true}"
SPACESHIP_K8S_NAMESPACE_PREFIX="${SPACESHIP_K8S_NAMESPACE_PREFIX=""}"
SPACESHIP_K8S_NAMESPACE_SEPARATOR="${SPACESHIP_K8S_NAMESPACE_SEPARATOR="/"}"
SPACESHIP_K8S_NAMESPACE_SUFFIX="${SPACESHIP_K8S_NAMESPACE_SUFFIX=""}"
SPACESHIP_K8S_NAMESPACE_COLOR="${SPACESHIP_K8S_NAMESPACE_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current context in kubectl
spaceship_k8s_namespace() {
  [[ $SPACESHIP_KUBE_NAMESPACE_SHOW == false ]] && return

  spaceship::exists kubectl || return

  local kube_context=$(kubectl config current-context 2>/dev/null)

  [[ -z $kube_context ]] && return

  local kube_namespace=$(kubectl config view -o jsonpath="{.contexts[?(@.name == \"${kube_context}\")].context.namespace}")

  if [[ -z $kube_namespace ]]; then
    kube_namespace="default"
  fi

  spaceship::section \
    "${SPACESHIP_K8S_NAMESPACE_COLOR}" \
    "${SPACESHIP_K8S_NAMESPACE_PREFIX}" \
    "${SPACESHIP_K8S_NAMESPACE_SEPARATOR}${kube_namespace}" \
    "${SPACESHIP_K8S_NAMESPACE_SUFFIX}"
}
