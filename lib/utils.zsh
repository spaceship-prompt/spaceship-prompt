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
  command git rev-parse --is-inside-work-tree &>/dev/null
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
#   $ arr2=('c' 'd' 'e')
#   $ spaceship::union $arr1 $arr2 $arr3
#   > a b c d e
spaceship::union() {
  typeset -U sections=("$@")
  echo $sections
}

# Parse a semver (https://semver.org) into an associative array.
# Empty values are marked with a '*'.
# USAGE:
#   spaceship::parse_semver <semver>
# EXAMPLE:
#   $ spaceship::parse_semver 3.2.1-alpha.2+20160130175002
#   > patch 1 prere alpha.2 major 3 build 20160130175002 minor 2
#   $ spaceship::parse_semver 3.2.1
#   > patch 1 prere * major 3 build * minor 2
spaceship::parse_semver() {
  local version=$1
  local semver_regex="^(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)(\\-([0-9A-Za-z-]+(\\.[0-9A-Za-z-]+)*))?(\\+([0-9A-Za-z-]+(\\.[0-9A-Za-z-]+)*))?$"
  if [[ "$version" =~ $semver_regex ]]; then
    typeset -A parsed
    parsed[major]="${match[1]}"
    parsed[minor]="${match[2]}"
    parsed[patch]="${match[3]}"
    parsed[prere]="${match[5]}"
    parsed[build]="${match[8]}"
    if [[ -z "${parsed[prere]}" ]]; then
      parsed[prere]='*'
    fi
    if [[ -z "${parsed[build]}" ]]; then
      parsed[build]="*"
    fi
    echo "${(kv)parsed}"
    return 0
  else
    return 1
  fi
}

# Compare two semvers (https://semver.org)
# Outputs
#   -1 if semver1 < semver2
#    0 if semver1 = semver2
#    1 if semver1 > semver2
# USAGE:
#   spaceship::compare_semver <semver1> <semver2>
# EXAMPLE:
#   $ spaceship::compare_semver 3.2.1 3.2.1
#   > 0
#   $ spaceship::compare_semver 3.2.1 3.3.1
#   > -1
#   $ spaceship::compare_semver 8.2.1 3.3.1
#   > 1
#   spaceship::compare_semver 3.2.1 3.2.1-alpha
#   > 1
#   spaceship::compare_semver 3.2.1-alpha+1 3.2.1-alpha+2
#   > 0
spaceship::compare_semver() {
  typeset -A version1 version2
  version1=($(spaceship::parse_semver $1))
  version2=($(spaceship::parse_semver $2))

  # Stop if there were parse errors
  [[ ! "$version1" || ! "$version2" ]] && return 1

  # Major, minor and patch MUST be compared numericaly in order
  for i in major minor patch; do
    local v1=${version1[$i]}
    local v2=${version2[$i]}
    if (( v1 < v2 )); then
      echo -1
      return 0
    elif (( v1 > v2 )); then
      echo 1
      return 0
    fi
  done

  # Parse pre-release sections
  IFS='.' read -r -A pre1 <<< "${version1[prere]}"
  IFS='.' read -r -A pre2 <<< "${version2[prere]}"

  # Pre-release MUST have lower precedence than a normal version
  if [[ "${pre1}" != "*" && "${pre2}" == "*" ]]; then
    echo -1
    return 0
  elif [[ "${pre1}" == "*" && "${pre2}" != "*" ]]; then
    echo 1
    return 0
  fi

  # Pre-release MUST compare each dot separated identifier from left to right
  # until a difference is found
  local max_len=$(( ${#pre1} > ${#pre2} ? ${#pre1} : ${#pre2} ))
  for (( i = 1; i <= $max_len; i++ )); do
    local p1="${pre1[$i]}"
    local p2="${pre2[$i]}"

    # A smaller set of pre-release fields MUST have a lower precedence than a
    # larger set, if all of the preceding identifiers are equal
    if [[ "$p1" == "" && "$p2" != "" ]]; then
      echo -1
      return 0
    elif [[ "$p1" != "" && "$p2" == "" ]]; then
      echo 1
      return 0
    fi

    local num_regex='^[0-9]+$'
    local p1_is_num=$([[ "$p1" =~ "$num_regex" ]] && echo true || echo false)
    local p2_is_num=$([[ "$p2" =~ "$num_regex" ]] && echo true || echo false)

    # Identifiers consisting of only digits MUST be compared numerically
    if [[ $p1_is_num == true && $p2_is_num == true ]]; then
      if (( p1 < p2 )); then
        echo -1
        return 0
      elif (( p1 > p2 )); then
        echo 1
        return 0
      fi
    fi

    # Identifiers with letters or hyphens MUST be compared lexically in ASCII
    # sort order
    if [[ $p1_is_num == false && $p2_is_num == false ]]; then
      if [[ $p1 < $p2 ]]; then
        echo -1
        return 0
      elif [[ $p1 > $p2 ]]; then
        echo 1
        return 0
      fi
    fi

    # Numeric identifiers MUST always have lower precedence than
    # non-numeric identifiers
    if [[ $p1_is_num == true && $p2_is_num == false ]]; then
      echo -1
      return 0
    elif [[ $p1_is_num == false && $p2_is_num == true ]]; then
      echo 1
      return 0
    fi
  done

  # Build metadata SHOULD be ignored

  echo 0
}
