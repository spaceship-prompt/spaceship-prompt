#
# TERRAFORM
#
# TERRAFORM is a tool from Hashicorp for managing infrastructure safely and efficiently.
# Link: http://terraform.io/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_TERRAFORM_SHOW="${SPACESHIP_TERRAFORM_SHOW=true}"
SPACESHIP_TERRAFORM_PREFIX="${SPACESHIP_TERRAFORM_PREFIX="at "}"
SPACESHIP_TERRAFORM_SUFFIX="${SPACESHIP_TERRAFORM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_TERRAFORM_SYMBOL="${SPACESHIP_TERRAFORM_SYMBOL="🏗  "}"
SPACESHIP_TERRAFORM_COLOR="${SPACESHIP_TERRAFORM_COLOR="magenta"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show active terraform workspace
spaceship_terraform() {
  [[ $SPACESHIP_TERRAFORM_SHOW == false ]] && return

  # break if there is no .terraform directory
  [[ -d .terraform ]] || return

  local TF_workspace=$(terraform workspace show 2> /dev/null) || return

  spaceship::section \
    "$SPACESHIP_TERRAFORM_COLOR" \
    "$SPACESHIP_TERRAFORM_PREFIX" \
    "${SPACESHIP_TERRAFORM_SYMBOL}${TF_workspace}" \
    "$SPACESHIP_TERRAFORM_SUFFIX"
}
