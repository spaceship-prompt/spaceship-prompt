# Internal variable for checking if prompt is opened
spaceship_prompt_opened="$SPACESHIP_PROMPT_FIRST_PREFIX_SHOW"

# Draw prompt section (bold is used as default)
# USAGE:
#   spaceship::section <color> [prefix] <content> [suffix]
spaceship::section() {
  local color prefix content suffix 

  if [[ -z "$1" ]]; then
    color="%f"
  elif [[ $1 == 'keep' ]]; then
    color=""
  else
    color="%F{$1}"
  fi
  [[ -n $2 ]] && prefix="$2"     || prefix=""
  [[ -n $3 ]] && content="$3"    || content=""
  [[ -n $4 ]] && suffix="$4"     || suffix=""

  [[ -z $3 && -z $4 ]] && content=$2 prefix=''

  echo -n "%{%B%}" # set bold
  if [[ $spaceship_prompt_opened == true ]] && [[ $SPACESHIP_PROMPT_PREFIXES_SHOW == true ]]; then
    echo -n "$prefix"
  fi
  spaceship_prompt_opened=true
  [[ -n $color ]] && echo -n "%{%b%}" # unset bold

  [[ -n $color ]] && echo -n "%{%B$color%}" # set color
  echo -n "$content"     # section content
  [[ -n $color ]] && echo -n "%{%b%f%}"     # unset color

  [[ -n $color ]] && echo -n "%{%B%}" # reset bold, if it was diabled before
  if [[ $SPACESHIP_PROMPT_SUFFIXES_SHOW == true ]]; then
    echo -n "$suffix"
  fi
  echo -n "%{%b%}" # unset bold
}

# Compose whole prompt from sections
# USAGE:
#   spaceship::compose_prompt [section...]
spaceship::compose_prompt() {
  # Option EXTENDED_GLOB is set locally to force filename generation on
  # argument to conditions, i.e. allow usage of explicit glob qualifier (#q).
  # See the description of filename generation in
  # http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
  setopt EXTENDED_GLOB LOCAL_OPTIONS

  # Treat the first argument as list of prompt sections
  # Compose whole prompt from diferent parts
  # If section is a defined function then invoke it
  # Otherwise render the 'not found' section
  for section in $@; do
    if spaceship::defined "spaceship_$section"; then
      spaceship_$section
    else
      spaceship::section 'red' "'$section' not found"
    fi
  done
}
