#
# Azure Cloud
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AZGROUP_SHOW="${SPACESHIP_AZGROUP_SHOW=true}"
SPACESHIP_AZGROUP_PREFIX="${SPACESHIP_AZGROUP_PREFIX="rsg "}"
SPACESHIP_AZGROUP_SUFFIX="${SPACESHIP_AZGROUP_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AZGROUP_SYMBOL="${SPACESHIP_AZGROUP_SYMBOL="☁️ "}"
SPACESHIP_AZGROUP_COLOR="${SPACESHIP_AZGROUP_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows selected AZGROUP-cli profile.
spaceship_azgroup() {
  [[ $SPACESHIP_AZGROUP_SHOW == false ]] && return

  # Check if the AZGROUP-cli is installed
  spaceship::exists az || return

  AZGROUP_GROUP=$(cat /Users/gcarraro/.azure/config | grep group | cut -d "=" -f 2)
  if [[ -z "${AZGROUP_GROUP// }" ]]; then
    return
  fi

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_AZGROUP_COLOR" \
    "$SPACESHIP_AZGROUP_PREFIX" \
    "${SPACESHIP_AZGROUP_SYMBOL}$AZGROUP_GROUP" \
    "$SPACESHIP_AZGROUP_SUFFIX"
}
