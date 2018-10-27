#
# Terraform Workspaces
#
# Terraform automates the repetitive tasks of setting up cloud resources
# Link: https://www.terraform.io
#
# This section shows you the current Terraform workspace
# Link: https://www.terraform.io/docs/state/workspaces.html

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_TFWORKSPACE_SHOW="${SPACESHIP_TFWORKSPACE_SHOW=false}"
SPACESHIP_TFWORKSPACE_PREFIX="${SPACESHIP_TFWORKSPACE_PREFIX=""}"
SPACESHIP_TFWORKSPACE_SUFFIX="${SPACESHIP_TFWORKSPACE_SUFFIX=" "}"
SPACESHIP_TFWORKSPACE_SYMBOL="${SPACESHIP_TFWORKSPACE_SYMBOL="⬢ "}"
SPACESHIP_TFWORKSPACE_COLOR="${SPACESHIP_TFWORKSPACE_COLOR="#5c4ee5"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_tfworkspace() {
  [[ $SPACESHIP_TFWORKSPACE_SHOW == false ]] && return

  spaceship::exists terraform || return

  # Show Terraform Workspaces when exists
  [[ -a .terraform/environment ]] || return

  local terraform_workspace=$(cat .terraform/environment)
  [[ -z $terraform_workspace ]] && return

  spaceship::section \
    "$SPACESHIP_TFWORKSPACE_COLOR" \
    "$SPACESHIP_TFWORKSPACE_PREFIX" \
    "$SPACESHIP_TFWORKSPACE_SYMBOL $terraform_workspace" \
    "$SPACESHIP_TFWORKSPACE_SUFFIX"
}
