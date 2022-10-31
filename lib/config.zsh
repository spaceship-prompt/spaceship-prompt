#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# LOAD USER CONFIG
# Try to load configuration file from pre-defined locations
# ------------------------------------------------------------------------------

if [[ -z "$SPACESHIP_CONFIG_PATH" ]]; then
  SPACESHIP_CONFIG_PATH=(
    "$HOME/.spaceshiprc"
    "$HOME/.spaceshiprc.zsh"
    "${XDG_CONFIG_HOME:="$HOME/.config"}/spaceship.zsh"
    "${XDG_CONFIG_HOME:="$HOME/.config"}/spaceship/spaceship.zsh"
    "${XDG_CONFIG_DIRS:="/etc/xdg"}/spaceship.zsh"
  )
fi

export SPACESHIP_CONFIG

# Find the first existing file if config is not overriden
if [[ -z "$SPACESHIP_CONFIG" ]]; then
  for config in $SPACESHIP_CONFIG_PATH; do
    if [[ -f "$config" ]]; then
      SPACESHIP_CONFIG="$config"
      break
    fi
  done
fi

# Load file if it exists
if [[ -f "$SPACESHIP_CONFIG" ]]; then
  source "$SPACESHIP_CONFIG"
  spaceship::precompile "$SPACESHIP_CONFIG"
fi
