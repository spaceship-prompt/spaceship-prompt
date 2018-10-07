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
#   $ arr3=('c' 'd' 'e')
#   $ spaceship::union $arr1 $arr2 $arr3
#   > a b c d e
spaceship::union() {
  typeset -U sections=("$@")
  echo $sections
}

# Parse a semver (https://semver.org)
# USAGE:
#   spaceship::parse_semver <semver>
# EXAMPLE:
#   $ spaceship::parse_semver 3.2.1-alpha.2+20160130175002
#   > 3 2 1 alpha.2 20160130175002
spaceship::parse_semver() {
  local version=$1
  local semver_regex="^(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)\\.(0|[1-9][0-9]*)(\\-[0-9A-Za-z-]+(\\.[0-9A-Za-z-]+)*)?(\\+[0-9A-Za-z-]+(\\.[0-9A-Za-z-]+)*)?$"
  if [[ "$version" =~ $semver_regex ]]; then
    local major=$match[1]
    local minor=$match[2]
    local patch=$match[3]
    local prere=$(echo "${match[4]}" | cut -c 2-)
    local build=$(echo "${match[6]}" | cut -c 2-)
    local parsed=("$major" "$minor" "$patch" "$prere" "$build")
    echo $parsed
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
spaceship::compare_semver() {
  local v1=($(spaceship::parse_semver $1))
  local v2=($(spaceship::parse_semver $2))

  # stop if there were parse errors
  [[ ! "$v1" || ! "$v2" ]] && return 1

  # major, minor and patch are compared numericaly in order
  for i in 1 2 3; do
    local diff=$(($v1[$i] - $v2[$i]))
    if [[ $diff -lt 0 ]]; then
      echo -1
      return 0
    elif [[ $diff -gt 0 ]]; then
      echo 1
      return 0
    fi
  done

  # TODO handle pre-release as described by https://semver.org
  #   1. MUST have lower precedence than a normal version
  #   2. MUST compare each dot separated identifier from left to right until a
  #      difference is found
  #   3. Identifiers consisting of only digits MUST be compared numerically
  #   4. Identifiers with letters or hyphens MUST be compared lexically in ASCII
  #      sort order
  #   5. Numeric identifiers MUST always have lower precedence than non-numeric
  #      identifiers
  #   6. A larger set of pre-release fields MUST have a higher precedence than a
  #      smaller set, if all of the preceding identifiers are equal
  #
  # EXAMPLE:
  #   1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-alpha.beta < 1.0.0-beta
  #     < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0

  # Build metadata SHOULD be ignored

  echo 0
}