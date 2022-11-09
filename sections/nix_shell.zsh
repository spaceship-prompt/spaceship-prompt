#
# Nix Shell
#
# Nix can be used to provide some kind of virtual environment through the nix-shell command.
# Link: https://nixos.org/manual/nix/stable/command-ref/nix-shell.html

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_NIXSHELL_SHOW="${SPACESHIP_NIXSHELL_SHOW=true}"
SPACESHIP_NIXSHELL_ASYNC="${SPACESHIP_NIXSHELL_ASYNC=false}"
SPACESHIP_NIXSHELL_PREFIX="${SPACESHIP_NIXSHELL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_NIXSHELL_SUFFIX="${SPACESHIP_NIXSHELL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_NIXSHELL_SYMBOL="${SPACESHIP_NIXSHELL_SYMBOL="❄ "}"
SPACESHIP_NIXSHELL_COLOR="${SPACESHIP_NIXSHELL_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows whether nix-shell environment is active
spaceship_nix_shell() {
  [[ $SPACESHIP_NIXSHELL_SHOW == false ]] && return

  [[ -z "$IN_NIX_SHELL" ]] && return

  if [[ -z "$name" || "$name" == "" ]] then
    display_text="$IN_NIX_SHELL"
  else
    display_text="$IN_NIX_SHELL ($name)"
  fi

  # Show prompt section
  spaceship::section \
    --color "$SPACESHIP_NIXSHELL_COLOR" \
    --prefix "$SPACESHIP_NIXSHELL_PREFIX" \
    --suffix "$SPACESHIP_NIXSHELL_SUFFIX" \
    --symbol "$SPACESHIP_NIXSHELL_SYMBOL" \
    "$display_text"
}
