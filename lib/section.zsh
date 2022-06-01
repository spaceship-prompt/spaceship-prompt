# ------------------------------------------------------------------------------
# SECTION
# Functions for packing, extracting and rendering sections.
# ------------------------------------------------------------------------------

# Pack section into a tuple of section data joined by a delimiter.
# USAGE:
#   spaceship::section <color> [prefix] <content> [suffix]
spaceship::section() {
  local result=()
  local color prefix content suffix

  [[ -n "$1" ]] && color="$1"      || color=""
  [[ -n "$2" ]] && prefix="$2"     || prefix=""
  [[ -n "$3" ]] && content="$3"    || content=""
  [[ -n "$4" ]] && suffix="$4"     || suffix=""

  [[ -z $3 && -z $4 ]] && content="$2" prefix=''

  result+=("$color")
  result+=("$prefix")
  result+=("$content")
  result+=("$suffix")

  echo -n "${(j:·|·:)result}"
}

spaceship::section::v4() {
  # Parse CLI options
  zparseopts -E -D \
    -color:=color_ \
    -prefix:=prefix_ \
    -suffix:=suffix_ \
    -symbol:=symbol_

  local color="${color_[2]}" prefix="${prefix_[2]}" suffix="${suffix_[2]}" symbol="${symbol_[2]}"
  local content="$@"
  local result=()

  result+=("$color")
  result+=("$prefix")
  result+=("$symbol")
  result+=("$content")
  result+=("$suffix")

  echo -n "${(j:·|·:)result}"
}

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
#   spaceship::render_section <section_data>
spaceship::render_section() {
  local tuple="$1" section_data=() result=""

  section_data=("${(@s:·|·:)tuple}")

  local color="" prefix="" content="" suffix=""

  color="${section_data[1]}"
  color="%F{$color}"
  prefix="${section_data[2]}"
  content="${section_data[3]}"
  suffix="${section_data[4]}"

  if [[ -z "$content" ]]; then
    return
  fi

  if [[ "$_spaceship_prompt_opened" == true ]] \
  && [[ "$SPACESHIP_PROMPT_PREFIXES_SHOW" == true ]] \
  && [[ -n "$prefix" ]]; then
    result+="%{%B%}" # set bold
    result+="$prefix"
    result+="%{%b%}" # unset bold
  fi

  _spaceship_prompt_opened=true

  result+="%{%B$color%}" # set color
  result+="$content"     # section content
  result+="%{%b%f%}"     # unset color

  if [[ "$SPACESHIP_PROMPT_SUFFIXES_SHOW" == true ]] \
  && [[ -n "$suffix" ]]; then
    result+="%{%B%}" # reset bold, if it was diabled before
    result+="$suffix"
    result+="%{%b%}" # unset bold
  fi

  echo -n "$result"
}
