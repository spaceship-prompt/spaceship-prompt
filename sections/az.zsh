#
# Azure Cloud
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AZ_SHOW="${SPACESHIP_AZ_SHOW=true}"
SPACESHIP_AZ_ASYNC="${SPACESHIP_AZ_ASYNC=true}"
SPACESHIP_AZ_PREFIX="${SPACESHIP_AZ_PREFIX="using "}"
SPACESHIP_AZ_SUFFIX="${SPACESHIP_AZ_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AZ_SYMBOL="${SPACESHIP_AZ_SYMBOL="☁️  "}"
SPACESHIP_AZ_COLOR="${SPACESHIP_AZ_COLOR="039"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows active Azure CLI subscription
spaceship_az() {
  [[ $SPACESHIP_AZ_SHOW == false ]] && return

  # Check that Azure CLI is installed
  spaceship::exists az || return

  AZ_ACCOUNT=$(az account show --query name --output tsv 2>/dev/null)
  if [[ -z "$AZ_ACCOUNT" ]]; then
    return
  fi

  # Show prompt section
  spaceship::section \
    --color "$SPACESHIP_AZ_COLOR" \
    --prefix "$SPACESHIP_AZ_PREFIX" \
    --suffix "$SPACESHIP_AZ_SUFFIX" \
    --symbol "$SPACESHIP_AZ_SYMBOL" \
    "$AZ_ACCOUNT"
}
