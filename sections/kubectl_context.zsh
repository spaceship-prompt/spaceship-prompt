#
# Kubernetes (kubectl) context
#
# Kubernetes is an open-source system for deployment, scaling,
# and management of containerized applications.
# Link: https://kubernetes.io/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_KUBECTL_CONTEXT_SHOW="${SPACESHIP_KUBECTL_CONTEXT_SHOW=true}"
SPACESHIP_KUBECTL_CONTEXT_ASYNC="${SPACESHIP_KUBECTL_CONTEXT_ASYNC=true}"
SPACESHIP_KUBECTL_CONTEXT_PREFIX="${SPACESHIP_KUBECTL_CONTEXT_PREFIX=""}"
SPACESHIP_KUBECTL_CONTEXT_SUFFIX="${SPACESHIP_KUBECTL_CONTEXT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_KUBECTL_CONTEXT_COLOR="${SPACESHIP_KUBECTL_CONTEXT_COLOR="cyan"}"
SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE="${SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE=true}"
SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=(${SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=})

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current context in kubectl
spaceship_kubectl_context() {
  [[ $SPACESHIP_KUBECTL_CONTEXT_SHOW == false ]] && return

  spaceship::exists kubectl || return

  local kube_context=$(kubectl config current-context 2>/dev/null)
  [[ -z $kube_context ]] && return

  if [[ $SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE == true ]]; then
    local kube_namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
    [[ -n $kube_namespace && "$kube_namespace" != "default" ]] && kube_context="$kube_context ($kube_namespace)"
  fi

  # Apply custom color to section if $kube_context matches a pattern defined in SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS array.
  # See Options.md for usage example.
  local len=${#SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS[@]}
  local it_to=$((len / 2))
  local section_color 'i'
  for ((i = 1; i <= $it_to; i++)); do
    local idx=$(((i - 1) * 2))
    local color="${SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS[$idx + 1]}"
    local pattern="${SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS[$idx + 2]}"
    if [[ "$kube_context" =~ "$pattern" ]]; then
      section_color=$color
      break
    fi
  done

  [[ -z "$section_color" ]] && section_color=$SPACESHIP_KUBECTL_CONTEXT_COLOR

  spaceship::section \
    --color "$section_color" \
    --prefix "$SPACESHIP_KUBECTL_CONTEXT_PREFIX" \
    --suffix "$SPACESHIP_KUBECTL_CONTEXT_SUFFIX" \
    "$kube_context"
}
