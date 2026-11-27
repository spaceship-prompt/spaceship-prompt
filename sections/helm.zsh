#
# Helm
#
# Helm is a tool for managing Kubernetes packages called charts.
# Link: https://helm.sh/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_HELM_SHOW="${SPACESHIP_HELM_SHOW=true}"
SPACESHIP_HELM_ASYNC="${SPACESHIP_HELM_ASYNC=true}"
SPACESHIP_HELM_PREFIX="${SPACESHIP_HELM_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_HELM_SUFFIX="${SPACESHIP_HELM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HELM_SYMBOL="${SPACESHIP_HELM_SYMBOL="⎈ "}"
SPACESHIP_HELM_COLOR="${SPACESHIP_HELM_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_helm() {
  [[ $SPACESHIP_HELM_SHOW == false ]] && return
  
  spaceship::exists helm || return

  local is_helm_project="$(spaceship::upsearch helmfile.yaml Chart.yaml)"

  [[ -n "$is_helm_project" ]] || return
  
  local helm_version=$(helm version --short --client 2>/dev/null | awk '{print $1}')

  [[ -n "$helm_version" ]] || return

  spaceship::section \
    --color "$SPACESHIP_HELM_COLOR" \
    --prefix "$SPACESHIP_HELM_PREFIX" \
    --suffix "$SPACESHIP_HELM_SUFFIX" \
    --symbol "$SPACESHIP_HELM_SYMBOL" \
    "$helm_version"
}
