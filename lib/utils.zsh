# ------------------------------------------------------------------------------
# UTILS
# Utils for common used actions
# ------------------------------------------------------------------------------

# Check if command exists in $PATH
# USAGE:
#   spaceship::exists <command>
spaceship::exists() {
  command -v $1 > /dev/null 2>&1
}

# Check if function is defined
# USAGE:
#   spaceship::defined <function>
spaceship::defined() {
  typeset -f + "$1" &> /dev/null
}

# Check if the current directory is in a Git repository.
# USAGE:
#   spaceship::is_git
spaceship::is_git() {
  # See https://git.io/fp8Pa for related discussion
  [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
}

# Check if the current directory is in a Mercurial repository.
# USAGE:
#   spaceship::is_hg
spaceship::is_hg() {
  local root="$(pwd -P)"

  while [ $root ] && [ ! -d $root/.hg ]; do
    root="${root%/*}"
  done

  [[ -n "$root" ]] &>/dev/null
}

# Print message backward compatibility warning
# USAGE:
#  spaceship::deprecated <deprecated> [message]
spaceship::deprecated() {
  [[ -n $1 ]] || return
  local deprecated=$1 message=$2
  local deprecated_value=${(P)deprecated} # the value of variable name $deprecated
  [[ -n $deprecated_value ]] || return
  print -P "%{%B%}$deprecated%{%b%} is deprecated. $message"
}

# Display seconds in human readable fromat
# Based on http://stackoverflow.com/a/32164707/3859566
# USAGE:
#   spaceship::displaytime <seconds>
spaceship::displaytime() {
  local T=$1
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  [[ $D > 0 ]] && printf '%dd ' $D
  [[ $H > 0 ]] && printf '%dh ' $H
  [[ $M > 0 ]] && printf '%dm ' $M
  printf '%ds' $S
}

# Union of two or more arrays
# USAGE:
#   spaceship::union [arr1[ arr2[ ...]]]
# EXAMPLE:
#   $ arr1=('a' 'b' 'c')
#   $ arr2=('b' 'c' 'd')
#   $ arr3=('c' 'd' 'e')
#   $ spaceship::union $arr1 $arr2 $arr3
#   > a b c d e
spaceship::union() {
  typeset -U sections=("$@")
  echo $sections
}

# Load a section.
# USAGE:
#   spaceship::load_section SECTION [RELOAD=false]
#
# ARGUMENTS:
#   SECTION: Name of the section to load.
#     Looks in "$SPACESHIP_CUSTOM/sections/" and 
#     "$SPACESHIP_ROOT/sections/" for file "$SECTION.zsh" and loads it. 
#   RELOAD: If $RELOAD is false, wouldn't reload if section already loaded.
#     Setting true is useful for reloading default values of options.
#
# EXAMPLE:
#   $ spaceship::load_section time
#
spaceship::load_section() {
  if [ -z $1 ]; then
    echo "spaceship::load_section: section not specified.
    Usage: spaceship::load_section <section> [reload?=false]"
    return
  fi
  if [ -z $2 ]; then
    $2=false
  fi

  [[ $2 == false ]] && spaceship::defined spaceship_$1 && return

  if [[ -f "$SPACESHIP_CUSTOM/sections/$1.zsh" ]]; then
    source "$SPACESHIP_CUSTOM/sections/$1.zsh"
  elif [[ -f "$SPACESHIP_ROOT/sections/$1.zsh" ]]; then
    source "$SPACESHIP_ROOT/sections/$1.zsh"
  else
    echo "Section '$1' has not been loaded."
  fi
}

# Load all sections in $SPACESHIP_PROMPT_ORDER and $SPACESHIP_RPROMPT_ORDER
# USAGE:
#   spaceship::load_required_sections [reload]
#
# ARGUMENTS:
#   RELOAD: passed as is to 'spaceship::load_section'.
#
spaceship::load_required_sections() {
  for section in $(spaceship::union $SPACESHIP_PROMPT_ORDER $SPACESHIP_RPROMPT_ORDER); do
    spaceship::load_section $section $1
  done
}

# Load a style.
# USAGE:
#   spaceship::load_style STYLE [LOAD_SECTIONS=true]
#
# ARGUMENTS:
#   STYLE: Name of the style to load.
#     Looks in "$SPACESHIP_CUSTOM/styles/" and "$SPACESHIP_ROOT/styles/"
#     for file "$STYLE.zsh" and loads it.
#     See ./docs/Styles.md for more information on how to write styles.
#   LOAD_SECTIONS: If false then doesn't try to load required sections at the
#     end. Useful if running inside another style to avoid redundancy.
#     Note that sections wouldn't be reloaded even if
#     "$SPACESHIP_RELOAD_SECTIONS" is set as true. Avoid setting false
#     at highest level such as in ~/.zshrc.
#
# EXAMPLE:
#   $ spaceship::load_style default
# 
spaceship::load_style() {
  if [ -z $1 ]; then
    echo "spaceship::load_style: style not specified.
    Usage: spaceship::load_style <style>"
    return
  fi
  
  local STYLE_PATH
  if [[ -f "$SPACESHIP_CUSTOM/styles/$1.zsh" ]]; then
    STYLE_PATH="$SPACESHIP_CUSTOM/styles/$1.zsh"
  elif [[ -f "$SPACESHIP_ROOT/styles/$1.zsh" ]]; then
    STYLE_PATH="$SPACESHIP_ROOT/styles/$1.zsh"
  else
    echo "Style '$1' has not been loaded."
    return
  fi

  
  source $STYLE_PATH
  SPACESHIP_STYLE=$1

  [[ $2 == false ]] && return

  spaceship::load_required_sections
}