#
# Amazon Web Services (AWS)
#
# The AWS Command Line Interface (CLI) is a unified tool to manage AWS services.
# Link: https://aws.amazon.com/cli/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AWS_SHOW="${SPACESHIP_AWS_SHOW=true}"
SPACESHIP_AWS_ASYNC="${SPACESHIP_AWS_ASYNC=false}"
SPACESHIP_AWS_PREFIX="${SPACESHIP_AWS_PREFIX="using "}"
SPACESHIP_AWS_SUFFIX="${SPACESHIP_AWS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AWS_SYMBOL="${SPACESHIP_AWS_SYMBOL="☁️ "}"
SPACESHIP_AWS_COLOR="${SPACESHIP_AWS_COLOR="208"}"

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/aws_region.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

#
# Shows selected AWS-cli profile.
spaceship_aws() {
  [[ $SPACESHIP_AWS_SHOW == false ]] && return

  # Check if the AWS-cli is installed
  spaceship::exists aws || return

  # Is the current profile not the default profile
  [[ -z $AWS_PROFILE ]] || [[ "$AWS_PROFILE" == "default" ]] && return

  # Is there an AWS region set?
  [[ $DEBUG ]] && echo -e "\033[34;1m[DEBUG]\033[0m $(spaceship_aws_region) \n"
  [[ $DEBUG ]] && echo -e "\033[34;1m[DEBUG]\033[0m AWS Region is set to $aws_region \n"

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_AWS_COLOR" \
    "$SPACESHIP_AWS_PREFIX" \
    "${SPACESHIP_AWS_SYMBOL}$AWS_PROFILE${aws_region_section}" \
    "$SPACESHIP_AWS_SUFFIX"
}
