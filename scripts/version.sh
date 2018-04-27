#!/usr/bin/env zsh

new_version=$(grep -E '"version": "v?([0-9]+\.){1,}' package.json | cut -d\" -f4 2> /dev/null)
filename="$PWD/spaceship.zsh"

command perl -i -pe "s/SPACESHIP_VERSION='.*'/SPACESHIP_VERSION='$new_version'/g" $filename

git add spaceship.zsh
