#
# IBM Cloud Command Line Interface
#
# Powerful CLIs and tooling to interact with your applications, containers, infrastructure, and other services
# Link: https://www.ibm.com/cloud/cli
#
# This section shows you the current IBM Cloud account
# Link: https://cloud.ibm.com/docs/cli?topic=cli-ibmcloud_commands_account

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_IBMCLOUD_SHOW="${SPACESHIP_IBMCLOUD_SHOW=false}"
SPACESHIP_IBMCLOUD_PREFIX="${SPACESHIP_IBMCLOUD_PREFIX="using "}"
SPACESHIP_IBMCLOUD_SUFFIX="${SPACESHIP_IBMCLOUD_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_IBMCLOUD_SYMBOL="${SPACESHIP_IBMCLOUD_SYMBOL="👔 "}"
SPACESHIP_IBMCLOUD_COLOR="${SPACESHIP_IBMCLOUD_COLOR="039"}"

# ------------------------------------------------------------------------------
# Section
# ----------------------------------------------- -------------------------------

spaceship_ibmcloud() {
    [[ $SPACESHIP_IBMCLOUD_SHOW == false ]] && return

    spaceship::exists ibmcloud || return

    local ibmcloud_account=$(ibmcloud target | grep Account | awk '{print $2}')
    [[ -z $ibmcloud_account ]] && return

    # If no account is targeted, the awk command will return "No", so we need to
    # check for that and set it to the full message manually.
    [[ "No" == $ibmcloud_account ]] && ibmcloud_account="No account targeted"

    spaceship::section \
        "$SPACESHIP_IBMCLOUD_COLOR" \
        "$SPACESHIP_IBMCLOUD_PREFIX" \
        "$SPACESHIP_IBMCLOUD_SYMBOL$ibmcloud_account" \
        "$SPACESHIP_IBMCLOUD_SUFFIX"
}
