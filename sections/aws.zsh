#
# Amazon Web Services (AWS)
#
# The AWS Command Line Interface (CLI) is a unified tool to manage AWS services.
# Link: https://aws.amazon.com/cli/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AWS_SHOW="${SPACESHIP_AWS_SHOW=true}"
SPACESHIP_AWS_ASYNC="${SPACESHIP_AWS_ASYNC=true}"
SPACESHIP_AWS_PREFIX="${SPACESHIP_AWS_PREFIX="using "}"
SPACESHIP_AWS_SUFFIX="${SPACESHIP_AWS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AWS_SYMBOL="${SPACESHIP_AWS_SYMBOL="☁️ "}"
SPACESHIP_AWS_COLOR="${SPACESHIP_AWS_COLOR="208"}"
SPACESHIP_AWS_SHOW_IDENTITY="${SPACESHIP_AWS_SHOW_IDENTITY=false}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows selected AWS-cli profile.
spaceship_aws() {
  [[ $SPACESHIP_AWS_SHOW == false ]] && return

  local profile=${AWS_VAULT:-$AWS_PROFILE}

  # Is the current profile not the default profile
  [[ -z $profile ]] || [[ "$profile" == "default" ]] && return

  # The identity field is only displayed when the profile is non-default and non-empty.
  # Otherwise, it is impossible to distinguish whether the content belongs to the profile or the identity,
  # which creates ambiguity.
  if [[ $SPACESHIP_AWS_SHOW_IDENTITY == true ]] && spaceship::exists aws; then
    # All formats of ARN (Amazon Resource Name) are supported, for example:
    # 1. arn:aws:iam::123456789012:user/Alice => Alice
    # 2. arn:aws:sts::123456789012:assumed-role/my-role-name/my-role-session-name => my-role-session-name
    # 3. arn:aws:sts::123456789012:federated-user/my-federated-user-name => my-federated-user-name
    local identity=$(aws sts get-caller-identity --query Arn --output text 2> /dev/null | awk -F'[:/]' '{print "'$profile' (" $NF "@" $5 ")"}')
    [[ -n $identity ]] && profile="$identity"
  fi

  # Show prompt section
  spaceship::section \
    --color "$SPACESHIP_AWS_COLOR" \
    --prefix "$SPACESHIP_AWS_PREFIX" \
    --suffix "$SPACESHIP_AWS_SUFFIX" \
    --symbol "$SPACESHIP_AWS_SYMBOL" \
    "$profile"
}
