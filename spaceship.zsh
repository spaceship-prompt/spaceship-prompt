#
# Spaceship ZSH Theme
#
# Author: Denys Dovhan, denysdovhan.com
# License: MIT
# https://github.com/denysdovhan/spaceship-zsh-theme

# ------------------------------------------------------------------------------
# CONFIGURATION
# The default configuration that can be overridden in .zshrc
# ------------------------------------------------------------------------------

NEWLINE='
'

# ORDER
if [ ! -n "$SPACESHIP_PROMPT_ORDER" ]; then
  SPACESHIP_PROMPT_ORDER=(
    time
    user
    host
    dir
    git
    hg
    node
    ruby
    xcode
    swift
    golang
    php
    rust
    julia
    docker
    venv
    pyenv
    exec_time
    line_sep
    vi_mode
    char
  )
fi

# PROMPT
SPACESHIP_PROMPT_SYMBOL="${SPACESHIP_PROMPT_SYMBOL:="➜"}"
SPACESHIP_PROMPT_ADD_NEWLINE="${SPACESHIP_PROMPT_ADD_NEWLINE:=true}"
SPACESHIP_PROMPT_SEPARATE_LINE="${SPACESHIP_PROMPT_SEPARATE_LINE:=true}"
SPACESHIP_PROMPT_PREFIXES_SHOW="${SPACESHIP_PROMPT_PREFIXES_SHOW:=true}"
SPACESHIP_PROMPT_SUFFIXES_SHOW="${SPACESHIP_PROMPT_SUFFIXES_SHOW:=true}"
SPACESHIP_PROMPT_DEFAULT_PREFIX="${SPACESHIP_PROMPT_DEFAULT_PREFIX:="via "}"
SPACESHIP_PROMPT_DEFAULT_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX:=" "}"

# TIME
SPACESHIP_TIME_SHOW="${SPACESHIP_TIME_SHOW:=false}"
SPACESHIP_TIME_PREFIX="${SPACESHIP_TIME_PREFIX:="at "}"
SPACESHIP_TIME_SUFFIX="${SPACESHIP_TIME_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_TIME_FORMAT="${SPACESHIP_TIME_FORMAT:=false}"
SPACESHIP_TIME_12HR="${SPACESHIP_TIME_12HR:=false}"
SPACESHIP_TIME_COLOR="${SPACESHIP_TIME_COLOR:="yellow"}"

# EXECUTION TIME
SPACESHIP_EXEC_TIME_SHOW="${SPACESHIP_EXEC_TIME_SHOW:=true}"
SPACESHIP_EXEC_TIME_PREFIX="${SPACESHIP_EXEC_TIME_PREFIX:="took "}"
SPACESHIP_EXEC_TIME_SUFFIX="${SPACESHIP_EXEC_TIME_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_EXEC_TIME_COLOR="${SPACESHIP_EXEC_TIME_COLOR:="yellow"}"
SPACESHIP_EXEC_TIME_THRESHOLD="${SPACESHIP_EXEC_TIME_THRESHOLD:=5000}"
SPACESHIP_EXEC_TIME_MS="${SPACESHIP_EXEC_TIME_MS:=false}"

# USER
SPACESHIP_USER_SHOW="${SPACESHIP_USER_SHOW:=true}"
SPACESHIP_USER_PREFIX="${SPACESHIP_USER_PREFIX:="with "}"
SPACESHIP_USER_SUFFIX="${SPACESHIP_USER_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_USER_COLOR="${SPACESHIP_USER_COLOR:="yellow"}"
SPACESHIP_USER_COLOR_ROOT="${SPACESHIP_USER_COLOR_ROOT:="red"}"

# HOST
SPACESHIP_HOST_SHOW="${SPACESHIP_HOST_SHOW:=true}"
SPACESHIP_HOST_PREFIX="${SPACESHIP_HOST_PREFIX:="at "}"
SPACESHIP_HOST_SUFFIX="${SPACESHIP_HOST_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HOST_COLOR="${SPACESHIP_HOST_COLOR:="green"}"

# DIR
SPACESHIP_DIR_SHOW="${SPACESHIP_DIR_SHOW:=true}"
SPACESHIP_DIR_PREFIX="${SPACESHIP_DIR_PREFIX:="in "}"
SPACESHIP_DIR_SUFFIX="${SPACESHIP_DIR_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DIR_TRUNC="${SPACESHIP_DIR_TRUNC:=3}"
SPACESHIP_DIR_COLOR="${SPACESHIP_DIR_COLOR:="cyan"}"

# GIT
SPACESHIP_GIT_SHOW="${SPACESHIP_GIT_SHOW:=true}"
SPACESHIP_GIT_PREFIX="${SPACESHIP_GIT_PREFIX:="on "}"
SPACESHIP_GIT_SUFFIX="${SPACESHIP_GIT_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GIT_SYMBOL="${SPACESHIP_GIT_SYMBOL:=" "}"
# GIT BRANCH
SPACESHIP_GIT_BRANCH_SHOW="${SPACESHIP_GIT_BRANCH_SHOW:=true}"
SPACESHIP_GIT_BRANCH_PREFIX="${SPACESHIP_GIT_BRANCH_PREFIX:="$SPACESHIP_GIT_SYMBOL"}"
SPACESHIP_GIT_BRANCH_SUFFIX="${SPACESHIP_GIT_BRANCH_SUFFIX:=""}"
SPACESHIP_GIT_BRANCH_COLOR="${SPACESHIP_GIT_BRANCH_COLOR:="magenta"}"
# GIT STATUS
SPACESHIP_GIT_STATUS_SHOW="${SPACESHIP_GIT_STATUS_SHOW:=true}"
SPACESHIP_GIT_STATUS_PREFIX="${SPACESHIP_GIT_STATUS_PREFIX:=" ["}"
SPACESHIP_GIT_STATUS_SUFFIX="${SPACESHIP_GIT_STATUS_SUFFIX:="]"}"
SPACESHIP_GIT_STATUS_COLOR="${SPACESHIP_GIT_STATUS_COLOR:="red"}"
SPACESHIP_GIT_STATUS_UNTRACKED="${SPACESHIP_GIT_STATUS_UNTRACKED:="?"}"
SPACESHIP_GIT_STATUS_ADDED="${SPACESHIP_GIT_STATUS_ADDED:="+"}"
SPACESHIP_GIT_STATUS_MODIFIED="${SPACESHIP_GIT_STATUS_MODIFIED:="!"}"
SPACESHIP_GIT_STATUS_RENAMED="${SPACESHIP_GIT_STATUS_RENAMED:="»"}"
SPACESHIP_GIT_STATUS_DELETED="${SPACESHIP_GIT_STATUS_DELETED:="✘"}"
SPACESHIP_GIT_STATUS_STASHED="${SPACESHIP_GIT_STATUS_STASHED:="$"}"
SPACESHIP_GIT_STATUS_UNMERGED="${SPACESHIP_GIT_STATUS_UNMERGED:="="}"
SPACESHIP_GIT_STATUS_AHEAD="${SPACESHIP_GIT_STATUS_AHEAD:="⇡"}"
SPACESHIP_GIT_STATUS_BEHIND="${SPACESHIP_GIT_STATUS_BEHIND:="⇣"}"
SPACESHIP_GIT_STATUS_DIVERGED="${SPACESHIP_GIT_STATUS_DIVERGED:="⇕"}"

# MERCURIAL
SPACESHIP_HG_SHOW="${SPACESHIP_HG_SHOW:=true}"
SPACESHIP_HG_PREFIX="${SPACESHIP_HG_PREFIX:="on "}"
SPACESHIP_HG_SUFFIX="${SPACESHIP_HG_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HG_SYMBOL="${SPACESHIP_HG_SYMBOL:="☿ "}"
# MERCURIAL BRANCH
SPACESHIP_HG_BRANCH_SHOW="${SPACESHIP_HG_BRANCH_SHOW:=true}"
SPACESHIP_HG_BRANCH_PREFIX="${SPACESHIP_HG_BRANCH_PREFIX:="$SPACESHIP_HG_SYMBOL"}"
SPACESHIP_HG_BRANCH_SUFFIX="${SPACESHIP_HG_BRANCH_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HG_BRANCH_COLOR="${SPACESHIP_HG_BRANCH_COLOR:="magenta"}"
# MERCURIAL STATUS
SPACESHIP_HG_STATUS_SHOW="${SPACESHIP_HG_STATUS_SHOW:=true}"
SPACESHIP_HG_STATUS_PREFIX="${SPACESHIP_HG_STATUS_PREFIX:="["}"
SPACESHIP_HG_STATUS_SUFFIX="${SPACESHIP_HG_STATUS_SUFFIX:="]"}"
SPACESHIP_HG_STATUS_COLOR="${SPACESHIP_HG_STATUS_COLOR:="red"}"
SPACESHIP_HG_STATUS_UNTRACKED="${SPACESHIP_HG_STATUS_UNTRACKED:="?"}"
SPACESHIP_HG_STATUS_ADDED="${SPACESHIP_HG_STATUS_ADDED:="+"}"
SPACESHIP_HG_STATUS_MODIFIED="${SPACESHIP_HG_STATUD_MODIFIED:="!"}"
SPACESHIP_HG_STATUS_DELETED="${SPACESHIP_HG_STATUS_DELETED:="✘"}"

# NODE
SPACESHIP_NODE_SHOW="${SPACESHIP_NODE_SHOW:=true}"
SPACESHIP_NODE_PREFIX="${SPACESHIP_NODE_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_NODE_SUFFIX="${SPACESHIP_NODE_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_NODE_SYMBOL="${SPACESHIP_NODE_SYMBOL:="⬢ "}"
SPACESHIP_NODE_DEFAULT_VERSION="${SPACESHIP_NODE_DEFAULT_VERSION:=""}"
SPACESHIP_NODE_COLOR="${SPACESHIP_NODE_COLOR:="green"}"

# RUBY
SPACESHIP_RUBY_SHOW="${SPACESHIP_RUBY_SHOW:=true}"
SPACESHIP_RUBY_PREFIX="${SPACESHIP_RUBY_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RUBY_SUFFIX="${SPACESHIP_RUBY_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RUBY_SYMBOL="${SPACESHIP_RUBY_SYMBOL:="💎 "}"
SPACESHIP_RUBY_COLOR="${SPACESHIP_RUBY_COLOR:="red"}"

# XCODE
SPACESHIP_XCODE_SHOW_LOCAL="${SPACESHIP_XCODE_SHOW_LOCAL:=true}"
SPACESHIP_XCODE_SHOW_GLOBAL="${SPACESHIP_XCODE_SHOW_GLOBAL:=false}"
SPACESHIP_XCODE_PREFIX="${SPACESHIP_XCODE_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_XCODE_SUFFIX="${SPACESHIP_XCODE_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_XCODE_SYMBOL="${SPACESHIP_XCODE_SYMBOL:="🛠 "}"
SPACESHIP_XCODE_COLOR="${SPACESHIP_XCODE_COLOR:="blue"}"

# SWIFT
SPACESHIP_SWIFT_SHOW_LOCAL="${SPACESHIP_SWIFT_SHOW_LOCAL:=true}"
SPACESHIP_SWIFT_SHOW_GLOBAL="${SPACESHIP_SWIFT_SHOW_GLOBAL:=false}"
SPACESHIP_SWIFT_PREFIX="${SPACESHIP_SWIFT_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_SWIFT_SUFFIX="${SPACESHIP_SWIFT_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SWIFT_SYMBOL="${SPACESHIP_SWIFT_SYMBOL:="🐦 "}"
SPACESHIP_SWIFT_COLOR="${SPACESHIP_SWIFT_COLOR:="yellow"}"

# GOLANG
SPACESHIP_GOLANG_SHOW="${SPACESHIP_GOLANG_SHOW:=true}"
SPACESHIP_GOLANG_PREFIX="${SPACESHIP_GOLANG_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_GOLANG_SUFFIX="${SPACESHIP_GOLANG_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GOLANG_SYMBOL="${SPACESHIP_GOLANG_SYMBOL:="🐹 "}"
SPACESHIP_GOLANG_COLOR="${SPACESHIP_GOLANG_COLOR:="cyan"}"

# PHP
SPACESHIP_PHP_SHOW="${SPACESHIP_PHP_SHOW:=true}"
SPACESHIP_PHP_PREFIX="${SPACESHIP_PHP_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_PHP_SUFFIX="${SPACESHIP_PHP_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PHP_SYMBOL="${SPACESHIP_PHP_SYMBOL:="🐘 "}"
SPACEHIP_PHP_COLOR="${SPACEHIP_PHP_COLOR:="blue"}"

# RUST
SPACESHIP_RUST_SHOW="${SPACESHIP_RUST_SHOW:=true}"
SPACESHIP_RUST_PREFIX="${SPACESHIP_RUST_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RUST_SUFFIX="${SPACESHIP_RUST_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RUST_SYMBOL="${SPACESHIP_RUST_SYMBOL:="𝗥 "}"
SPACESHIP_RUST_COLOR="${SPACESHIP_RUST_COLOR:="red"}"

# JULIA
SPACESHIP_JULIA_SHOW="${SPACESHIP_JULIA_SHOW:=true}"
SPACESHIP_JULIA_PREFIX="${SPACESHIP_JULIA_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_JULIA_SUFFIX="${SPACESHIP_JULIA_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_JULIA_SYMBOL="${SPACESHIP_JULIA_SYMBOL:="ஃ "}"
SPACESHIP_JULIA_COLOR="${SPACESHIP_JULIA_COLOR:="green"}"

# DOCKER
SPACESHIP_DOCKER_SHOW="${SPACESHIP_DOCKER_SHOW:=true}"
SPACESHIP_DOCKER_PREFIX="${SPACESHIP_DOCKER_PREFIX:="on "}"
SPACESHIP_DOCKER_SUFFIX="${SPACESHIP_DOCKER_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DOCKER_SYMBOL="${SPACESHIP_DOCKER_SYMBOL:="🐳 "}"
SPACESHIP_DOCKER_COLOR="${SPACESHIP_DOCKER_COLOR:="cyan"}"

# VENV
SPACESHIP_VENV_SHOW="${SPACESHIP_VENV_SHOW:=true}"
SPACESHIP_VENV_PREFIX="${SPACESHIP_VENV_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_VENV_SUFFIX="${SPACESHIP_VENV_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_VENV_COLOR="${SPACESHIP_VENV_COLOR:="blue"}"

# PYENV
SPACESHIP_PYENV_SHOW="${SPACESHIP_PYENV_SHOW:=true}"
SPACESHIP_PYENV_PREFIX="${SPACESHIP_PYENV_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_PYENV_SUFFIX="${SPACESHIP_PYENV_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PYENV_SYMBOL="${SPACESHIP_PYENV_SYMBOL:="🐍 "}"
SPACESHIP_PYENV_COLOR="${SPACESHIP_PYENV_COLOR:="yellow"}"

# VI_MODE
SPACESHIP_VI_MODE_SHOW="${SPACESHIP_VI_MODE_SHOW:=true}"
SPACESHIP_VI_MODE_PREFIX="${SPACESHIP_VI_MODE_PREFIX:=""}"
SPACESHIP_VI_MODE_SUFFIX="${SPACESHIP_VI_MODE_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_VI_MODE_INSERT="${SPACESHIP_VI_MODE_INSERT:="[I]"}"
SPACESHIP_VI_MODE_NORMAL="${SPACESHIP_VI_MODE_NORMAL:="[N]"}"
SPACESHIP_VI_MODE_COLOR="${SPACESHIP_VI_MODE_COLOR:="white"}"

# ------------------------------------------------------------------------------
# HELPERS
# Helpers for common used actions
# ------------------------------------------------------------------------------

# Check if command exists in $PATH
# USAGE:
#   _exists <command>
_exists() {
  command -v $1 > /dev/null 2>&1
}

# Check if the current directory is in a Git repository.
# USAGE:
#   _is_git
_is_git() {
  command git rev-parse --is-inside-work-tree &>/dev/null
}

# Check if the current direcotory is in a Mercurial repository
# USAGE:
#   _is_hg
_is_hg() {
  command hg --cwd $PWD root &>/dev/null
}

# Draw prompt section (bold is used as default)
# USAGE:
#   _prompt_section <color> [prefix] <content> [suffix]
SPACESHIP_OPENED=false # Internal variable for checking if prompt is opened
_prompt_section() {
  local color prefix content suffix
  [[ -n $1 ]] && color="%F{$1}"  || color="%f"
  [[ -n $2 ]] && prefix="$2"     || prefix=""
  [[ -n $3 ]] && content="$3"    || content=""
  [[ -n $4 ]] && suffix="$4"     || suffix=""

  [[ -z $3 && -z $4 ]] && content=$2 prefix=''

  echo -n "%{%B%}" # set bold
  if [[ $SPACESHIP_OPENED == true ]] && [[ $SPACESHIP_PROMPT_PREFIXES_SHOW == true ]]; then
    echo -n "$prefix"
  fi
  SPACESHIP_OPENED=true
  echo -n "%{%b%}" # unset bold

  echo -n "%{%B$color%}" # set color
  echo -n "$content"     # section content
  echo -n "%{%b%f%}"     # unset color

  echo -n "%{%B%}" # reset bold, if it was diabled before
  if [[ $SPACESHIP_PROMPT_SUFFIXES_SHOW == true ]]; then
    echo -n "$suffix"
  fi
  echo -n "%{%b%}" # unset bold
}

# Print message backward compatibility warning
# USAGE:
#  _deprecate <deprecated> <actual>
_deprecated() {
  [[ -n $1 && -n $2 ]] || return
  local deprecated=$1 actual=$2 b=$bold_color r=$reset_color
  local deprecated_value=${(P)deprecated} # the value of variable name $deprecated
  [[ -n $deprecated_value ]] || return
  echo "${b}\$$deprecated${r} is deprecated. Use ${b}\$$actual${r} instead."
}

# ------------------------------------------------------------------------------
# HOOKS
# ZSH hooks for advanced actions
# ------------------------------------------------------------------------------

# Execution time start
spaceship_exec_time_start_hook() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == true ]] && spaceship_exec_time_start=$(( $(date +%s%N) / 1000000 ))
}

# Execution time end
spaceship_exec_time_end_hook() {
  if [[ $SPACESHIP_EXEC_TIME_SHOW == true ]]; then
    if [[ -n $spaceship_exec_time_start ]]; then
      spaceship_exec_time_elapsed=$(( $(date +%s%N) / 1000000 - $spaceship_exec_time_start ))
      unset -v spaceship_exec_time_start
    else
      # Remove elapsed time if exists
      [[ -n $spaceship_exec_time_elapsed ]] && unset spaceship_exec_time_elapsed
    fi
  fi
}

# ------------------------------------------------------------------------------
# SECTIONS
# The parts the prompt consists of
# ------------------------------------------------------------------------------

# TIME
spaceship_time() {
  [[ $SPACESHIP_TIME_SHOW == false ]] && return

  local time_str

  if [[ $SPACESHIP_TIME_FORMAT != false ]]; then
    time_str="${SPACESHIP_TIME_FORMAT}"
  elif [[ $SPACESHIP_TIME_12HR == true ]]; then
    time_str="%D{%r}"
  else
    time_str="%D{%T}"
  fi

  _prompt_section \
    "$SPACESHIP_TIME_COLOR" \
    "$SPACESHIP_TIME_PREFIX" \
    "$time_str" \
    "$SPACESHIP_TIME_SUFFIX"
}

# EXECUTION TIME
spaceship_exec_time() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return

  if [[ $spaceship_exec_time_elapsed -ge $SPACESHIP_EXEC_TIME_THRESHOLD ]]; then
    local output
    local days=$(( spaceship_exec_time_elapsed / 1000 / 60 / 60 / 24 ))
    local hours=$(( spaceship_exec_time_elapsed / 1000 / 60 / 60 % 24 ))
    local minutes=$(( spaceship_exec_time_elapsed / 1000 / 60 % 60 ))
    local seconds=$(( spaceship_exec_time_elapsed / 1000 % 60 ))
    local milliseconds=$(( spaceship_exec_time_elapsed % 1000 ))
    (( days > 0 )) && output+="${days}d "
    (( hours > 0 )) && output+="${hours}h "
    (( minutes > 0 )) && output+="${minutes}m "
    (( seconds > 0 )) && output+="${seconds}s"

    if [[ $SPACESHIP_EXEC_TIME_MS == true ]]; then
      (( spaceship_exec_time_elapsed >= 1000 )) && output+=" "
      (( milliseconds > 0 )) && output+="${milliseconds}ms"
    else
      (( spaceship_exec_time_elapsed < 1000 )) && (( milliseconds > 0 )) && output+="${milliseconds}ms"
    fi

    if [[ -n $output ]]; then
      _prompt_section \
        "$SPACESHIP_EXEC_TIME_COLOR" \
        "$SPACESHIP_EXEC_TIME_PREFIX" \
        "$output" \
        "$SPACESHIP_EXEC_TIME_SUFFIX"
    fi
  fi
}

# USER
# If user is root, then paint it in red. Otherwise, just print in yellow.
spaceship_user() {
  [[ $SPACESHIP_USER_SHOW == false ]] && return

  if [[ $LOGNAME != $USER ]] || [[ $UID == 0 ]] || [[ -n $SSH_CONNECTION ]]; then
    local user_color

    if [[ $USER == 'root' ]]; then
      user_color=$SPACESHIP_USER_COLOR_ROOT
    else
      user_color="$SPACESHIP_USER_COLOR"
    fi

    _prompt_section \
      "$user_color" \
      "$SPACESHIP_USER_PREFIX" \
      '%n' \
      "$SPACESHIP_USER_SUFFIX"
  fi
}

# HOST
# If there is an ssh connections, current machine name.
spaceship_host() {
  [[ $SPACESHIP_HOST_SHOW == false ]] && return

  [[ -n $SSH_CONNECTION ]] || return

  _prompt_section \
    "$SPACESHIP_HOST_COLOR" \
    "$SPACESHIP_HOST_PREFIX" \
    '%m' \
    "$SPACESHIP_HOST_SUFFIX"
}

# DIR
# Current directory. Return only three last items of path
spaceship_dir() {
  [[ $SPACESHIP_DIR_SHOW == false ]] && return

  _prompt_section \
    "$SPACESHIP_DIR_COLOR" \
    "$SPACESHIP_DIR_PREFIX" \
    "%${SPACESHIP_DIR_TRUNC}~" \
    "$SPACESHIP_DIR_SUFFIX"
}

# GIT BRANCH
# Show current git brunch using git_current_status from Oh-My-Zsh
spaceship_git_branch() {
  [[ $SPACEHIP_GIT_BRANCH_SHOW == false ]] && return

  _is_git || return

  _prompt_section \
    "$SPACESHIP_GIT_BRANCH_COLOR" \
    "$SPACESHIP_GIT_BRANCH_PREFIX$(git_current_branch)$SPACESHIP_GIT_BRANCH_SUFFIX"
}

# GIT STATUS
# Check if current dir is a git repo, set up ZSH_THEME_* variables
# and show git status using git_prompt_status from Oh-My-Zsh
# Reference:
#   https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
spaceship_git_status() {
  [[ $SPACESHIP_GIT_STATUS_SHOW == false ]] && return

  _is_git || return

  ZSH_THEME_GIT_PROMPT_UNTRACKED=$SPACESHIP_GIT_STATUS_UNTRACKED
  ZSH_THEME_GIT_PROMPT_ADDED=$SPACESHIP_GIT_STATUS_ADDED
  ZSH_THEME_GIT_PROMPT_MODIFIED=$SPACESHIP_GIT_STATUS_MODIFIED
  ZSH_THEME_GIT_PROMPT_RENAMED=$SPACESHIP_GIT_STATUS_RENAMED
  ZSH_THEME_GIT_PROMPT_DELETED=$SPACESHIP_GIT_STATUS_DELETED
  ZSH_THEME_GIT_PROMPT_STASHED=$SPACESHIP_GIT_STATUS_STASHED
  ZSH_THEME_GIT_PROMPT_UNMERGED=$SPACESHIP_GIT_STATUS_UNMERGED
  ZSH_THEME_GIT_PROMPT_AHEAD=$SPACESHIP_GIT_STATUS_AHEAD
  ZSH_THEME_GIT_PROMPT_BEHIND=$SPACESHIP_GIT_STATUS_BEHIND
  ZSH_THEME_GIT_PROMPT_DIVERGED=$SPACESHIP_GIT_STATUS_DIVERGED

  local git_status="$(git_prompt_status)"

  if [[ -n $git_status ]]; then
    # Status prefixes are colorized
    _prompt_section \
      "$SPACESHIP_GIT_STATUS_COLOR" \
      "$SPACESHIP_GIT_STATUS_PREFIX$git_status$SPACESHIP_GIT_STATUS_SUFFIX"
  fi
}

# GIT
# Show both git branch and git status:
#   spaceship_git_branch
#   spaceship_git_status
spaceship_git() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  local git_branch="$(spaceship_git_branch)" git_status="$(spaceship_git_status)"

  [[ -z $git_branch ]] && return

  _prompt_section \
    'white' \
    "$SPACESHIP_GIT_PREFIX" \
    "${git_branch}${git_status}" \
    "$SPACESHIP_GIT_SUFFIX"
}

# MERCURIAL BRANCH
# Show current hg brunch
spaceship_hg_branch() {
  [[ $SPACESHIP_HG_BRANCH_SHOW == false ]] && return

  _is_hg || return

  local hg_branch="$(cat $PWD/.hg/branch)"

  _prompt_section \
    "$SPACESHIP_HG_BRANCH_COLOR" \
    "$SPACESHIP_HG_BRANCH_PREFIX"$hg_branch"$SPACESHIP_HG_BRANCH_SUFFIX"
}

# MERCURIAL STATUS
# Check if current dir is a hg repo and show hg status as indicators
spaceship_hg_status() {
  [[ $SPACESHIP_HG_STATUS_SHOW == false ]] && return

  _is_hg || return

  local INDEX=$(command hg status 2>/dev/null) hg_status=""

  # Indicators are suffixed instead of prefixed to each other to
  # provide uniform view across git and mercurial indicators
  if $(echo "$INDEX" | command grep -E '^\? ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_UNTRACKED$hg_status"
  elif $(echo "$INDEX" | command grep -E '^A ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_ADDED$hg_status"
  elif $(echo "$INDEX" | command grep -E '^M ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_MODIFIED$hg_status"
  elif $(echo "$INDEX" | command grep -E '^(R|!)' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_DELETED$hg_status"
  fi

  if [[ -n $hg_status ]]; then
    _prompt_section \
      "$SPACESHIP_HG_STATUS_COLOR" \
      "$SPACESHIP_HG_STATUS_PREFIX"$hg_status"$SPACESHIP_HG_STATUS_SUFFIX"
  fi
}

# MERCURIAL
# Show both git branch and git status:
#   spaceship_hg_branch
#   spaceship_hg_status
spaceship_hg() {
  [[ $SPACESHIP_HG_SHOW == false ]] && return

  local hg_branch="$(spaceship_hg_branch)" hg_status="$(spaceship_hg_status)"

  [[ -z $hg_branch ]] && return

  _prompt_section \
    'white' \
    "$SPACESHIP_HG_PREFIX" \
    "${hg_branch}${hg_status}" \
    "$SPACESHIP_HG_SUFFIX"
}

# NODE
# Show current version of node, exception system.
spaceship_node() {
  [[ $SPACESHIP_NODE_SHOW == false ]] && return

  # Show NODE status only for JS-specific folders
  [[ -f package.json || -d node_modules || -n *.js(#qN) ]] || return

  local node_version

  if _exists nvm; then
    node_version=$(nvm current 2>/dev/null)
    [[ $node_version == "system" || $node_version == "node" ]] && return
  elif _exists nodenv; then
    node_version=$(nodenv version-name)
    [[ $node_version == "system" || $node_version == "node" ]] && return
  elif _exists node; then
    node_version=$(node -v 2>/dev/null)
    [[ $node_version == $SPACESHIP_NODE_DEFAULT_VERSION ]] && return
  else
    return
  fi

  _prompt_section \
    "$SPACESHIP_NODE_COLOR" \
    "$SPACESHIP_NODE_PREFIX" \
    "${SPACESHIP_NODE_SYMBOL}${node_version}" \
    "$SPACESHIP_NODE_SUFFIX"
}

# RUBY
# Show current version of Ruby
spaceship_ruby() {
  [[ $SPACESHIP_RUBY_SHOW == false ]] && return

  # Show versions only for Ruby-specific folders
  [[ -f Gemfile || -f Rakefile || -n *.rb(#qN) ]] || return

  local ruby_version

  if _exists rvm-prompt; then
    ruby_version=$(rvm-prompt i v g)
  elif _exists chruby; then
    ruby_version=$(chruby | sed -n -e 's/ \* //p')
  elif _exists rbenv; then
    ruby_version=$(rbenv version-name)
  else
    return
  fi

  [[ "${ruby_version}" == "system" ]] && return

  # Add 'v' before ruby version that starts with a number
  [[ "${ruby_version}" =~ ^[0-9].+$ ]] && ruby_version="v${ruby_version}"

  _prompt_section \
    "$SPACESHIP_RUBY_COLOR" \
    "$SPACESHIP_RUBY_PREFIX" \
    "${SPACESHIP_RUBY_SYMBOL}${ruby_version}" \
    "$SPACESHIP_RUBY_SUFFIX"
}

# XCODE
# Show current version of Xcode
spaceship_xcode() {
  _exists xcenv || return

  local xcode_path

  if [[ $SPACESHIP_SWIFT_SHOW_GLOBAL == true ]] ; then
    xcode_path=$(xcenv version | sed 's/ .*//')
  elif [[ $SPACESHIP_SWIFT_SHOW_LOCAL == true ]] ; then
    if xcenv version | grep ".xcode-version" > /dev/null; then
      xcode_path=$(xcenv version | sed 's/ .*//')
    fi
  fi

  if [ -n "${xcode_path}" ]; then
    local xcode_version_path=$xcode_path"/Contents/version.plist"
    if [ -f ${xcode_version_path} ]; then
      if _exists defaults; then
        local xcode_version=$(defaults read ${xcode_version_path} CFBundleShortVersionString)

        _prompt_section \
          "$SPACESHIP_XCODE_COLOR" \
          "$SPACESHIP_XCODE_PREFIX" \
          "${SPACESHIP_XCODE_SYMBOL}${xcode_version}" \
          "$SPACESHIP_XCODE_SUFFIX"
      fi
    fi
  fi
}

# SWIFT
# Show current version of Swift
spaceship_swift() {
  _exists swiftenv || return

  local swift_version

  if [[ $SPACESHIP_SWIFT_SHOW_GLOBAL == true ]] ; then
    swift_version=$(swiftenv version | sed 's/ .*//')
  elif [[ $SPACESHIP_SWIFT_SHOW_LOCAL == true ]] ; then
    if swiftenv version | grep ".swift-version" > /dev/null; then
      swift_version=$(swiftenv version | sed 's/ .*//')
    fi
  fi

  [ -n "${swift_version}" ] || return

  _prompt_section \
    "$SPACESHIP_SWIFT_COLOR" \
    "$SPACESHIP_SWIFT_PREFIX" \
    "${SPACESHIP_SWIFT_SYMBOL}${swift_version}" \
    "$SPACESHIP_SWIFT_SUFFIX"
}

# GOLANG
# Show current version of Go
spaceship_golang() {
  [[ $SPACESHIP_GOLANG_SHOW == false ]] && return

  # If there are Go-specific files in current directory
  [[ -d Godeps || -f glide.yaml || -n *.go(#qN) ]] || return

  _exists go || return

  local go_version=$(go version | grep --colour=never -oE '[[:digit:]].[[:digit:]]')

  _prompt_section \
    "$SPACESHIP_GOLANG_COLOR" \
    "$SPACESHIP_GOLANG_PREFIX" \
    "${SPACESHIP_GOLANG_SYMBOL}v${go_version}" \
    "$SPACESHIP_GOLANG_SUFFIX"
}

# PHP
# Show current version of PHP
spaceship_php() {
  [[ $SPACESHIP_PHP_SHOW == false ]] && return

  # Show only if php files exist in current directory
  [[ -n *.php(#qN) ]] || return

  _exists php || return

  local php_version=$(php -v 2>&1 | grep --color=never -oe "^PHP\s*[0-9.]*" | awk '{print $2}')

  _prompt_section \
    "$SPACEHIP_PHP_COLOR" \
    "$SPACESHIP_PHP_PREFIX" \
    "${SPACESHIP_PHP_SYMBOL}v${php_version}" \
    "${SPACESHIP_PHP_SUFFIX}"
}

# RUST
# Show current version of Rust
spaceship_rust() {
  [[ $SPACESHIP_RUST_SHOW == false ]] && return

  # If there are Rust-specific files in current directory
  [[ -f Cargo.toml || -n *.rs(#qN) ]] || return

  _exists rustc || return

  local rust_version=$(rustc --version | grep --colour=never -oE '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]')

  _prompt_section \
    "$SPACESHIP_RUST_COLOR" \
    "$SPACESHIP_RUST_PREFIX" \
    "${SPACESHIP_RUST_SYMBOL}v${rust_version}" \
    "$SPACESHIP_RUST_SUFFIX"
}

# JULIA
# Show current version of Julia
spaceship_julia() {
  [[ $SPACESHIP_JULIA_SHOW == false ]] && return

  # If there are julia files in current directory
  [[ -n *.jl(#qN) ]] || return

  _exists julia || return

  local julia_version=$(julia --version | grep --colour=never -oE '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]')

  _prompt_section \
    "$SPACESHIP_JULIA_COLOR" \
    "$SPACESHIP_JULIA_PREFIX" \
    "${SPACESHIP_JULIA_SYMBOL}v${julia_version}" \
    "$SPACESHIP_JULIA_SUFFIX"
}

# DOCKER
# Show current Docker version and connected machine
spaceship_docker() {
  [[ $SPACESHIP_DOCKER_SHOW == false ]] && return

  _exists docker || return
  # if docker daemon isn't running you'll get an error saying it can't connect
  docker info 2>&1 | grep -q "Cannot connect" && return

  local docker_version=$(docker version -f "{{.Server.Version}}")

  if [[ -n $DOCKER_MACHINE_NAME ]]; then
    docker_version+=" via ($DOCKER_MACHINE_NAME)"
  fi

  _prompt_section \
    "$SPACESHIP_DOCKER_COLOR" \
    "$SPACESHIP_DOCKER_PREFIX" \
    "${SPACESHIP_DOCKER_SYMBOL}v${docker_version}" \
    "$SPACESHIP_DOCKER_SUFFIX"
}

# VENV
# Show current virtual environment (Python).
spaceship_venv() {
  [[ $SPACESHIP_VENV_SHOW == false ]] && return

  # Check if the current directory running via Virtualenv
  [ -n "$VIRTUAL_ENV" ] && _exists deactivate || return

  _prompt_section \
    "$SPACESHIP_VENV_COLOR" \
    "$SPACESHIP_VENV_PREFIX" \
    "$(basename $VIRTUAL_ENV)" \
    "$SPACESHIP_VENV_SUFFIX"
}

# PYENV
# Show current version of pyenv python, including system.
spaceship_pyenv() {
  [[ $SPACESHIP_PYENV_SHOW == false ]] && return

  # Show NVM status only for Python-specific folders
  [[ -f requirements.txt ]] || [[ -n *.py(#qN) ]] || return

  _exists pyenv || return # Do nothing if pyenv is not installed

  local pyenv_status
  local pyenv_shell=$(pyenv shell 2>/dev/null)
  local pyenv_local=$(pyenv local 2>/dev/null)
  local pyenv_global=$(pyenv global 2>/dev/null)

  # Version follows this order: shell > local > global
  # See: https://github.com/yyuu/pyenv/blob/master/COMMANDS.md
  if [[ ! -z $pyenv_shell ]]; then
    pyenv_status=$pyenv_shell
  elif [[ ! -z $pyenv_local ]]; then
    pyenv_status=$pyenv_local
  elif [[ ! -z $pyenv_global ]]; then
    pyenv_status=$pyenv_global
  else
    return # If none of these is set, pyenv is not being used. Do nothing.
  fi

  _prompt_section \
    "$SPACESHIP_PYENV_COLOR" \
    "$SPACESHIP_PYENV_PREFIX" \
    "${SPACESHIP_PYENV_SYMBOL}${pyenv_status}" \
    "$SPACESHIP_PYENV_SUFFIX"
}

# VI_MODE
# Show current vi_mode mode
spaceship_vi_mode() {
  [[ $SPACESHIP_VI_MODE_SHOW == true ]] || return

  if bindkey | grep "vi-quoted-insert" > /dev/null 2>&1; then # check if vi-mode enabled
    local mode_indicator="${SPACESHIP_VI_MODE_INSERT}"

    case "${KEYMAP}" in
      main|viins)
      mode_indicator="${SPACESHIP_VI_MODE_INSERT}"
      ;;
      vicmd)
      mode_indicator="${SPACESHIP_VI_MODE_NORMAL}"
      ;;
    esac

    _prompt_section \
      "$SPACESHIP_VI_MODE_COLOR" \
      "$SPACESHIP_VI_MODE_PREFIX" \
      "$mode_indicator" \
      "$SPACESHIP_VI_MODE_SUFFIX"
  fi
}

# Temporarily switch to vi-mode
spaceship_vi_mode_enable() {
  function zle-keymap-select() { zle reset-prompt ; zle -R }
  zle -N zle-keymap-select
  bindkey -v
}

# Temporarily switch to emacs-mode
spaceship_vi_mode_disable() {
  bindkey -e
}

# LINE SEPARATOR
# Should it write prompt in two lines or not?
spaceship_line_sep() {
  [[ $SPACESHIP_PROMPT_SEPARATE_LINE == true ]] && echo -n "$NEWLINE"
}

# PROMPT CHARACTER
# Paint $PROMPT_SYMBOL in red if previous command was fail and
# paint in green if everything was OK.
spaceship_char() {
  _prompt_section "%(?.green.red)" "${SPACESHIP_PROMPT_SYMBOL} "
}

# ------------------------------------------------------------------------------
# BACKWARD COMPATIBILITY WARNINGS
# Show deprecation messages for options that are set, but not supported
# ------------------------------------------------------------------------------

# PROMPT
_deprecated SPACESHIP_PROMPT_TRUNC SPACESHIP_DIR_TRUNC
# PREFIXES
_deprecated SPACEHIP_PREFIX_SHOW SPACESHIP_PROMPT_PREFIXES_SHOW
_deprecated SPACESHIP_PREFIX_TIME SPACESHIP_TIME_PREFIX
_deprecated SPACESHIP_PREFIX_USER SPACESHIP_USER_PREFIX
_deprecated SPACESHIP_PREFIX_HOST SPACESHIP_HOST_PREFIX
_deprecated SPACESHIP_PREFIX_DIR SPACESHIP_DIR_PREFIX
_deprecated SPACESHIP_PREFIX_GIT SPACESHIP_GIT_PREFIX
_deprecated SPACESHIP_PREFIX_ENV_DEFAULT SPACESHIP_PROMPT_DEFAULT_PREFIX
_deprecated SPACESHIP_PREFIX_NVM SPACESHIP_NODE_PREFIX
_deprecated SPACESHIP_PREFIX_RUBY SPACESHIP_RUBY_PREFIX
_deprecated SPACESHIP_PREFIX_XCODE SPACESHIP_XCODE_PREFIX
_deprecated SPACESHIP_PREFIX_SWIFT SPACESHIP_SWIFT_PREFIX
_deprecated SPACESHIP_PREFIX_GOLANG SPACESHIP_GOLANG_PREFIX
_deprecated SPACESHIP_PREFIX_DOCKER SPACESHIP_DOCKER_PREFIX
_deprecated SPACESHIP_PREFIX_VENV SPACESHIP_VENV_PREFIX
_deprecated SPACESHIP_PREFIX_PYENV SPACESHIP_PYENV_PREFIX
_deprecated SPACESHIP_PREFIX_VI_MODE SPACESHIP_VI_MODE_PREFIX
# NVM
_deprecated SPACESHIP_NVM_SHOW SPACESHIP_NODE_SHOW
_deprecated SPACESHIP_NVM_SYMBOL SPACESHIP_NODE_SYMBOL
# GIT
_deprecated SPACESHIP_GIT_COLOR SPACESHIP_GIT_BRANCH_COLOR
_deprecated SPACESHIP_GIT_UNCOMMITTED SPACESHIP_GIT_STATUS_ADDED
_deprecated SPACESHIP_GIT_UNTRACKED SPACESHIP_GIT_STATUS_UNTRACKED
_deprecated SPACESHIP_GIT_UNSTAGED SPACESHIP_GIT_STATUS_MODIFIED
_deprecated SPACESHIP_GIT_STASHED SPACESHIP_GIT_STATUS_STASHED
_deprecated SPACESHIP_GIT_UNPULLED SPACESHIP_GIT_STATUS_BEHIND
_deprecated SPACESHIP_GIT_UNPUSHED SPACESHIP_GIT_STATUS_AHEAD

# ------------------------------------------------------------------------------
# MAIN
# An entry point of prompt
# ------------------------------------------------------------------------------

# Compose whole prompt from smaller parts
spaceship_prompt() {
  # Option EXTENDED_GLOB is set locally to force filename generation on
  # argument to conditions, i.e. allow usage of explicit glob qualifier (#q).
  # See the description of filename generation in
  # http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
  setopt EXTENDED_GLOB LOCAL_OPTIONS

  # Should it add a new line before the prompt?
  [[ $SPACESHIP_PROMPT_ADD_NEWLINE == true ]] && echo -n "$NEWLINE"

  # Execute all parts
  for section in $SPACESHIP_PROMPT_ORDER; do
    spaceship_$section
  done
}

# PS2 - continuation interactive prompt
spaceship_ps2() {
  _prompt_section "yellow" $SPACESHIP_PROMPT_SYMBOL
}

# Setup required environment variables
# All preparation before drawing prompt should be done here
spaceship_setup() {
  # Add exec_time hooks
  add-zsh-hook preexec spaceship_exec_time_start_hook
  add-zsh-hook precmd spaceship_exec_time_end_hook

  # Disable python virtualenv environment prompt prefix
  VIRTUAL_ENV_DISABLE_PROMPT=true

  # Expose Spaceship to environment variables
  PROMPT='$(spaceship_prompt)'
  PS2='$(spaceship_ps2)'

  # LSCOLORS
  # Online editor: https://geoff.greer.fm/lscolors/
  export LSCOLORS="Gxfxcxdxbxegedabagacab"
  export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:ow=0;41:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'
  # Zsh to use the same colors as ls
  # Link: http://superuser.com/a/707567
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
}

# Entry point
# Pass all arguments to the spaceship_setup function
spaceship_setup "$@"
