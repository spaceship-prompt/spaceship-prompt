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
SPACESHIP_AWS_SHOW_IDENTITY="${SPACESHIP_AWS_SHOW_IDENTITY=false}"
SPACESHIP_AWS_PREFIX="${SPACESHIP_AWS_PREFIX="using "}"
SPACESHIP_AWS_SUFFIX="${SPACESHIP_AWS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AWS_SYMBOL="${SPACESHIP_AWS_SYMBOL="☁️ "}"
SPACESHIP_AWS_COLOR="${SPACESHIP_AWS_COLOR="208"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows selected AWS-cli profile.
# If SPACESHIP_AWS_SHOW_IDENTITY is true, it will also try to display the account ID
# and user/role name by calling 'aws sts get-caller-identity'.
spaceship_aws() {
  [[ $SPACESHIP_AWS_SHOW == false ]] && return

  local profile=${AWS_VAULT:-$AWS_PROFILE}
  [[ -z "$profile" || "$profile" == "default" ]] && profile=""

  if [[ $SPACESHIP_AWS_SHOW_IDENTITY == true ]]; then
    spaceship::exists aws || return

    local identity
    identity=$(aws sts get-caller-identity --output json 2>/dev/null)
    [[ -n "$identity" ]] || return

    local account_id arn user_or_role
    account_id=$(echo "$identity" | sed -n 's/.*"Account": *"\([^"]*\)".*/\1/p')
    arn=$(echo "$identity" | sed -n 's/.*"Arn": *"\([^"]*\)".*/\1/p')
    user_or_role=${arn#*/}
    user_or_role=${user_or_role#AWSReservedSSO_}

    local sts_info=""
    if [[ -n "$account_id" && -n "$user_or_role" ]]; then
      sts_info="$user_or_role@$account_id"
    fi
  fi

  local content=""
  if [[ -n "$profile" ]] && [[ -n "$sts_info" ]]; then
    content="$profile ($sts_info)"
  elif [[ -n "$profile" ]]; then
    content="$profile"
  elif [[ -n "$sts_info" ]]; then
    content="$sts_info"
  else
    return
  fi

  spaceship::section \
    --color "$SPACESHIP_AWS_COLOR" \
    --prefix "$SPACESHIP_AWS_PREFIX" \
    --suffix "$SPACESHIP_AWS_SUFFIX" \
    --symbol "$SPACESHIP_AWS_SYMBOL" \
    "$content"
}
