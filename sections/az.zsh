#
# Azure (az)
#
# The az Command Line Interface (CLI) is a unified tool to manage Microsoft Azure services.
# Link: https://github.com/Azure/azure-cli

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AZ_SHOW="${SPACESHIP_AZ_SHOW=true}"
SPACESHIP_AZ_PREFIX="${SPACESHIP_AZ_PREFIX="using "}"
SPACESHIP_AZ_SUFFIX="${SPACESHIP_AZ_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AZ_SYMBOL="${SPACESHIP_AZ_SYMBOL="☁️ "}"
SPACESHIP_AZ_COLOR="${SPACESHIP_AZ_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows selected AZ-cli profile.
spaceship_az() {
  [[ $SPACESHIP_AZ_SHOW == false ]] && return

  # Check if the az cli is installed
  spaceship::exists az || return

  DEFAULT_GROUP=$(grep "group = .\+" ~/.azure/config | sed 's/group = \(.\+\)/\1/g')
  SUBSCRIPTION=$(grep AzureCloud ~/.azure/clouds.config -A 1 | grep subscription | sed 's/subscription = \(.\+\)/\1/g')

  if [[ -n $DEFAULT_GROUP && -n $SUBSCRIPTION ]]; then
      AZ_STATUS="$SUBSCRIPTION - $DEFAULT_GROUP"
  elif [[ -n $DEFAULT_GROUP ]] ; then
      AZ_STATUS=$DEFAULT_GROUP
  elif [[ -n $SUBSCRIPTION ]] ; then
      AZ_STATUS=$SUBSCRIPTION
  fi

  [[ -n AZ_STATUS ]] || return

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_AZ_COLOR" \
    "$SPACESHIP_AZ_PREFIX" \
    "${SPACESHIP_AZ_SYMBOL}${AZ_STATUS}" \
    "$SPACESHIP_AZ_SUFFIX"
}
