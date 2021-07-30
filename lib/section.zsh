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

  result+="%{%B%}" # set bold
  if [[ "$_spaceship_prompt_opened" == true ]] && [[ "$SPACESHIP_PROMPT_PREFIXES_SHOW" == true ]]; then
    result+="$prefix"
  fi
  result+="%{%b%}" # unset bold

  _spaceship_prompt_opened=true

  result+="%{%B$color%}" # set color
  result+="$content"     # section content
  result+="%{%b%f%}"     # unset color

  result+="%{%B%}" # reset bold, if it was diabled before
  if [[ "$SPACESHIP_PROMPT_SUFFIXES_SHOW" == true ]]; then
    result+="$suffix"
  fi
  result+="%{%b%}" # unset bold

  echo -n "$result"
}
