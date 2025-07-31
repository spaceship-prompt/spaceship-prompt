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

SPACESHIP_TERRAFORM_SHOW="${SPACESHIP_TERRAFORM_SHOW=true}"
SPACESHIP_TERRAFORM_ASYNC="${SPACESHIP_TERRAFORM_ASYNC=true}"
SPACESHIP_TERRAFORM_PREFIX="${SPACESHIP_TERRAFORM_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_TERRAFORM_SUFFIX="${SPACESHIP_TERRAFORM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_TERRAFORM_SYMBOL="${SPACESHIP_TERRAFORM_SYMBOL="🛠 "}"
SPACESHIP_TERRAFORM_COLOR="${SPACESHIP_TERRAFORM_COLOR="105"}"

# ------------------------------------------------------------------------------
# Section
# ----------------------------------------------- -------------------------------

spaceship_terraform() {
  [[ $SPACESHIP_TERRAFORM_SHOW == false ]] && return

  spaceship::exists terraform || return

  # Show Terraform Workspaces when exists
  local terraform_dir="$(spaceship::upsearch .terraform)"
  [[ -z $terraform_dir ]] && return

  local terraform_workspace=$(<"${terraform_dir}/environment")
  [[ -z $terraform_workspace ]] && return

  spaceship::section \
    --color "$SPACESHIP_TERRAFORM_COLOR" \
    --prefix "$SPACESHIP_TERRAFORM_PREFIX" \
    --suffix "$SPACESHIP_TERRAFORM_SUFFIX" \
    --symbol "$SPACESHIP_TERRAFORM_SYMBOL" \
    "$terraform_workspace"
}
