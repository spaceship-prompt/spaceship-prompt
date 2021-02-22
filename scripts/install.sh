#!/usr/bin/env zsh
#
# Author: Denys Dovhan, denysdovhan.com
# https://github.com/denysdovhan/spaceship-prompt

# ------------------------------------------------------------------------------
# Colors
# Set color variables for colorful output
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

# ------------------------------------------------------------------------------
# VARIABLES
# Paths to important resources
# ------------------------------------------------------------------------------

ZSHRC="${ZDOTDIR:-$HOME}/.zshrc"
REPO='https://github.com/denysdovhan/spaceship-prompt.git'
SOURCE="$PWD/spaceship.zsh"
USER_SOURCE="${ZDOTDIR:-$HOME}/.spaceship-prompt"
DEST='/usr/local/share/zsh/site-functions'
USER_DEST="${ZDOTDIR:-$HOME}/.zfunctions"

# ------------------------------------------------------------------------------
# HELPERS
# Useful functions for common tasks
# ------------------------------------------------------------------------------

# Paint text in specific color with reset
# USAGE:
#   paint <color> [text...]
paint() {
  local color=$1 rest=${@:2}
  echo "$color$rest$reset"
}

# Aliases for common used colors
# Colon at the end is required: https://askubuntu.com/a/521942
# USAGE:
#   info|warn|error|success|code [...text]
info()    { paint "$cyan"   "SPACESHIP: $@" ; }
warn()    { paint "$yellow" "SPACESHIP: $@" ; }
error()   { paint "$red"    "SPACESHIP: $@" ; }
success() { paint "$green"  "SPACESHIP: $@" ; }
code()    { paint "$bold"   "SPACESHIP: $@" ; }

# Append text in .zshrc
# USAGE:
#   append_zshrc [text...]
append_zshrc() {
  info "These lines will be added to your \"${ZDOTDIR:-$HOME}/.zshrc\" file:"
  code "$@"
  echo "$@" >> "${ZDOTDIR:-$HOME}/.zshrc"
}

# ------------------------------------------------------------------------------
# MAIN
# Checkings and installing process
# ------------------------------------------------------------------------------

main() {
  # How we install Spaceship:
  #   1. Install via NPM
  #   2. Install via curl or wget
  if [[ ! -f "$SOURCE" ]]; then
    warn "Spaceship is not present in current directory"
    # Clone repo into the ${ZDOTDIR:-$HOME}/.spaceship-prompt and change SOURCE
    git clone "$REPO" "$USER_SOURCE"
    SOURCE="$USER_SOURCE/spaceship.zsh"
  else
    info "Spaceship is present in current directory"
  fi

  # If we can't symlink to the site-functions, then try to use .zfunctions instead
  if [[ ! -w "$DEST" ]]; then
    error "Failed to symlink $SOURCE to $DEST."

    # Use $USER_DEST instead
    DEST="$USER_DEST"

    info "Adding $DEST to fpath..."
    echo 'fpath=($fpath "'"$DEST"'")' >> "$ZSHRC"

    info "Trying to symlink $SOURCE to $DEST"
  fi

  # Link prompt entry point to fpath
  info "Linking $SOURCE to $DEST/prompt_spaceship_setup..."
  mkdir -p "$DEST"
  ln -sf "$SOURCE" "$DEST/prompt_spaceship_setup"

  # If 'prompt spaceship' is already present in .zshrc, then skip
  if sed 's/#.*//' "$ZSHRC" | grep -q "prompt spaceship"; then
    warn "Spaceship is already present in .zshrc!"
    exit
  fi

  # Enabling statements for .zshrc
  msg="\n# Set Spaceship ZSH as a prompt"
  msg+="\nautoload -U promptinit; promptinit"
  msg+="\nprompt spaceship"

  # Check if appending was successful and perform corresponding actions
  if append_zshrc "$msg"; then
    success "Done! Please, reload your terminal."
    echo
  else
    error "Cannot automatically insert prompt init commands."
    error "Please insert these line into your \"${ZDOTDIR:-$HOME}/.zshrc\" file:"
    code "$msg"
    exit 1
  fi
}

main "$@"
