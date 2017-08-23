#!/usr/bin/env zsh
#
# Author: Denys Dovhan, denysdovhan.com
# https://github.com/denysdovhan/spaceship-zsh-theme

# Source ~/.zshrc
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
log()     { echo ; paint 'cyan'  "SPACESHIP: $*" }
error()   { echo ; paint 'red'   "SPACESHIP: $*" }
success() { echo ; paint 'green' "SPACESHIP: $*" ; echo }

# ------------------------------------------------------------------------------
# VARIABLES
# Paths to important resources
# ------------------------------------------------------------------------------

URL='https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh'
SPACESHIP="$PWD/spaceship.zsh"

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

  DOWNLOADED=true
else
  log "Spaceship is present in current directory"
fi

# Choose Installation path

DIST="/usr/local/share/zsh/site-functions"
if [[ ! -w "$DIST" ]]; then
  log "Failed to symlink $SPACESHIP to $DIST, Using $HOME/.zfunctions"
  DIST="$HOME/.zfunctions"
  log  "Adding $DIST to fpath"
  echo 'fpath=( "'"$DIST"'" $fpath )' >> "$HOME/.zshrc"
fi

# Link prompt to fpath
log "Linking $SPACESHIP to $DIST/prompt_spaceship_setup..."
mkdir -p "$(dirname $DIST)"
ln -sf "$SPACESHIP" "$DIST/prompt_spaceship_setup"

local msg="
  autoload -U promptinit; promptinit
  prompt spaceship
  "

read -q "choice?Do you want to set prompt now (Y/n) ?
This will append the following to your .zshrc $msg"

if [[ $choice == "y" ]]; then
  echo 'autoload -U promptinit; promptinit' >> "$HOME/.zshrc"
  echo 'prompt spaceship'                   >> "$HOME/.zshrc"
  success "Done! Please, reload your terminal."
else
  error "Please manually update your .zshrc with the following"
  echo "$msg"
fi
