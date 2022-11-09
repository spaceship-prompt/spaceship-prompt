#
# Sudo
#
# Sudo is a tool that allows a system administrator to delegate authority to
# users or groups.
# Link: https://www.sudo.ws

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SUDO_SHOW="${SPACESHIP_SUDO_SHOW=false}"
SPACESHIP_SUDO_PREFIX="${SPACESHIP_SUDO_PREFIX=""}"
SPACESHIP_SUDO_SUFFIX="${SPACESHIP_SUDO_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SUDO_SYMBOL="${SPACESHIP_SUDO_SYMBOL="↯"}"
SPACESHIP_SUDO_COLOR="${SPACESHIP_SUDO_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show an indicator if the current shell has passwordless sudo available.
spaceship_sudo() {
  # If SPACESHIP_SUDO_SHOW is false, don't show sudo section
  [[ $SPACESHIP_SUDO_SHOW == false ]] && return

  # Check if sudo command is available for execution
  spaceship::exists sudo || return

  # Check if the current shell has passwordless sudo available
  if ! sudo -n true >/dev/null 2>&1; then
    return
  fi

  # Display sudo section
  spaceship::section \
    --color "$SPACESHIP_SUDO_COLOR" \
    --prefix "$SPACESHIP_SUDO_PREFIX" \
    --suffix "$SPACESHIP_SUDO_SUFFIX" \
    --symbol "$SPACESHIP_SUDO_SYMBOL"
}
