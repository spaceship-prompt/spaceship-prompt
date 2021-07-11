#
# Google Cloud Platform (gcloud)
#
# gcloud is a tool that provides the primary command-line interface to Google Cloud Platform.
# Link: https://cloud.google.com/sdk/gcloud/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GCLOUD_SHOW="${SPACESHIP_GCLOUD_SHOW=true}"
SPACESHIP_GCLOUD_PREFIX="${SPACESHIP_GCLOUD_PREFIX="using "}"
SPACESHIP_GCLOUD_SUFFIX="${SPACESHIP_GCLOUD_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GCLOUD_SYMBOL="${SPACESHIP_GCLOUD_SYMBOL="☁️  "}"
SPACESHIP_GCLOUD_COLOR="${SPACESHIP_GCLOUD_COLOR="26"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows active gcloud configuration.
spaceship_gcloud() {
  [[ $SPACESHIP_GCLOUD_SHOW == false ]] && return

  # Check if the glcoud-cli is installed
  spaceship::exists gcloud || return

  # Set the gcloud config base dir
  local GCLOUD_DIR=${HOME}/.config/gcloud/

  # Check if there is an active config
  [[ -f ${GCLOUD_DIR}/active_config ]] || return

  # Check if there is an active config override
  if (( ${+CLOUDSDK_ACTIVE_CONFIG_NAME} )); then
    # Uses the current config from the environment variable
    local GCLOUD_ACTIVE_CONFIG=${CLOUDSDK_ACTIVE_CONFIG_NAME}
  else
    # Reads the current config from the file
    local GCLOUD_ACTIVE_CONFIG=$(head -n1 ${GCLOUD_DIR}/active_config)
  fi

  # Check the active config file exists
  local GCLOUD_ACTIVE_CONFIG_FILE=${GCLOUD_DIR}/configurations/config_${GCLOUD_ACTIVE_CONFIG}
  [[ -f ${GCLOUD_ACTIVE_CONFIG_FILE} ]] || return

  # Reads the current project from the active config file
  local GCLOUD_ACTIVE_PROJECT=$(sed -n 's/project = \(.*\)/\1/p' ${GCLOUD_ACTIVE_CONFIG_FILE})

  # Sets the prompt text to `active-config/active-project`
  SPACESHIP_GCLOUD_TEXT="${GCLOUD_ACTIVE_CONFIG}/${GCLOUD_ACTIVE_PROJECT}"

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_GCLOUD_COLOR" \
    "$SPACESHIP_GCLOUD_PREFIX" \
    "${SPACESHIP_GCLOUD_SYMBOL}${SPACESHIP_GCLOUD_TEXT}" \
    "$SPACESHIP_GCLOUD_SUFFIX"
}
