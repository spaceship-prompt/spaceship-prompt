#
# Spaceship ZSH
#
# Author: Denys Dovhan, denysdovhan.com
# License: MIT
# https://github.com/denysdovhan/spaceship-prompt

# Current version of Spaceship
# Useful for issue reporting
export SPACESHIP_VERSION='3.0.2'

# Common-used variable for new line separator
NEWLINE='
'

<<<<<<< HEAD
# ORDER
if [ ! -n "$SPACESHIP_PROMPT_ORDER" ]; then
  SPACESHIP_PROMPT_ORDER=(
    time
    user
    host
    dir
    git
    git_committime
    hg
    package
    node
    ruby
    elixir
    xcode
    swift
    golang
    php
    rust
    haskell
    julia
    docker
    aws
    venv
    conda
    pyenv
    dotnet
    ember
    kubecontext
    exec_time
    line_sep
    battery
    vi_mode
    jobs
    exit_code
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
# GIT_TIME
SPACESHIP_GIT_COMMITTIME_SHOW="${SPACESHIP_GIT_COMMITTIME_SHOW:=true}"
SPACESHIP_GIT_COMMITTIME_PREFIX="${SPACESHIP_GIT_COMMITTIME_PREFIX:=since }"
SPACESHIP_GIT_COMMITTIME_SUFFIX="${SPACESHIP_GIT_COMMITTIME_SUFFIX:=}"
SPACESHIP_GIT_COMMITTIME_THRESHOLD_LOW="${SPACESHIP_GIT_COMMITTIME_THRESHOLD_LOW:=30}" # in minutes
SPACESHIP_GIT_COMMITTIME_THRESHOLD_HIGH="${SPACESHIP_GIT_COMMITTIME_THRESHOLD_HIGH:=240}" # in minutes

# MERCURIAL
SPACESHIP_HG_SHOW="${SPACESHIP_HG_SHOW:=true}"
SPACESHIP_HG_PREFIX="${SPACESHIP_HG_PREFIX:="on "}"
SPACESHIP_HG_SUFFIX="${SPACESHIP_HG_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HG_SYMBOL="${SPACESHIP_HG_SYMBOL:="☿ "}"
# MERCURIAL BRANCH
SPACESHIP_HG_BRANCH_SHOW="${SPACESHIP_HG_BRANCH_SHOW:=true}"
SPACESHIP_HG_BRANCH_PREFIX="${SPACESHIP_HG_BRANCH_PREFIX:="$SPACESHIP_HG_SYMBOL"}"
SPACESHIP_HG_BRANCH_SUFFIX="${SPACESHIP_HG_BRANCH_SUFFIX:=""}"
SPACESHIP_HG_BRANCH_COLOR="${SPACESHIP_HG_BRANCH_COLOR:="magenta"}"
# MERCURIAL STATUS
SPACESHIP_HG_STATUS_SHOW="${SPACESHIP_HG_STATUS_SHOW:=true}"
SPACESHIP_HG_STATUS_PREFIX="${SPACESHIP_HG_STATUS_PREFIX:=" ["}"
SPACESHIP_HG_STATUS_SUFFIX="${SPACESHIP_HG_STATUS_SUFFIX:="]"}"
SPACESHIP_HG_STATUS_COLOR="${SPACESHIP_HG_STATUS_COLOR:="red"}"
SPACESHIP_HG_STATUS_UNTRACKED="${SPACESHIP_HG_STATUS_UNTRACKED:="?"}"
SPACESHIP_HG_STATUS_ADDED="${SPACESHIP_HG_STATUS_ADDED:="+"}"
SPACESHIP_HG_STATUS_MODIFIED="${SPACESHIP_HG_STATUD_MODIFIED:="!"}"
SPACESHIP_HG_STATUS_DELETED="${SPACESHIP_HG_STATUS_DELETED:="✘"}"

# PACKAGE
SPACESHIP_PACKAGE_SHOW="${SPACESHIP_PACKAGE_SHOW:=true}"
SPACESHIP_PACKAGE_PREFIX="${SPACESHIP_PACKAGE_PREFIX:="is "}"
SPACESHIP_PACKAGE_SUFFIX="${SPACESHIP_PACKAGE_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PACKAGE_SYMBOL="${SPACESHIP_PACKAGE_SYMBOL:="📦 "}"
SPACESHIP_PACKAGE_COLOR="${SPACESHIP_PACKAGE_COLOR:="red"}"

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

# ELIXIR
SPACESHIP_ELIXIR_SHOW="${SPACESHIP_ELIXIR_SHOW:=true}"
SPACESHIP_ELIXIR_PREFIX="${SPACESHIP_ELIXIR_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_ELIXIR_SUFFIX="${SPACESHIP_ELIXIR_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ELIXIR_SYMBOL="${SPACESHIP_ELIXIR_SYMBOL:="💧 "}"
SPACESHIP_ELIXIR_DEFAULT_VERSION="${SPACESHIP_ELIXIR_DEFAULT_VERSION:=""}"
SPACESHIP_ELIXIR_COLOR="${SPACESHIP_ELIXIR_COLOR:="magenta"}"

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
SPACESHIP_PHP_COLOR="${SPACESHIP_PHP_COLOR:="blue"}"

# RUST
SPACESHIP_RUST_SHOW="${SPACESHIP_RUST_SHOW:=true}"
SPACESHIP_RUST_PREFIX="${SPACESHIP_RUST_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RUST_SUFFIX="${SPACESHIP_RUST_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RUST_SYMBOL="${SPACESHIP_RUST_SYMBOL:="𝗥 "}"
SPACESHIP_RUST_COLOR="${SPACESHIP_RUST_COLOR:="red"}"

# HASKELL
SPACESHIP_HASKELL_SHOW="${SPACESHIP_HASKELL_SHOW:=true}"
SPACESHIP_HASKELL_PREFIX="${SPACESHIP_HASKELL_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_HASKELL_SUFFIX="${SPACESHIP_HASKELL_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HASKELL_SYMBOL="${SPACESHIP_HASKELL_SYMBOL:="λ "}"
SPACESHIP_HASKELL_COLOR="${SPACESHIP_HASKELL_COLOR:="red"}"

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

# CONDA
SPACESHIP_CONDA_SHOW="${SPACESHIP_CONDA_SHOW:=true}"
SPACESHIP_CONDA_PREFIX="${SPACESHIP_CONDA_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_CONDA_SUFFIX="${SPACESHIP_CONDA_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_CONDA_SYMBOL="${SPACESHIP_CONDA_SYMBOL:="🅒 "}"
SPACESHIP_CONDA_COLOR="${SPACESHIP_CONDA_COLOR:="blue"}"

# PYENV
SPACESHIP_PYENV_SHOW="${SPACESHIP_PYENV_SHOW:=true}"
SPACESHIP_PYENV_PREFIX="${SPACESHIP_PYENV_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_PYENV_SUFFIX="${SPACESHIP_PYENV_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PYENV_SYMBOL="${SPACESHIP_PYENV_SYMBOL:="🐍 "}"
SPACESHIP_PYENV_COLOR="${SPACESHIP_PYENV_COLOR:="yellow"}"

# DOTNET
SPACESHIP_DOTNET_SHOW="${SPACESHIP_DOTNET_SHOW:=true}"
SPACESHIP_DOTNET_PREFIX="${SPACESHIP_DOTNET_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_DOTNET_SUFFIX="${SPACESHIP_DOTNET_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DOTNET_SYMBOL="${SPACESHIP_DOTNET_SYMBOL:=".NET "}"
SPACESHIP_DOTNET_COLOR="${SPACESHIP_DOTNET_COLOR:="128"}"

# EMBER
SPACESHIP_EMBER_SHOW="${SPACESHIP_EMBER_SHOW:=true}"
SPACESHIP_EMBER_PREFIX="${SPACESHIP_EMBER_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_EMBER_SUFFIX="${SPACESHIP_EMBER_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_EMBER_SYMBOL="${SPACESHIP_EMBER_SYMBOL:="🐹 "}"
SPACESHIP_EMBER_COLOR="${SPACESHIP_EMBER_COLOR:="210"}"

# KUBECONTEXT
SPACESHIP_KUBECONTEXT_SHOW="${SPACESHIP_KUBECONTEXT_SHOW:=true}"
SPACESHIP_KUBECONTEXT_PREFIX="${SPACESHIP_KUBECONTEXT_PREFIX:="at "}"
SPACESHIP_KUBECONTEXT_SUFFIX="${SPACESHIP_KUBECONTEXT_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_KUBECONTEXT_SYMBOL="${SPACESHIP_KUBECONTEXT_SYMBOL:="☸️ "}"
SPACESHIP_KUBECONTEXT_COLOR="${SPACESHIP_KUBECONTEXT_COLOR:="cyan"}"

# EXECUTION TIME
SPACESHIP_EXEC_TIME_SHOW="${SPACESHIP_EXEC_TIME_SHOW:=true}"
SPACESHIP_EXEC_TIME_PREFIX="${SPACESHIP_EXEC_TIME_PREFIX:="took "}"
SPACESHIP_EXEC_TIME_SUFFIX="${SPACESHIP_EXEC_TIME_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_EXEC_TIME_COLOR="${SPACESHIP_EXEC_TIME_COLOR:="yellow"}"
SPACESHIP_EXEC_TIME_ELAPSED="${SPACESHIP_EXEC_TIME_ELAPSED:=2}"

# BATTERY
SPACESHIP_BATTERY_SHOW="${SPACESHIP_BATTERY_SHOW:=true}"
SPACESHIP_BATTERY_ALWAYS_SHOW="${SPACESHIP_BATTERY_ALWAYS_SHOW:=false}"
SPACESHIP_BATTERY_PREFIX="${SPACESHIP_BATTERY_PREFFIX:=""}"
SPACESHIP_BATTERY_SUFFIX="${SPACESHIP_BATTERY_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_BATTERY_CHARGING_SYMBOL="${SPACESHIP_BATTERY_CHARGING_SYMBOL:="⇡"}"
SPACESHIP_BATTERY_DISCHARGING_SYMBOL="${SPACESHIP_BATTERY_DISCHARGING_SYMBOL:="⇣"}"
SPACESHIP_BATTERY_FULL_SYMBOL="${SPACESHIP_BATTERY_FULL_SYMBOL:="•"}"
SPACESHIP_BATTERY_THRESHOLD="${SPACESHIP_BATTERY_THRESHOLD:=10}"

# VI_MODE
SPACESHIP_VI_MODE_SHOW="${SPACESHIP_VI_MODE_SHOW:=true}"
SPACESHIP_VI_MODE_PREFIX="${SPACESHIP_VI_MODE_PREFIX:=""}"
SPACESHIP_VI_MODE_SUFFIX="${SPACESHIP_VI_MODE_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_VI_MODE_INSERT="${SPACESHIP_VI_MODE_INSERT:="[I]"}"
SPACESHIP_VI_MODE_NORMAL="${SPACESHIP_VI_MODE_NORMAL:="[N]"}"
SPACESHIP_VI_MODE_COLOR="${SPACESHIP_VI_MODE_COLOR:="white"}"

# JOBS
SPACESHIP_JOBS_SHOW="${SPACESHIP_JOBS_SHOW:=true}"
SPACESHIP_JOBS_PREFIX="${SPACESHIP_JOBS_PREFIX:=""}"
SPACESHIP_JOBS_SUFFIX="${SPACESHIP_JOBS_SUFFIX:=" "}"
SPACESHIP_JOBS_SYMBOL="${SPACESHIP_JOBS_SYMBOL:="✦"}"
SPACESHIP_JOBS_COLOR="${SPACESHIP_JOBS_COLOR:="blue"}"

# EXIT CODE
SPACESHIP_EXIT_CODE_SHOW="${SPACESHIP_EXIT_CODE_SHOW:=false}"
SPACESHIP_EXIT_CODE_PREFIX="${SPACESHIP_EXIT_CODE_PREFIX:=""}"
SPACESHIP_EXIT_CODE_SUFFIX="${SPACESHIP_EXIT_CODE_SUFFIX:=" "}"
SPACESHIP_EXIT_CODE_SYMBOL="${SPACESHIP_EXIT_CODE_SYMBOL:="✘"}"
SPACESHIP_EXIT_CODE_COLOR="${SPACESHIP_EXIT_CODE_COLOR:="red"}"

# Amazon Web Services (AWS)
SPACESHIP_AWS_SHOW="${SPACESHIP_AWS_SHOW:=true}"
SPACESHIP_AWS_PREFIX="${SPACESHIP_AWS_PREFIX:="using "}"
SPACESHIP_AWS_SUFFIX="${SPACESHIP_AWS_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AWS_SYMBOL="${SPACESHIP_AWS_SYMBOL:="☁️ "}"
SPACESHIP_AWS_COLOR="${SPACESHIP_AWS_COLOR:="208"}"

=======
# Determination of Spaceship working directory
# https://git.io/vdBH7
if [[ -z "$SPACESHIP_ROOT" ]]; then
  if [[ "${(%):-%N}" == '(eval)' ]]; then
    if [[ "$0" == '-antigen-load' ]] && [[ -r "${PWD}/spaceship.zsh" ]]; then
      # Antigen uses eval to load things so it can change the plugin (!!)
      # https://github.com/zsh-users/antigen/issues/581
      export SPACESHIP_ROOT=$PWD
    else
      print -P "%F{red}You must set SPACESHIP_ROOT to work from within an (eval).%f"
      return 1
    fi
  else
    # Get the path to file this code is executing in; then
    # get the absolute path and strip the filename.
    # See https://stackoverflow.com/a/28336473/108857
    export SPACESHIP_ROOT=${${(%):-%x}:A:h}
  fi
fi

>>>>>>> master
# ------------------------------------------------------------------------------
# CONFIGURATION
# The default configuration that can be overridden in .zshrc
# ------------------------------------------------------------------------------

if [ -z "$SPACESHIP_PROMPT_ORDER" ]; then
  SPACESHIP_PROMPT_ORDER=(
    time          # Time stampts section
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    hg            # Mercurial section (hg_branch  + hg_status)
    package       # Package version
    node          # Node.js section
    ruby          # Ruby section
    elixir        # Elixir section
    xcode         # Xcode section
    swift         # Swift section
    golang        # Go section
    php           # PHP section
    rust          # Rust section
    haskell       # Haskell Stack section
    julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    dotnet        # .NET section
    ember         # Ember.js section
    kubecontext   # Kubectl context section
    exec_time     # Execution time
    line_sep      # Line break
    battery       # Battery level and status
    vi_mode       # Vi-mode indicator
    jobs          # Backgound jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
  )
fi

if [ -z "$SPACESHIP_RPROMPT_ORDER" ]; then
  SPACESHIP_RPROMPT_ORDER=(
    # empty by default
  )
fi

# PROMPT
SPACESHIP_PROMPT_ADD_NEWLINE="${SPACESHIP_PROMPT_ADD_NEWLINE=true}"
SPACESHIP_PROMPT_SEPARATE_LINE="${SPACESHIP_PROMPT_SEPARATE_LINE=true}"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="${SPACESHIP_PROMPT_FIRST_PREFIX=false}"
SPACESHIP_PROMPT_PREFIXES_SHOW="${SPACESHIP_PROMPT_PREFIXES_SHOW=true}"
SPACESHIP_PROMPT_SUFFIXES_SHOW="${SPACESHIP_PROMPT_SUFFIXES_SHOW=true}"
SPACESHIP_PROMPT_DEFAULT_PREFIX="${SPACESHIP_PROMPT_DEFAULT_PREFIX="via "}"
SPACESHIP_PROMPT_DEFAULT_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "}"

# ------------------------------------------------------------------------------
# LIBS
# Spaceship utils/hooks/etc
# ------------------------------------------------------------------------------

# Load utils
source "$SPACESHIP_ROOT/lib/utils.zsh"

# load hooks
source "$SPACESHIP_ROOT/lib/hooks.zsh"

# load section utils
source "$SPACESHIP_ROOT/lib/section.zsh"

# ------------------------------------------------------------------------------
# SECTIONS
# Sourcing sections the prompt consists of
# ------------------------------------------------------------------------------

<<<<<<< HEAD
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
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return

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

# GIT COMMIT TIME
# Show time since last commit with color according duration
# from long time to short: red, yellow, green
# inspired from "hyperzsh"
spaceship_git_committime() {
    [[ $SPACESHIP_GIT_COMMITTIME_SHOW == false ]] && return

    _is_git || return

    local commit_age

    # Get last commit
    last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
    now=$(date +%s)
    seconds_since_last_commit=$((now-last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((seconds_since_last_commit/3600))

    # Sub-hours and sub-minutes
    days=$((seconds_since_last_commit / 86400))
    sub_hours=$((hours % 24))
    sub_minutes=$((minutes % 60))

    if [ $hours -gt 24 ]; then
	commit_age="${days}d "
    elif [ $minutes -gt 60 ]; then
	commit_age="${sub_hours}h${sub_minutes}m "
    else
	commit_age="${minutes}m "
    fi

    if [ "$minutess" -gt $SPACESHIP_GIT_COMMITTIME_THRESHOLD_HIGH ]; then
        COLOR="red"
    elif [ "$minutes" -gt $SPACESHIP_GIT_COMMITTIME_THRESHOLD_LOW ]; then
        COLOR="yellow"
    else
        COLOR="green"
    fi

    _prompt_section \
	"$COLOR" \
	"$SPACESHIP_GIT_COMMITTIME_PREFIX" \
	"$commit_age" \
	"$SPACESHIP_GIT_COMMITTIME_SUFFIX"
}


# MERCURIAL BRANCH
# Show current hg branch
spaceship_hg_branch() {
  [[ $SPACESHIP_HG_BRANCH_SHOW == false ]] && return

  _is_hg || return

  _prompt_section \
    "$SPACESHIP_HG_BRANCH_COLOR" \
    "$SPACESHIP_HG_BRANCH_PREFIX"$(hg branch)"$SPACESHIP_HG_BRANCH_SUFFIX"
}

# MERCURIAL STATUS
# Check if current dir is a hg repo and show hg status as indicators
spaceship_hg_status() {
  [[ $SPACESHIP_HG_STATUS_SHOW == false ]] && return

  _is_hg || return

  local INDEX=$(hg status 2>/dev/null) hg_status=""

  # Indicators are suffixed instead of prefixed to each other to
  # provide uniform view across git and mercurial indicators
  if $(echo "$INDEX" | grep -E '^\? ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_UNTRACKED$hg_status"
  elif $(echo "$INDEX" | grep -E '^A ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_ADDED$hg_status"
  elif $(echo "$INDEX" | grep -E '^M ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_MODIFIED$hg_status"
  elif $(echo "$INDEX" | grep -E '^(R|!)' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_DELETED$hg_status"
  fi

  if [[ -n $hg_status ]]; then
    _prompt_section \
      "$SPACESHIP_HG_STATUS_COLOR" \
      "$SPACESHIP_HG_STATUS_PREFIX"$hg_status"$SPACESHIP_HG_STATUS_SUFFIX"
  fi
}

# MERCURIAL
# Show both hg branch and hg status:
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

# PACKAGE
# Show current package version
spaceship_package() {
  [[ $SPACESHIP_PACKAGE_SHOW == false ]] && return

  # Show package version only when repository is a package
  # @todo: add more package managers
  [[ -f package.json ]] || return

  _exists npm || return

  # Grep and cut out package version
  # Grep -E does not support \d for digits shortcut, should use [:digit:] or [0-9] instead
  local package_version=$(grep -E '"version": "v?([0-9]+\.){1,}' package.json | cut -d\" -f4 2> /dev/null)

  # Handle version not found
  if [ ! "$package_version" ]; then
    package_version=" ⚠"
  else
    package_version=" v${package_version}"
  fi

  _prompt_section \
    "$SPACESHIP_PACKAGE_COLOR" \
    "$SPACESHIP_PACKAGE_PREFIX" \
    "${SPACESHIP_PACKAGE_SYMBOL}${package_version}" \
    "$SPACESHIP_PACKAGE_SUFFIX"
}

# NODE
# Show current version of node, exception system.
spaceship_node() {
  [[ $SPACESHIP_NODE_SHOW == false ]] && return

  # Show NODE status only for JS-specific folders
  [[ -f package.json || -d node_modules || -n *.js(#qN^/) ]] || return

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
  [[ -f Gemfile || -f Rakefile || -n *.rb(#qN^/) ]] || return

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

# ELIXIR
# Show current version of Elixir
spaceship_elixir() {
  [[ $SPACESHIP_ELIXIR_SHOW == false ]] && return

  # Show versions only for Elixir-specific folders
  [[ -f mix.exs || -n *.ex(#qN^/) || -n *.exs(#qN^/) ]] || return

  local elixir_version

  if _exists kiex; then
    elixir_version="${ELIXIR_VERSION}"
  elif _exists exenv; then
    elixir_version=$(exenv version-name)
  fi

  if [[ $elixir_version == "" ]]; then
    _exists elixir || return
    elixir_version=$(elixir -v 2>/dev/null | grep "Elixir" --color=never | cut -d ' ' -f 2)
  fi

  [[ $elixir_version == "system" ]] && return
  [[ $elixir_version == $SPACESHIP_ELIXIR_DEFAULT_VERSION ]] && return

  # Add 'v' before elixir version that starts with a number
  [[ "${elixir_version}" =~ ^[0-9].+$ ]] && elixir_version="v${elixir_version}"

  _prompt_section \
    "$SPACESHIP_ELIXIR_COLOR" \
    "$SPACESHIP_ELIXIR_PREFIX" \
    "${SPACESHIP_ELIXIR_SYMBOL}${elixir_version}" \
    "$SPACESHIP_ELIXIR_SUFFIX"
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

  # If there are Go-specific files in current directory, or current directory is under the GOPATH
  [[ -d Godeps || -f glide.yaml || -n *.go(#qN^/) || -f Gopkg.yml || -f Gopkg.lock || ( $GOPATH && $PWD =~ $GOPATH ) ]] || return

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
  [[ -n *.php(#qN^/) ]] || return

  _exists php || return

  local php_version=$(php -v 2>&1 | grep --color=never -oe "^PHP\s*[0-9.]*" | awk '{print $2}')

  _prompt_section \
    "$SPACESHIP_PHP_COLOR" \
    "$SPACESHIP_PHP_PREFIX" \
    "${SPACESHIP_PHP_SYMBOL}v${php_version}" \
    "${SPACESHIP_PHP_SUFFIX}"
}

# RUST
# Show current version of Rust
spaceship_rust() {
  [[ $SPACESHIP_RUST_SHOW == false ]] && return

  # If there are Rust-specific files in current directory
  [[ -f Cargo.toml || -n *.rs(#qN^/) ]] || return

  _exists rustc || return

  local rust_version=$(rustc --version | grep --colour=never -oE '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]')

  _prompt_section \
    "$SPACESHIP_RUST_COLOR" \
    "$SPACESHIP_RUST_PREFIX" \
    "${SPACESHIP_RUST_SYMBOL}v${rust_version}" \
    "$SPACESHIP_RUST_SUFFIX"
}

# HASKELL
# Show current version of Haskell Tool Stack.
spaceship_haskell() {
  [[ $SPACESHIP_HASKELL_SHOW == false ]] && return

  # If there are stack files in current directory
  [[ -f stack.yaml ]] || return

  # The command is stack, so do not change this to haskell.
  _exists stack || return

  local haskell_version=$(stack --numeric-version)

  _prompt_section \
    "$SPACESHIP_HASKELL_COLOR" \
    "$SPACESHIP_HASKELL_PREFIX" \
    "${SPACESHIP_HASKELL_SYMBOL}v${haskell_version}" \
    "$SPACESHIP_HASKELL_SUFFIX"
}

# JULIA
# Show current version of Julia
spaceship_julia() {
  [[ $SPACESHIP_JULIA_SHOW == false ]] && return

  # If there are julia files in current directory
  [[ -n *.jl(#qN^/) ]] || return

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

  # Show Docker status only for Docker-specific folders
  [[ -f Dockerfile || -f docker-compose.yml ]] || return

  # if docker daemon isn't running you'll get an error saying it can't connect
  local docker_version=$(docker version -f "{{.Server.Version}}" 2>/dev/null)
  [[ -z $docker_version ]] && return

  if [[ -n $DOCKER_MACHINE_NAME ]]; then
    docker_version+=" via ($DOCKER_MACHINE_NAME)"
  fi

  _prompt_section \
    "$SPACESHIP_DOCKER_COLOR" \
    "$SPACESHIP_DOCKER_PREFIX" \
    "${SPACESHIP_DOCKER_SYMBOL}v${docker_version}" \
    "$SPACESHIP_DOCKER_SUFFIX"
}

# Amazon Web Services (AWS)
# Shows selected AWS cli profile.
spaceship_aws() {
  [[ $SPACESHIP_AWS_SHOW == false ]] && return
  # Check if the AWS-cli is installed
  _exists aws || return

  # Is the current profile not the default profile
  [[ -z $AWS_DEFAULT_PROFILE ]] || [[ "$AWS_DEFAULT_PROFILE" == "default" ]] && return

  # Show prompt section
  _prompt_section \
    "$SPACESHIP_AWS_COLOR" \
    "$SPACESHIP_AWS_PREFIX" \
    "${SPACESHIP_AWS_SYMBOL}$AWS_DEFAULT_PROFILE" \
    "$SPACESHIP_AWS_SUFFIX"
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
    "$VIRTUAL_ENV:t" \
    "$SPACESHIP_VENV_SUFFIX"
}

# CONDA
# Show current conda virtual environment
spaceship_conda() {
  [[ $SPACESHIP_CONDA_SHOW == false ]] && return

  # Check if running via conda virtualenv
  _exists conda && [ -n "$CONDA_DEFAULT_ENV" ] || return

  _prompt_section \
    "$SPACESHIP_CONDA_COLOR" \
    "$SPACESHIP_CONDA_PREFIX" \
    "${SPACESHIP_CONDA_SYMBOL}${CONDA_DEFAULT_ENV}" \
    "$SPACESHIP_CONDA_SUFFIX"
}

# PYENV
# Show current version of pyenv python, including system.
spaceship_pyenv() {
  [[ $SPACESHIP_PYENV_SHOW == false ]] && return

  # Show pyenv python version only for Python-specific folders
  [[ -f requirements.txt ]] || [[ -n *.py(#qN^/) ]] || return

  _exists pyenv || return # Do nothing if pyenv is not installed

  local pyenv_status=${$(pyenv version-name 2>/dev/null)//:/ }

  _prompt_section \
    "$SPACESHIP_PYENV_COLOR" \
    "$SPACESHIP_PYENV_PREFIX" \
    "${SPACESHIP_PYENV_SYMBOL}${pyenv_status}" \
    "$SPACESHIP_PYENV_SUFFIX"
}

# DOTNET
# Show current version of .NET SDK
spaceship_dotnet() {
  [[ $SPACESHIP_DOTNET_SHOW == false ]] && return

  # Show DOTNET status only for folders containing project.json, global.json, .csproj, .xproj or .sln files
  [[ -f project.json || -f global.json || -n *.csproj(#qN^/) || -n *.xproj(#qN^/) || -n *.sln(#qN^/) ]] || return

  _exists dotnet || return

  # dotnet-cli automatically handles SDK pinning (specified in a global.json file)
  # therefore, this already returns the expected version for the current directory
  local dotnet_version=$(dotnet --version 2>/dev/null)

  _prompt_section \
    "$SPACESHIP_DOTNET_COLOR" \
    "$SPACESHIP_DOTNET_PREFIX" \
    "${SPACESHIP_DOTNET_SYMBOL}${dotnet_version}" \
    "$SPACESHIP_DOTNET_SUFFIX"
}

# EMBER
# Show current version of ember, exception system.
spaceship_ember() {
  [[ $SPACESHIP_EMBER_SHOW == false ]] && return

  # Show EMBER status only for folders w/ ember-cli-build.js files
  [[ -f ember-cli-build.js && -f node_modules/ember-cli/package.json ]] || return

  local ember_version=$(grep '"version":' ./node_modules/ember-cli/package.json | cut -d\" -f4)
  [[ $ember_version == "system" || $ember_version == "ember" ]] && return

  _prompt_section \
    "$SPACESHIP_EMBER_COLOR" \
    "$SPACESHIP_EMBER_PREFIX" \
    "${SPACESHIP_EMBER_SYMBOL}${ember_version}" \
    "$SPACESHIP_EMBER_SUFFIX"
}

# KUBECONTEXT
# Show current context in kubectl.
spaceship_kubecontext() {
  [[ $SPACESHIP_KUBECONTEXT_SHOW == false ]] && return

  _exists kubectl || return
  local kube_context=$(kubectl config current-context 2>/dev/null)
  [[ -z $kube_context ]] && return

  _prompt_section \
    "$SPACESHIP_KUBECONTEXT_COLOR" \
    "$SPACESHIP_KUBECONTEXT_PREFIX" \
    "${SPACESHIP_KUBECONTEXT_SYMBOL}${kube_context}" \
    "$SPACESHIP_KUBECONTEXT_SUFFIX"
}

# EXECUTION TIME
# Execution time of the last command.
spaceship_exec_time() {
  [[ $SPACESHIP_EXEC_TIME_SHOW == false ]] && return

  if [[ $SPACESHIP_EXEC_TIME_duration -ge $SPACESHIP_EXEC_TIME_ELAPSED ]]; then
    _prompt_section \
      "$SPACESHIP_EXEC_TIME_COLOR" \
      "$SPACESHIP_EXEC_TIME_PREFIX" \
      "$(_displaytime $SPACESHIP_EXEC_TIME_duration)" \
      "$SPACESHIP_EXEC_TIME_SUFFIX"
  fi
}

# BATTERY
# Show section only if either of follow is true
# - Always show is true
# - battery percentage is below the given limit (default: 10%)
# - Battery is fully charged
# Escape % for display since it's a special character in zsh prompt expansion
spaceship_battery() {
  [[ $SPACESHIP_BATTERY_SHOW == false ]] && return

  local battery_data battery_percent battery_status battery_color

  if _exists pmset; then
    battery_data=$(pmset -g batt)

    # Return if no internal battery
    [[ -z $(echo $battery_data | grep "InternalBattery") ]] && return

    battery_percent="$( echo $battery_data | grep -oE '[0-9]{1,3}%' )"
    battery_status="$( echo $battery_data | awk -F '; *' 'NR==2 { print $2 }' )"
  elif _exists upower; then
    local battery=$(command upower -e | grep battery | head -1)

    # Return if no battery
    [[ -z $battery ]] && return

    battery_data=$(upower -i $battery)
    battery_percent="$( echo $battery_data | grep percentage | awk '{print $2}' )"
    battery_status="$( echo $battery_data | grep state | awk '{print $2}' )"
  elif _exists acpi; then
    battery_data=$(acpi -b)

    # Return if no battery
    [[ -z $battery_data ]] && return
    battery_percent="$( echo $battery_data | awk '{print $4}' )"
    battery_status="$( echo $battery_data | awk '{print tolower($3)}' )"
=======
for section in $(spaceship::union $SPACESHIP_PROMPT_ORDER $SPACESHIP_RPROMPT_ORDER); do
  if [[ -f "$SPACESHIP_ROOT/sections/$section.zsh" ]]; then
    source "$SPACESHIP_ROOT/sections/$section.zsh"
  elif spaceship::defined "spaceship_$section"; then
    # Custom section is declared, nothing else to do
    continue
>>>>>>> master
  else
    echo "Section '$section' have not been loaded."
  fi
done

# ------------------------------------------------------------------------------
# BACKWARD COMPATIBILITY WARNINGS
# Show deprecation messages for options that are set, but not supported
# ------------------------------------------------------------------------------

spaceship::deprecated SPACESHIP_PROMPT_SYMBOL "Use %BSPACESHIP_CHAR_SYMBOL%b instead."
spaceship::deprecated SPACESHIP_BATTERY_ALWAYS_SHOW "Use %BSPACESHIP_BATTERY_SHOW='always'%b instead."
spaceship::deprecated SPACESHIP_BATTERY_CHARGING_SYMBOL "Use %BSPACESHIP_BATTERY_SYMBOL_CHARGING%b instead."
spaceship::deprecated SPACESHIP_BATTERY_DISCHARGING_SYMBOL "Use %BSPACESHIP_BATTERY_SYMBOL_DISCHARGING%b instead."
spaceship::deprecated SPACESHIP_BATTERY_FULL_SYMBOL "Use %BSPACESHIP_BATTERY_SYMBOL_FULL%b instead."

# ------------------------------------------------------------------------------
# PROMPTS
# An entry point of prompt
# ------------------------------------------------------------------------------

# PROMPT
# Primary (left) prompt
spaceship_prompt() {
  # Retrieve exit code of last command to use in exit_code
  # Must be captured before any other command in prompt is executed
  # Must be the very first line in all entry prompt functions, or the value
  # will be overridden by a different command execution - do not move this line!
  RETVAL=$?

  # Should it add a new line before the prompt?
  [[ $SPACESHIP_PROMPT_ADD_NEWLINE == true ]] && echo -n "$NEWLINE"
  spaceship::compose_prompt $SPACESHIP_PROMPT_ORDER
}

# $RPROMPT
# Optional (right) prompt
spaceship_rprompt() {
  # Retrieve exit code of last command to use in exit_code
  RETVAL=$?

  spaceship::compose_prompt $SPACESHIP_RPROMPT_ORDER
}

# PS2
# Continuation interactive prompt
spaceship_ps2() {
  # Retrieve exit code of last command to use in exit_code
  RETVAL=$?

  spaceship::section "$SPACESHIP_CHAR_COLOR_SECONDARY" $SPACESHIP_CHAR_SYMBOL
}

# ------------------------------------------------------------------------------
# SETUP
# Setup requirements for prompt
# ------------------------------------------------------------------------------

# Runs once when user opens a terminal
# All preparation before drawing prompt should be done here
prompt_spaceship_setup() {
  autoload -Uz add-zsh-hook

  # This variable is a magic variable used when loading themes with zsh's prompt
  # function. It will ensure the proper prompt options are set.
  prompt_opts=(cr percent sp subst)

  # Borrowed from promptinit, sets the prompt options in case the prompt was not
  # initialized via promptinit.
  setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"

  # Add exec_time hooks
  add-zsh-hook preexec spaceship_exec_time_preexec_hook
  add-zsh-hook precmd spaceship_exec_time_precmd_hook

  # Disable python virtualenv environment prompt prefix
  VIRTUAL_ENV_DISABLE_PROMPT=true

  # Expose Spaceship to environment variables
  PROMPT='$(spaceship_prompt)'
  PS2='$(spaceship_ps2)'
  RPS1='$(spaceship_rprompt)'
}

# ------------------------------------------------------------------------------
# ENTRY POINT
# An entry point of prompt
# ------------------------------------------------------------------------------

# Pass all arguments to the spaceship_setup function
prompt_spaceship_setup "$@"
