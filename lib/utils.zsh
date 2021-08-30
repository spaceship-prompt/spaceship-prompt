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

  while [ "$root" ] && [ ! -d "$root/.hg" ]; do
    root="${root%/*}"
  done

  [[ -n "$root" ]] &>/dev/null
}

# Checks if the section is async or not
# USAGE:
#   spaceship::is_section_async <section>
spaceship::is_section_async() {
  local section="$1"
  local sync_sections=(
    user
    dir
    host
    exec_time
    async
    line_sep
    vi_mode
    jobs
    exit_code
    char
  )

  # Some sections must be always sync
  if (( $sync_sections[(Ie)$section] )); then
    return 1
  fi

  # If user disabled async rendering for whole prompt
  if [[ "$SPACESHIP_PROMPT_ASYNC" != true ]]; then
    return 1
  fi

  local async_option="SPACESHIP_${(U)section}_ASYNC"
  [[ "${(P)async_option}" == true ]]
}

# Check if async is available and there is an async section
# USAGE:
#   spaceship::is_async
spaceship::is_async() {
  [[ "$SPACESHIP_PROMPT_ASYNC" == true ]] && (( ASYNC_INIT_DONE ))
}

# Print message backward compatibility warning
# USAGE:
#  spaceship::deprecated <deprecated> [message]
spaceship::deprecated() {
  [[ -n $1 ]] || return
  local deprecated=$1 message=$2
  local deprecated_value=${(P)deprecated} # the value of variable name $deprecated
  [[ -n $deprecated_value ]] || return
  print -P "%B$deprecated%b is deprecated. $message"
}

# Display seconds in human readable fromat
# For that use `strftime` and convert the duration (float) to seconds (integer).
# USAGE:
#   spaceship::displaytime <seconds> [precision]
spaceship::displaytime() {
  local duration="$1" precision="$2"

  [[ -z "$precision" ]] && precision=1

  integer D=$((duration/60/60/24))
  integer H=$((duration/60/60%24))
  integer M=$((duration/60%60))
  local S=$((duration%60))

  [[ $D > 0 ]] && printf '%dd ' $D
  [[ $H > 0 ]] && printf '%dh ' $H
  [[ $M > 0 ]] && printf '%dm ' $M
  printf %.${precision}f%s $S s
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
