#!/usr/bin/env sh

new_version=$(grep -E '"version": "v?([0-9]+\.){1,}' package.json | cut -d\" -f4 2> /dev/null)
filename="$PWD/spaceship.zsh"

sed -i '' -e "s/SPACESHIP_VERSION='.*'/SPACESHIP_VERSION='$new_version'/g" $filename

git add spaceship.zsh
