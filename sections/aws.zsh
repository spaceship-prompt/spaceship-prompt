# Amazon Web Services (AWS)
SPACESHIP_AWS_SHOW="${SPACESHIP_AWS_SHOW:=true}"
SPACESHIP_AWS_PREFIX="${SPACESHIP_AWS_PREFIX:="using "}"
SPACESHIP_AWS_SUFFIX="${SPACESHIP_AWS_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AWS_SYMBOL="${SPACESHIP_AWS_SYMBOL:="☁️ "}"
SPACESHIP_AWS_COLOR="${SPACESHIP_AWS_COLOR:="208"}"

# Amazon Web Services (AWS)
# Shows selected AWS cli profile.
spaceship_aws() {
  [[ $SPACESHIP_AWS_SHOW == false ]] && return
  # Check if the AWS-cli is installed
  _exists aws || return

  # Is the current profile not the default profile
  [[ -z $AWS_DEFAULT_PROFILE ]] || [[ "$AWS_DEFAULT_PROFILE" == "default" ]] && return

  # Show prompt section
  _prompt_section \
    "$SPACESHIP_AWS_COLOR" \
    "$SPACESHIP_AWS_PREFIX" \
    "${SPACESHIP_AWS_SYMBOL}$AWS_DEFAULT_PROFILE" \
    "$SPACESHIP_AWS_SUFFIX"
}
