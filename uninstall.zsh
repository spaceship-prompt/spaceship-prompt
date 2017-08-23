#!/usr/bin/env zsh
#
# Author: Denys Dovhan, denysdovhan.com
# https://github.com/denysdovhan/spaceship-zsh-theme

# ------------------------------------------------------------------------------
# VARIABLES
# Paths to important resources
# ------------------------------------------------------------------------------

ZSHRC="$HOME/.zshrc"
DIST="/usr/local/share/zsh/site-functions/prompt_spaceship_setup"

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

# Source ~/.zshrc
source "$ZSHRC"

# Remove symlink
if [[ -L "$DIST" ]]; then
  log "Removing $DIST..."
  rm -f "$DIST"
else
  DIST="$HOME/.zfunctions/prompt_spaceship_setup"
  if [[ -L "DIST" ]]; then
    log "Removing $DIST..."
    rm -f "$DIST"
  else
    warning '"$DIST" is not present'
  fi
fi

# Remove spaceship from .zshrc
if grep -q "spaceship" "$ZSHRC"; then
  log "Removing Spaceship from $ZSHRC"
  sed -i '' '/prompt/d' $ZSHRC
  sed -i '' '/SPACESHIP/d' $ZSHRC
  sed -i '' '/.zfunctions/d' $ZSHRC
else
  warning "Spaceship configuration not found in $ZSHRC!"
fi

success "Done! Spaceship is successfuly removed! Please, reload your terminal."
