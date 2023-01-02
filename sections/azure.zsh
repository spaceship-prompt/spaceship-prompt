#
# Azure Cloud
#
# Azure is a cloud computing platform operated by Microsoft for application management
# Link: https://azure.microsoft.com/en-us/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AZURE_SHOW="${SPACESHIP_AZURE_SHOW=true}"
SPACESHIP_AZURE_ASYNC="${SPACESHIP_AZURE_ASYNC=true}"
SPACESHIP_AZURE_PREFIX="${SPACESHIP_AZURE_PREFIX="using "}"
SPACESHIP_AZURE_SUFFIX="${SPACESHIP_AZURE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AZURE_SYMBOL="${SPACESHIP_AZURE_SYMBOL="☁️ "}"
SPACESHIP_AZURE_COLOR="${SPACESHIP_AZURE_COLOR="039"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows active Azure CLI subscription
spaceship_azure() {
  [[ $SPACESHIP_AZURE_SHOW == false ]] && return

  # Check that Azure CLI is installed
  spaceship::exists az || return

  # Get Azure CLI account
  AZ_ACCOUNT=$(az account show --query name --output tsv 2>/dev/null)

  [[ -z "$AZ_ACCOUNT" ]] && return

  # Show prompt section
  spaceship::section \
    --color "$SPACESHIP_AZURE_COLOR" \
    --prefix "$SPACESHIP_AZURE_PREFIX" \
    --suffix "$SPACESHIP_AZURE_SUFFIX" \
    --symbol "$SPACESHIP_AZURE_SYMBOL" \
    "$AZ_ACCOUNT"
}
