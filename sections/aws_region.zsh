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

  # Is Is any region set?
  [[ -v $AWS_DEFAULT_REGION ]] && return

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_AWS_REGION_COLOR" \
    "$SPACESHIP_AWS_REGION_PREFIX" \
    "${SPACESHIP_AWS_REGION_SYMBOL}$AWS_DEFAULT_REGION" \
    "$SPACESHIP_AWS_REGION_SUFFIX"
  }
