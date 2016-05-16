#!/usr/bin/env zsh
#
# Author: Denys Dovhan, denysdovhan.com
# https://github.com/denysdovhan/spaceship-zsh-theme

# Source ~/.zshrc because we need oh-my-zsh variables
source "$HOME/.zshrc"

# Red bold error
function error() {
  echo
  echo "$fg_bold[red]Error: $* $reset_color"
  echo
}

# Green bold message
function message() {
  echo
  echo "$fg_bold[green]Message: $* $reset_color"
  echo
}

# Files
REMOTE='https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh'
THEME="$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# If themes folder isn't exist, then make it
[ -d $ZSH_CUSTOM/themes ] || mkdir $ZSH_CUSTOM/themes

# Download theme from repo
if $(command -v curl >/dev/null 2>&1); then
  # Using curl
  curl -o $THEME $REMOTE || { error "Filed!" ; return }
elif $(command -v wget >/dev/null 2>&1); then
  # Using wget
  wget -O $THEME $REMOTE || { error "Filed!" ; return }
else
  # Exit with error
  error "curl and wget are unavailable!"
  exit 1
fi

# Replace current theme to Spaceship.
sed -i "s/ZSH_THEME='.*'/ZSH_THEME='spaceship'/g" "$HOME/.zshrc" \
|| error "Cannot change theme in ~/.zshrc. Please, do it by yourself." \
&& message "Done! Please, reload your terminal."
