#!/usr/bin/env zsh
#
# Author: Denys Dovhan, denysdovhan.com
# https://github.com/denysdovhan/spaceship-zsh-theme

# ------------------------------------------------------------------------------
# VARIABLES
# Paths to important resources
# ------------------------------------------------------------------------------

ZSHRC="$HOME/.zshrc"
DIST="$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# ------------------------------------------------------------------------------
# HELPERS
# Useful functions for common tasks
# ------------------------------------------------------------------------------

# Paint text in color
# USAGE:
#   paint <color> [text...]
paint() {
  echo "$fg[$1]${@:2}$reset_color"
}

# Logging functions.
# USAGE:
#   log|error|success [text...]
log()     {        paint 'cyan'   "SPACESHIP: $*"        }
warning() {        paint 'yellow' "SPACESHIP: $*"        }
error()   { echo ; paint 'red'    "SPACESHIP: $*" ; echo }
success() { echo ; paint 'green'  "SPACESHIP: $*" ; echo }

# ------------------------------------------------------------------------------
# MAIN
# Checkings and uninstalling process
# ------------------------------------------------------------------------------

# Source ~/.zshrc because we need oh-my-zsh variables
source "$ZSHRC"

# Check if $ZSH_CUSTOM is set
if [[ -z $ZSH_CUSTOM ]]; then
  error '$ZSH_CUSTOM is not defined!'
  exit 1
fi

# Remove symlink
if [[ -L "$DIST" ]]; then
  log "Removing $DIST..."
  rm -f "$DIST"
else
  warning "$DIST is not present!"
fi

# Remove spaceship from .zshrc
if grep -q "$DIST" "$ZSHRC"; then
  log "Removing Spaceship from $ZSHRC"
  sed -i '' "/source .*\/themes\/spaceship.zsh-theme/d" "$ZSHRC"
else
  warning "$DIST is not sourced in $ZSHRC!"
fi

# Change theme to default one
if grep -q "ZSH_THEME=.*" "$ZSHRC"; then
  log 'Attempting to change theme from "spaceship" to "robbyrussell"'
  sed -i '' 's/ZSH_THEME=.spaceship./ZSH_THEME="robbyrussell"/g' "$ZSHRC"
else
  warning '"spaceship" was not set as theme!'
fi

success "Done! Spaceship is successfuly removed! Please, reload your terminal."