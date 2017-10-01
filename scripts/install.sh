#!/usr/bin/env bash
#
# Author: Denys Dovhan, denysdovhan.com
# https://github.com/denysdovhan/spaceship-zsh-theme

# ------------------------------------------------------------------------------
# HELPERS
# Useful functions for common tasks
# ------------------------------------------------------------------------------

# If we have tput, let's set colors
if [[ ! -z $(which tput 2> /dev/null) ]]; then
  reset=$(tput sgr0)
  bold=$(tput bold)
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  blue=$(tput setaf 4)
  magenta=$(tput setaf 5)
  cyan=$(tput setaf 6)
fi

paint() {
  local color=$1 rest=${@:2}
  echo "$color$rest$reset"
}

# ------------------------------------------------------------------------------
# VARIABLES
# Paths to important resources
# ------------------------------------------------------------------------------

REPO='https://github.com/denysdovhan/spaceship-zsh-theme.git'
SOURCE="$PWD/spaceship.zsh"
DEST='/usr/local/share/zsh/site-functions'

# ------------------------------------------------------------------------------
# MAIN
# Checkings and installing process
# ------------------------------------------------------------------------------

# Single-line installation
if [[ ! -f "$SOURCE" ]]; then
  paint $yellow"Spaceship is not present in current directory"

  git clone "$REPO" "$HOME/.spaceship-zsh-theme"

  SOURCE="$HOME/.spaceship-zsh-theme/spaceship.zsh"
else
  paint $cyan "Spaceship is present in current directory"
fi

# Choose Installation path
if [[ ! -w "$DEST" ]]; then
  paint $red "Failed to symlink $SOURCE to $DEST."
  paint $cyan "Trying to symlink $SOURCE to $HOME/.zfunctions..."

  DEST="$HOME/.zfunctions"

  paint $cyan "Adding $DEST to fpath..."
  echo 'fpath=($fpath "'"$DEST"'" )' >> "$HOME/.zshrc"
fi

# Link prompt to fpath
paint $cyan "Linking $SOURCE to $DEST/prompt_spaceship_setup..."
mkdir -p "$DEST"
ln -sf "$SOURCE" "$DEST/prompt_spaceship_setup"

msg="
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
"

{
  echo "$msg" >> "$HOME/.zshrc"
} && {
  paint $green "Done! Please, reload your terminal."
} || {
  # catch
  paint $red "Cannot automatically insert prompt init commands."
  paint $red "Please insert these line into your ~/.zshrc:"
  paint $bold "$msg"
}
