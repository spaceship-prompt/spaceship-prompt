#
#  Kubernetes (kubectl)
#
# Kubernetes is an open-source system for deployment, scaling,
# and management of containerized applications.
# Link: https://kubernetes.io/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_END_SHOW="${SPACESHIP_END_SHOW=true}"
SPACESHIP_END_PREFIX="${SPACESHIP_END_PREFIX="\n >"}"
SPACESHIP_END_SUFFIX="${SPACESHIP_END_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_KUBECONTEXT_SYMBOL="${SPACESHIP_END_SYMBOL=""}"
SPACESHIP_END_COLOR="${SPACESHIP_END_COLOR=""}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current context in kubectl
spaceship_end() {
  [[ $SPACESHIP_END_SHOW == false ]] && return

  spaceship::exists end || return


  spaceship::section \
    "$SPACESHIP_END_COLOR" \
    "$SPACESHIP_END_PREFIX" \
    "${SPACESHIP_END_SYMBOL}${workspace}" \
    "$SPACESHIP_END_SUFFIX"
}