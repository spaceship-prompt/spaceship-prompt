#!/usr/bin/env zsh
#
# Author: Denys Dovhan, denysdovhan.com
# https://github.com/denysdovhan/spaceship-zsh-theme

# Source ~/.zshrc because we need oh-my-zsh variables
source "$HOME/.zshrc"

# ------------------------------------------------------------------------------
# HELPERS
# Useful functions for common tasks
# ------------------------------------------------------------------------------

# Check if program exists
# USAGE:
#   exists <program>
exists() {
  command -v $1 >/dev/null 2>&1
}

# Paint text in color
# USAGE:
#   paint <color> [text...]
paint() {
  echo "$fg[$1]${@:2}$reset_color"
}

# Logging functions.
# USAGE:
#   log|error|success [text...]
log()     {        paint 'cyan'  "SPACESHIP: $*"        }
error()   { echo ; paint 'red'   "SPACESHIP: $*" ; echo }
success() { echo ; paint 'green' "SPACESHIP: $*" ; echo }

# ------------------------------------------------------------------------------
# VARIABLES
# Paths to important resources
# ------------------------------------------------------------------------------

URL='https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh'
SPACESHIP="$PWD/spaceship.zsh"
DIST="$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# ------------------------------------------------------------------------------
# MAIN
# Checkings and installing process
# ------------------------------------------------------------------------------

# Should we download Spaceship form GitHub
if [ ! -f "$SPACESHIP" ]; then
  SPACESHIP=$(mktemp /tmp/spaceship.zsh.XXXXXX)
  log "Spaceship is not present in current directory"
  log "Temporary file is created: $SPACESHIP"

  if exists curl; then
    log "Downloading using curl:"
    curl "$URL" -o "$SPACESHIP" || $(error "Failed to load using curl!" && exit 1)
  elif exists wget; then
    log "Downloading using wget:"
    wget "$URL" -O "$SPACESHIP" || $(error "Failed to load using wget!" && exit 1)
  else
    # Exit with error
    error "curl and wget are unavailable!"
    exit 1
  fi
else
  log "Spaceship is present in current directory"
fi

# Check if $ZSH_CUSTOM is available
if [[ -z $ZSH_CUSTOM ]]; then
  error '$ZSH_CUSTOM is not defined!'
  exit 1
fi

# Linking
log "Moving $SPACESHIP to $DIST..."
mkdir -p "$(dirname $DIST)"
cp -f "$SPACESHIP" "$DIST"

# Add source command to ~/.zshrc
log "Sourcing Spacehsip in ~/.zshrc..."
echo '\n'                           >> "$HOME/.zshrc"
echo 'source "'"$DIST"'"'           >> "$HOME/.zshrc"

# Replace current theme to Spaceship
log 'Attempting to change $ZSH_THEME to "spaceship"...'
sed -i'' 's/ZSH_THEME=.*$/ZSH_THEME="spaceship"/g' "$HOME/.zshrc" \
  && success "Done! Please, reload your terminal." \
  || error "Cannot change theme in ~/.zshrc. Please, do it by yourself." \
