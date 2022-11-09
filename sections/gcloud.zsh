#
# Google Cloud Platform (gcloud)
#
# gcloud is a tool that provides the primary command-line interface to Google Cloud Platform.
# Link: https://cloud.google.com/sdk/gcloud/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GCLOUD_SHOW="${SPACESHIP_GCLOUD_SHOW=true}"
SPACESHIP_GCLOUD_ASYNC="${SPACESHIP_GCLOUD_ASYNC=true}"
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
  local gcloud_dir=${CLOUDSDK_CONFIG:-"${HOME}/.config/gcloud"}

  # Check if there is an active config
  [[ -f $gcloud_dir/active_config ]] || return

  # Check if there is an active config override
  if (( ${+CLOUDSDK_ACTIVE_CONFIG_NAME} )); then
    # Uses the current config from the environment variable
    local gcloud_active_config=${CLOUDSDK_ACTIVE_CONFIG_NAME}
  else
    # Reads the current config from the file
    local gcloud_active_config=$(head -n1 $gcloud_dir/active_config)
  fi

  # Check the active config file exists
  local gcloud_active_config_file=$gcloud_dir/configurations/config_$gcloud_active_config
  [[ -f $gcloud_active_config_file ]] || return

  # Reads the current project from the active config file
  local gcloud_active_project=$(sed -n 's/project = \(.*\)/\1/p' $gcloud_active_config_file)

  # Sets the prompt text to `active-config/active-project`
  local gcloud_status="$gcloud_active_config/$gcloud_active_project"

  # Show prompt section
  spaceship::section \
    --color "$SPACESHIP_GCLOUD_COLOR" \
    --prefix "$SPACESHIP_GCLOUD_PREFIX" \
    --suffix "$SPACESHIP_GCLOUD_SUFFIX" \
    --symbol "$SPACESHIP_GCLOUD_SYMBOL" \
    "$gcloud_status"
}
