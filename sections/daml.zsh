#
# Daml
#
# Daml is a smart contract language for building distributed applications
# Link: https://daml.com/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
SPACESHIP_DAML_SHOW="${SPACESHIP_DAML_SHOW=true}"
SPACESHIP_DAML_ASYNC="${SPACESHIP_DAML_ASYNC=true}"
SPACESHIP_DAML_PREFIX="${SPACESHIP_DAML_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_DAML_SUFFIX="${SPACESHIP_DAML_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DAML_SYMBOL="${SPACESHIP_DAML_SYMBOL="Λ "}"
SPACESHIP_DAML_COLOR="${SPACESHIP_DAML_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_daml() {
  [[ $SPACESHIP_DAML_SHOW == false ]] && return

  local is_daml_project="$(spaceship::upsearch daml.yaml)"
  [[ -n "$is_daml_project" ]] || return

  local DAML_VERSION=""

  if [[ -n "$DAML_SDK_VERSION_ENV" ]]; then
    DAML_VERSION="$DAML_SDK_VERSION_ENV"
  else
    DAML_VERSION=$(awk '/^sdk-version:/ {print $2}' "$is_daml_project" | tr -d \"\')
  fi

  [[ -z "$DAML_VERSION" ]] && return


 spaceship::section \
    --color "$SPACESHIP_DAML_COLOR" \
    --prefix "$SPACESHIP_DAML_PREFIX" \
    --suffix "$SPACESHIP_DAML_SUFFIX" \
    --symbol "${SPACESHIP_DAML_SYMBOL}" \
    "v${DAML_VERSION}"
}
