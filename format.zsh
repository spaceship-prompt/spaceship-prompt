#!/usr/bin/env zsh

render() {
  # Parse CLI options
  zparseopts -E -D -data:=raw_data -format:=raw_format

  local format="${raw_format[2]}";
  local data_declaration="${raw_data[2]}";
  eval "local -A data=${data_declaration}";

  for key val in ${(kv)data}; do
    echo key="$key" val="$val"
    format="${format//\$$key/$val}"
  done

  echo $format
}

format='via %{%B%F{$color}%}$symbol $version%{%b%f%}'

local -A this_data=(
  [color]='green'
  [symbol]="⬆"
  [version]="v8.9.4"
)

pack_data() {
  local name=$1

  # Output empty declaration if no data is provided
  if [[ -z "${(P)name}" ]]; then
    echo '( )'
    return 1
  fi

  # Output declaration with data
  local declaration="$(declare -p "$name")"

  # Remove assignment form declaration
  echo "${declaration#*=}"
}

render --format "$format" --data "$(pack_data this_data)"
