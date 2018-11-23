#!/usr/bin/env zsh

main() {
  new_version=$(grep -E '"version": "v?([0-9]+\.){1,}' package.json | cut -d\" -f4 2> /dev/null)
  filename="$PWD/spaceship.zsh"

  sed -e "s/SPACESHIP_VERSION='.*'/SPACESHIP_VERSION='$new_version'/g" "$filename" >"$filename.bak"
  mv -- "$filename.bak" "$filename"

  git add spaceship.zsh
}

main "$@"
