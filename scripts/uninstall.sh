#!/usr/bin/env sh
#
# Author: Denys Dovhan, denysdovhan.com
# https://github.com/spaceship-prompt/spaceship-prompt

remove() {
  rm "$1/spaceship.zsh"
  rm "$1/async.zsh"
}

if [ -e /opt/homebrew/bin/zsh ]; then
  remove /opt/homebrew/share/zsh/site-functions
fi

if [ -e /usr/local/bin/zsh ]; then
  remove /usr/local/share/zsh/site-functions
fi

if [ -e /bin/zsh ] || [ -e /usr/bin/zsh ]; then
  for dest in /usr/share/zsh/site-functions /usr/local/share/zsh/site-functions; do
    if [ -d "$dest" ]; then
      remove "$dest"
    fi
  done
fi

remove "$PWD/functions"

echo "Remove spaceship prompt initialization from ~/.zshrc:"
echo "    autoload -U promptinit; promptinit"
echo "    prompt spaceship"
