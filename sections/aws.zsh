#
# Amazon Web Services (AWS)
#
# The AWS Command Line Interface (CLI) is a unified tool to manage AWS services.
# Link: https://aws.amazon.com/cli/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AWS_SHOW="${SPACESHIP_AWS_SHOW=true}"
SPACESHIP_AWS_PROFILE_SHOW="${SPACESHIP_AWS_PROFILE_SHOW=true}"
SPACESHIP_AWS_ACCOUNT_ALIAS_SHOW="${SPACESHIP_AWS_ACCOUNT_ALIAS_SHOW=true}"
SPACESHIP_AWS_ACCOUNT_NUMBER_SHOW="${SPACESHIP_AWS_ACCOUNT_NUMBER_SHOW=true}"
SPACESHIP_AWS_ACCOUNT_ROLE_SHOW="${SPACESHIP_AWS_ACCOUNT_ROLE_SHOW=true}"
SPACESHIP_AWS_ACCOUNT_SESSION_SHOW="${SPACESHIP_AWS_ACCOUNT_SESSION_SHOW=true}"
SPACESHIP_AWS_ASYNC="${SPACESHIP_AWS_ASYNC=true}"
SPACESHIP_AWS_PREFIX="${SPACESHIP_AWS_PREFIX="using "}"
SPACESHIP_AWS_SUFFIX="${SPACESHIP_AWS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AWS_SYMBOL="${SPACESHIP_AWS_SYMBOL="☁️ "}"
SPACESHIP_AWS_COLOR="${SPACESHIP_AWS_COLOR="208"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows selected AWS-cli profile.
spaceship_aws() {
  [[ $SPACESHIP_AWS_SHOW == false ]] && return

  local aws_info=""
  

  if [[ $SPACESHIP_AWS_PROFILE_SHOW == true ]]; then
    # Get currently set profile from export or assume default
    local profile=$(export | grep "AWS_PROFILE=" | awk -F "=" '{print $2}' || "default")
    # If cistom profile is not set or is default
    if [[ -z $profile ]] || [[ "$profile" == "default" ]]; then
      aws_info="${aws_info}"
    else
      aws_info="${aws_info} ${profile}"
    fi
  fi

  if [[ $SPACESHIP_AWS_ACCOUNT_NUMBER_SHOW == true ]] || [[ $SPACESHIP_AWS_ACCOUNT_ROLE_SHOW == true ]] || [[ $SPACESHIP_AWS_ACCOUNT_SESSION_SHOW == true ]]; then
    local caller_identity=$(aws sts get-caller-identity --query "Arn" --output text || "error")
  fi

  if [[ $SPACESHIP_AWS_ACCOUNT_ALIAS_SHOW == true ]]; then
    local account_alias=$(aws iam list-account-aliases --query "AccountAliases[0]" --output text || "error")
    if [[ -z $account_alias ]] || [[ "$account_alias" == "error" ]]; then
      aws_info="${aws_info}"
    else
      if [[ $SPACESHIP_AWS_PROFILE_SHOW == true ]] && ( [[ -z $profile ]] || [[ "$profile" == "error" ]]); then
        aws_info="${aws_info} ${account_alias}"
      else
        aws_info="${aws_info}:${account_alias}"
      fi
      
    fi
  fi
  if [[ $SPACESHIP_AWS_ACCOUNT_NUMBER_SHOW == true ]]; then
    local account_number=$(echo $caller_identity | awk -F ":" '{print $5}' || "error")
    if [[ -z $account_number ]] || [[ "$account_number" == "error" ]]; then
      aws_info="${aws_info}"
    else
      aws_info="${aws_info}[${account_number}]"
    fi
  fi
  if [[ $SPACESHIP_AWS_ACCOUNT_ROLE_SHOW == true ]]; then
    local account_role=$(echo $caller_identity | awk -F "/" '{print $2}' || "error")
    if [[ -z $account_role ]] || [[ "$account_role" == "error" ]]; then
      aws_info="${aws_info}"
    else
      aws_info="${aws_info}/${account_role}"
    fi
  fi
  if [[ $SPACESHIP_AWS_ACCOUNT_SESSION_SHOW == true ]]; then
    local account_session=$(echo $caller_identity | awk -F "/" '{print $3}' || "error")
    if [[ -z $account_session ]] || [[ "$account_session" == "error" ]]; then
      aws_info="${aws_info}"
    else
      if [[ $SPACESHIP_AWS_ACCOUNT_ROLE_SHOW == true ]] && ( [[ -z $account_role ]] || [[ "$account_role" == "error" ]]); then
        aws_info="${aws_info} ${account_session}"
      else
        aws_info="${aws_info}/${account_session}"
      fi
    fi
  fi
  
  [[ -z $aws_info ]] || [[ "$aws_info" == "" ]] && SPACESHIP_AWS_SYMBOL="" && return

  # Show prompt section
  spaceship::section \
    --color "$SPACESHIP_AWS_COLOR" \
    --prefix "$SPACESHIP_AWS_PREFIX" \
    --suffix "$SPACESHIP_AWS_SUFFIX" \
    --symbol "$SPACESHIP_AWS_SYMBOL" \
    "$aws_info"
}
