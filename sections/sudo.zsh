#
# Sudo
#
# Sudo is a tool that allows a system administrator to delegate authority to
# users or groups.
# Link: https://www.sudo.ws

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SUDO_SHOW="${SPACESHIP_SUDO_SHOW=true}"
SPACESHIP_SUDO_PREFIX="${SPACESHIP_SUDO_PREFIX="with "}"
SPACESHIP_SUDO_SUFFIX="${SPACESHIP_SUDO_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SUDO_SYMBOL="${SPACESHIP_SUDO_SYMBOL="⚡ "}"
SPACESHIP_SUDO_COLOR="${SPACESHIP_SUDO_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show sudo status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_sudo() {
  # If SPACESHIP_SUDO_SHOW is false, don't show sudo section
  [[ $SPACESHIP_SUDO_SHOW == false ]] && return

  # Check if sudo command is available for execution
  spaceship::exists sudo || return

  local 'sudo_status'

  if sudo -Sln >/dev/null 2>&1; then
      sudo_status='sudo'
  fi

  # Exit section if variable is empty
  [[ -z $sudo_status ]] && return

  # Display sudo section
  spaceship::section \
    "$SPACESHIP_SUDO_COLOR" \
    "$SPACESHIP_SUDO_PREFIX" \
    "$SPACESHIP_SUDO_SYMBOL$sudo_status" \
    "$SPACESHIP_SUDO_SUFFIX"
}
