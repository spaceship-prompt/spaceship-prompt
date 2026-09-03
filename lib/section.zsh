#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# SECTION
# Functions for packing, extracting and rendering sections.
# ------------------------------------------------------------------------------

# Strip control characters (e.g. terminal escape sequences) from a string
# before it is embedded in the prompt. Section content, prefixes, suffixes
# and symbols can originate from untrusted sources (git branch names,
# package.json/Cargo.toml version fields, directory names, etc.), so this
# is applied at the single choke point where they're written into the
# rendered prompt string.
spaceship::sanitize() {
  echo -E "${1//[$'\x00'-$'\x1f'$'\x7f']/}"
}

# Pack section into a tuple of section data joined by a delimiter.
# USAGE:
#   spaceship::section \
#     [--color color] \
#     [--prefix prefix] \
#     [--suffix suffix] \
#     [--symbol symbol] \
#     <content>
spaceship::section() {
  # Parse CLI options
  zparseopts -E -D \
    -color:=color_ \
    -prefix:=prefix_ \
    -suffix:=suffix_ \
    -symbol:=symbol_

  local color="${color_[2]}" prefix="${prefix_[2]}" suffix="${suffix_[2]}" symbol="${symbol_[2]}"
  local content="$@"
  local tuple=()

  tuple+=("(")
  tuple+=("$color")
  tuple+=("$prefix")
  tuple+=("$suffix")
  tuple+=("$symbol")
  tuple+=("$content")
  tuple+=(")")

  echo -n "${(j:·|·:)tuple}"
}

# Versioned version of spaceship::section.
# USAGE: Usage is the same as spaceship::section.
spaceship::section::v4() {
  spaceship::section "$@"
}

# Older version of the spaceship::section
# USAGE:
#   spaceship::section <color> [prefix] <content> [suffix]
spaceship::section::v3() {
  local color prefix content suffix

  [[ -n "$1" ]] && color="$1"      || color=""
  [[ -n "$2" ]] && prefix="$2"     || prefix=""
  [[ -n "$3" ]] && content="$3"    || content=""
  [[ -n "$4" ]] && suffix="$4"     || suffix=""

  [[ -z $3 && -z $4 ]] && content="$2" prefix=''

  spaceship::section::v4 \
    --color "$color" \
    --prefix "$prefix" \
    --suffix "$suffix" \
    "$content"
}

# Extract section data and render a section from it.
# USAGE:
#   spaceship::section::render <section_data>
spaceship::section::render() {
  local tuple="$1" section_data=() result=""

  section_data=("${(@s:·|·:)tuple}")

  local opener="" color="" prefix="" content="" suffix="" closer=""

  opener="${section_data[1]}"
  color="${section_data[2]}"
  color="%F{$color}"
  prefix="$(spaceship::sanitize "${section_data[3]}")"
  suffix="$(spaceship::sanitize "${section_data[4]}")"
  symbol="$(spaceship::sanitize "${section_data[5]}")"
  content="$(spaceship::sanitize "${section_data[6]}")"
  closer="${section_data[7]}"

  if [[ -z "$content" && -z "$symbol" ]]; then
    return
  fi

  if [[ "$_spaceship_prompt_opened" == true || "$_spaceship_rprompt_opened" == true ]] \
  && [[ "$SPACESHIP_PROMPT_PREFIXES_SHOW" == true ]] \
  && [[ -n "$prefix" ]]; then
    result+="%{%B%}" # set bold
    result+="$prefix"
    result+="%{%b%}" # unset bold
  fi

  _spaceship_prompt_opened=true
  _spaceship_rprompt_opened=true

  # TODO: Decouple symbol and context when formatting will be introduced
  result+="%{%B$color%}"    # set color
  result+="$symbol$content" # section content
  result+="%{%b%f%}"        # unset color

  if [[ "$SPACESHIP_PROMPT_SUFFIXES_SHOW" == true ]] \
  && [[ -n "$suffix" ]]; then
    result+="%{%B%}" # reset bold, if it was diabled before
    result+="$suffix"
    result+="%{%b%}" # unset bold
  fi

  echo -n "$result"
}
