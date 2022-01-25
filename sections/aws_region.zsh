#
# Amazon Web Services (AWS)
#
# The AWS Command Line Interface (CLI) is a unified tool to manage AWS services.
# Link: https://aws.amazon.com/cli/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AWS_REGION_SHOW="${SPACESHIP_AWS_REGION_SHOW=false}"
SPACESHIP_AWS_REGION_ASYNC="${SPACESHIP_AWS_REGION_ASYNC=false}"
SPACESHIP_AWS_REGION_PREFIX="${SPACESHIP_AWS_REGION_PREFIX=" "}"
SPACESHIP_AWS_REGION_SUFFIX="${SPACESHIP_AWS_REGION_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AWS_REGION_SYMBOL="${SPACESHIP_AWS_REGION_SYMBOL="🌐"}"
SPACESHIP_AWS_REGION_COLOR="${SPACESHIP_AWS_REGION_COLOR=$SPACESHIP_AWS_COLOR}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows selected AWS-cli profile.
spaceship_aws_region() {
[[ $SPACESHIP_AWS_REGION_SHOW == false ]] && return

  # Check if the AWS-cli is installed
  spaceship::exists aws || return

  # Is Is any region set in context or overridden by ENV?
  local aws_profile=${AWS_PROFILE=default}
  local aws_config_region="$(aws configure get ${aws_profile}.region)"

  if [[ -v AWS_DEFAULT_REGION ]]; then
    AWS_REGION=$AWS_DEFAULT_REGION
  elif [[ ! -z ${aws_config_region} ]]; then
    AWS_REGION="${aws_config_region}"
  fi
  [[ -z ${AWS_REGION} ]] && return

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_AWS_REGION_COLOR" \
    "$SPACESHIP_AWS_REGION_PREFIX" \
    "${SPACESHIP_AWS_REGION_SYMBOL}${AWS_REGION}" \
    "$SPACESHIP_AWS_REGION_SUFFIX"
}
