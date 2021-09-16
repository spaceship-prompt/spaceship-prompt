#
# Amazon Web Services (AWS)
#
# The AWS Command Line Interface (CLI) is a unified tool to manage AWS services.
# Link: https://aws.amazon.com/cli/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AWS_REGION_SHOW="${SPACESHIP_AWS_REGION_SHOW=false}"
SPACESHIP_AWS_REGION_PREFIX="${SPACESHIP_AWS_REGION_PREFIX="at "}"
SPACESHIP_AWS_REGION_SUFFIX="${SPACESHIP_AWS_REGION_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AWS_REGION_COLOR="${SPACESHIP_AWS_REGION_COLOR="208"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows selected AWS-cli profile.
spaceship_aws_region() {
[[ $SPACESHIP_AWS_REGION_SHOW == false ]] && return

  # Check if the AWS-cli is installed
  spaceship::exists aws || return

  # Is Is any region set in context or overidden by ENV?
  local aws_profile=${AWS_PROFILE=default}
  local aws_config_region=$(aws configure get ${aws_profile}.region)

  [[ ! -z ${aws_config_region} ]] && local aws_region="${aws_config_region}"
  [[ -v $AWS_DEFAULT_REGION ]] && local aws_region=$AWS_DEFAULT_REGION
  [[ -z ${aws_region} ]] && return

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_AWS_REGION_COLOR" \
    "$SPACESHIP_AWS_REGION_PREFIX" \
    "${aws_region}" \
    "$SPACESHIP_AWS_REGION_SUFFIX"
}
