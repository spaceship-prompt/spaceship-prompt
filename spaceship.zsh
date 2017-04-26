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
# TODO: Document ORDER
if [ ! -n "$SPACESHIP_PROMPT_ORDER" ]; then
  SPACESHIP_PROMPT_ORDER=(
    time
    user
    host
    dir
    git
    node
    ruby
    xcode
    swift
    golang
    docker
    venv
    pyenv
    line_sep
    vi_mode
    char
  )
fi

# PROMPT
# TODO: Document SEPARATOR
SPACESHIP_PROMPT_SEPARATOR="${SPACESHIP_PROMPT_SEPARATOR:=" "}"
SPACESHIP_PROMPT_SYMBOL="${SPACESHIP_PROMPT_SYMBOL:="➔"}"
SPACESHIP_PROMPT_ADD_NEWLINE="${SPACESHIP_PROMPT_ADD_NEWLINE:=true}"
SPACESHIP_PROMPT_SEPARATE_LINE="${SPACESHIP_PROMPT_SEPARATE_LINE:=true}"
SPACESHIP_PROMPT_TRUNC="${SPACESHIP_PROMPT_TRUNC:=3}"

# PREFIXES
SPACESHIP_PREFIX_SHOW="${SPACEHIP_PREFIX_SHOW:=true}"
SPACESHIP_PREFIX_TIME="${SPACESHIP_PREFIX_TIME:="at "}"
SPACESHIP_PREFIX_USER="${SPACESHIP_PREFIX_USER:="with "}"
SPACESHIP_PREFIX_HOST="${SPACESHIP_PREFIX_HOST:="at "}"
SPACESHIP_PREFIX_DIR="${SPACESHIP_PREFIX_DIR:="in "}"
SPACESHIP_PREFIX_GIT="${SPACESHIP_PREFIX_GIT:="on "}"
SPACESHIP_PREFIX_ENV_DEFAULT="${SPACESHIP_PREFIX_ENV_DEFAULT:="via "}"
SPACESHIP_PREFIX_NODE="${SPACESHIP_PREFIX_NODE:=$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_RUBY="${SPACESHIP_PREFIX_RUBY:=$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_SWIFT="${SPACESHIP_PREFIX_SWIFT:=$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_GOLANG="${SPACESHIP_PREFIX_GOLANG:=$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_DOCKER="${SPACESHIP_PREFIX_DOCKER:="on "}"
SPACESHIP_PREFIX_XCODE="${SPACESHIP_PREFIX_XCODE:=$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_VENV="${SPACESHIP_PREFIX_VENV:=$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_PYENV="${SPACESHIP_PREFIX_PYENV:=$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_VI_MODE="${SPACESHIP_PREFIX_VI_MODE:=""}"

# SUFFIX
# TODO: Document suffixes
SPACESHIP_SUFFIX_SHOW="${SPACEHIP_SUFFIX_SHOW:=true}" # TODO: use in _prompt_section
SPACESHIP_SUFFIX_TIME="${SPACESHIP_SUFFIX_TIME:=""}"
SPACESHIP_SUFFIX_USER="${SPACESHIP_SUFFIX_USER:=""}"
SPACESHIP_SUFFIX_HOST="${SPACESHIP_SUFFIX_HOST:=""}"
SPACESHIP_SUFFIX_DIR="${SPACESHIP_SUFFIX_DIR:=""}"
SPACESHIP_SUFFIX_GIT="${SPACESHIP_SUFFIX_GIT:=""}"
SPACESHIP_SUFFIX_NODE="${SPACESHIP_SUFFIX_NODE:=""}"
SPACESHIP_SUFFIX_RUBY="${SPACESHIP_SUFFIX_RUBY:=""}"
SPACESHIP_SUFFIX_SWIFT="${SPACESHIP_SUFFIX_SWIFT:=""}"
SPACESHIP_SUFFIX_GOLANG="${SPACESHIP_SUFFIX_GOLANG:=""}"
SPACESHIP_SUFFIX_DOCKER="${SPACESHIP_SUFFIX_DOCKER:="on "}"
SPACESHIP_SUFFIX_XCODE="${SPACESHIP_SUFFIX_XCODE:=""}"
SPACESHIP_SUFFIX_VENV="${SPACESHIP_SUFFIX_VENV:=""}"
SPACESHIP_SUFFIX_PYENV="${SPACESHIP_SUFFIX_PYENV:=""}"
SPACESHIP_SUFFIX_VI_MODE="${SPACESHIP_SUFFIX_VI_MODE:=""}"

# COLORS
SPACESHIP_TIME_COLOR="${SPACESHIP_TIME_COLOR:="yellow"}"
SPACESHIP_USER_COLOR="${SPACESHIP_USER_COLOR:="yellow"}" # TODO: root ↓
# SPACESHIP_ROOT_COLOR="${SPACESHIP_ROOT_COLOR:="red"}"
SPACESHIP_HOST_COLOR="${SPACESHIP_HOST_COLOR:="green"}"
SPACESHIP_DIR_COLOR="${SPACESHIP_DIR_COLOR:="cyan"}"
SPACESHIP_GIT_COLOR="${SPACESHIP_GIT_COLOR:="magenta"}"
SPACESHIP_NODE_COLOR="${SPACESHIP_NODE_COLOR:="green"}"
SPACESHIP_RUBY_COLOR="${SPACESHIP_RUBY_COLOR:="red"}"
SPACESHIP_SWIFT_COLOR="${SPACESHIP_SWIFT_COLOR:="yellow"}"
SPACESHIP_GOLANG_COLOR="${SPACESHIP_GOLANG_COLOR:="cyan"}"
SPACESHIP_DOCKER_COLOR="${SPACESHIP_DOCKER_COLOR:="cyan"}"
SPACESHIP_XCODE_COLOR="${SPACESHIP_XCODE_COLOR:="blue"}"
SPACESHIP_VENV_COLOR="${SPACESHIP_VENV_COLOR:="blue"}"
SPACESHIP_PYENV_COLOR="${SPACESHIP_PYENV_COLOR:="yellow"}"
SPACESHIP_VI_MODE_COLOR="${SPACESHIP_VI_MODE_COLOR:="white"}"

# GIT
SPACESHIP_GIT_SHOW="${SPACESHIP_GIT_SHOW:=true}"
SPACESHIP_GIT_UNCOMMITTED="${SPACESHIP_GIT_UNCOMMITTED:="+"}"
SPACESHIP_GIT_UNSTAGED="${SPACESHIP_GIT_UNSTAGED:="!"}"
SPACESHIP_GIT_UNTRACKED="${SPACESHIP_GIT_UNTRACKED:="?"}"
SPACESHIP_GIT_STASHED="${SPACESHIP_GIT_STASHED:="$"}"
SPACESHIP_GIT_UNPULLED="${SPACESHIP_GIT_UNPULLED:="⇣"}"
SPACESHIP_GIT_UNPUSHED="${SPACESHIP_GIT_UNPUSHED:="⇡"}"

# TIME
SPACESHIP_TIME_SHOW="${SPACESHIP_TIME_SHOW:=false}"
SPACESHIP_TIME_FORMAT="${SPACESHIP_TIME_FORMAT:=false}"
SPACESHIP_TIME_12HR="${SPACESHIP_TIME_12HR:=false}"

# NODE
SPACESHIP_NODE_SHOW="${SPACESHIP_NODE_SHOW:=true}"
SPACESHIP_NODE_SYMBOL="${SPACESHIP_NODE_SYMBOL:="⬢"}"
SPACESHIP_NODE_DEFAULT_VERSION="${SPACESHIP_NODE_DEFAULT_VERSION:=""}"

# RUBY
SPACESHIP_RUBY_SHOW="${SPACESHIP_RUBY_SHOW:=true}"
SPACESHIP_RUBY_SYMBOL="${SPACESHIP_RUBY_SYMBOL:="💎"}"

# SWIFT
SPACESHIP_SWIFT_SHOW_LOCAL="${SPACESHIP_SWIFT_SHOW_LOCAL:=true}"
SPACESHIP_SWIFT_SHOW_GLOBAL="${SPACESHIP_SWIFT_SHOW_GLOBAL:=false}"
SPACESHIP_SWIFT_SYMBOL="${SPACESHIP_SWIFT_SYMBOL:="🐦"}"

# GOLANG
SPACESHIP_GOLANG_SHOW="${SPACESHIP_GOLANG_SHOW:=true}"
SPACESHIP_GOLANG_SYMBOL="${SPACESHIP_GOLANG_SYMBOL:="🐹"}"

# DOCKER
SPACESHIP_DOCKER_SHOW="${SPACESHIP_DOCKER_SHOW:=true}"
SPACESHIP_DOCKER_SYMBOL="${SPACESHIP_DOCKER_SYMBOL:="🐳"}"

# XCODE
SPACESHIP_XCODE_SHOW_LOCAL="${SPACESHIP_XCODE_SHOW_LOCAL:=true}"
SPACESHIP_XCODE_SHOW_GLOBAL="${SPACESHIP_XCODE_SHOW_GLOBAL:=false}"
SPACESHIP_XCODE_SYMBOL="${SPACESHIP_XCODE_SYMBOL:="🛠"}"

# VENV
SPACESHIP_VENV_SHOW="${SPACESHIP_VENV_SHOW:=true}"

# PYENV
SPACESHIP_PYENV_SHOW="${SPACESHIP_PYENV_SHOW:=true}"
SPACESHIP_PYENV_SYMBOL="${SPACESHIP_PYENV_SYMBOL:="🐍"}"

# VI_MODE
SPACESHIP_VI_MODE_SHOW="${SPACESHIP_VI_MODE_SHOW:=true}"
SPACESHIP_VI_MODE_INSERT="${SPACESHIP_VI_MODE_INSERT:="[I]"}"
SPACESHIP_VI_MODE_NORMAL="${SPACESHIP_VI_MODE_NORMAL:="[N]"}"

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

# Draw prompt section (bold is used as default)
# USAGE:
#   _prompt_section <color> [prefix] [content] [suffix]
SPACESHIP_OPENED=false # Internal variable for checking if prompt is opened
_prompt_section() {
  local color prefix content suffix
  [[ -n $1 ]] && color="%F{$1}"  || color="%f"
  [[ -n $2 ]] && prefix="$2"     || prefix=""
  [[ -n $3 ]] && content="$3"    || content=""
  [[ -n $4 ]] && suffix="$4"     || suffix=""

  echo -n "%{%B%}" # set bold

  if [[ $SPACESHIP_OPENED == true ]] && [[ $SPACESHIP_PREFIX_SHOW == true ]]; then
    echo -n "$prefix"
  fi
  SPACESHIP_OPENED=true

  echo -n "%{$color%}" # set color
  echo -n "$content"   # section content
  echo -n "%{%f%}"     # unset color

  if [[ $SPACEHIP_SUFFIX_SHOW == true ]]; then
    echo -n "$suffix"
  fi

  echo -n "%{%b%}" # unset bold
  echo -n $SPACESHIP_PROMPT_SEPARATOR
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
    $SPACESHIP_TIME_COLOR \
    $SPACESHIP_PREFIX_TIME \
    $time_str \
    $SPACESHIP_SUFFIX_TIME
}

# USER
# If user is root, then pain it in red. Otherwise, just print in yellow.
spaceship_user() {
  if [[ $LOGNAME != $USER ]] || [[ $USER == 'root' ]] || [[ -n $SSH_CONNECTION ]]; then
    local user_color

    if [[ $USER == 'root' ]]; then
      user_color='red' # TODO: Probably should be exposed as variable
    else
      user_color="$SPACESHIP_USER_COLOR"
    fi

    _prompt_section \
      $user_color \
      $SPACESHIP_PREFIX_USER \
      '%n' \
      $SPACESHIP_SUFFIX_USER
  fi
}

# HOST
# If there is an ssh connections, current machine name.
spaceship_host() {
  [[ -n $SSH_CONNECTION ]] || return

  _prompt_section \
    $SPACESHIP_HOST_COLOR \
    $SPACESHIP_PREFIX_HOST \
    '%m' \
    $SPACESHIP_SUFFIX_USER
}

# DIR
# Current directory. Return only three last items of path
spaceship_dir() {
  _prompt_section \
    $SPACESHIP_DIR_COLOR \
    $SPACESHIP_PREFIX_DIR \
    "%${SPACESHIP_PROMPT_TRUNC}~" \
    $SPACESHIP_SUFFIX_DIR
}

# Uncommitted changes.
# Check for uncommitted changes in the index.
_git_uncomitted() {
  if ! $(git diff --quiet --ignore-submodules --cached); then
    echo -n "${SPACESHIP_GIT_UNCOMMITTED}"
  fi
}

# Unstaged changes.
# Check for unstaged changes.
_git_unstaged() {
  if ! $(git diff-files --quiet --ignore-submodules --); then
    echo -n "${SPACESHIP_GIT_UNSTAGED}"
  fi
}

# Untracked files.
# Check for untracked files.
_git_untracked() {
  if [ -n "$(git ls-files --others --exclude-standard)" ]; then
    echo -n "${SPACESHIP_GIT_UNTRACKED}"
  fi
}

# Stashed changes.
# Check for stashed changes.
_git_stashed() {
  if $(git rev-parse --verify refs/stash &>/dev/null); then
    echo -n "${SPACESHIP_GIT_STASHED}"
  fi
}

# Unpushed and unpulled commits.
# Get unpushed and unpulled commits from remote and draw arrows.
_git_unpushed_unpulled() {
  # check if there is an upstream configured for this branch
  command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

  local count="$(command git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)"
  # exit if the command failed
  [[ !$? ]] || return

  # counters are tab-separated, split on tab and store as array
  count=(${(ps:\t:)count})

  local arrows left=${count[1]} right=${count[2]}

  [[ ${right:=0} > 0 ]] && arrows+="${SPACESHIP_GIT_UNPULLED}"
  [[ ${left:=0} > 0 ]] && arrows+="${SPACESHIP_GIT_UNPUSHED}"

  [[ -n $arrows ]] && echo -n "${arrows}"
}

# GIT
# Collect indicators, git branch and pring string.
spaceship_git() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  # Check if the current directory is in a Git repository.
  command git rev-parse --is-inside-work-tree &>/dev/null || return

  # Check if the current directory is in .git before running git checks.
  if [[ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]]; then
    # Ensure the index is up to date.
    git update-index --really-refresh -q &>/dev/null

    # String of indicators
    local indicators=''

    indicators+="$(_git_uncomitted)"
    indicators+="$(_git_unstaged)"
    indicators+="$(_git_untracked)"
    indicators+="$(_git_stashed)"
    indicators+="$(_git_unpushed_unpulled)"

    [ -n "${indicators}" ] && indicators="[${indicators}]";

    # Show git branch
    _prompt_section \
      $SPACESHIP_GIT_COLOR \
      $SPACESHIP_PREFIX_GIT \
      "$(git_current_branch)" \
      $SPACESHIP_SUFFIX_GIT

    # Show git indicators
    # TODO: move to the git_indicators section
    _prompt_section red '' "$indicators" ''
  fi
}

# VENV
# Show current virtual environment (Python).
spaceship_venv() {
  [[ $SPACESHIP_VENV_SHOW == false ]] && return

  # Check if the current directory running via Virtualenv
  [ -n "$VIRTUAL_ENV" ] && _exists deactivate || return

  _prompt_section \
    $SPACESHIP_VENV_COLOR \
    $SPACESHIP_PREFIX_VENV \
    "$(basename $VIRTUAL_ENV)" \
    $SPACESHIP_SUFFIX_VENV
}

# PYENV
# Show current version of pyenv python, including system.
spaceship_pyenv() {
  [[ $SPACESHIP_PYENV_SHOW == false ]] && return

  # Show NVM status only for Python-specific folders
  test -f requirements.txt || test -n *.py(#qN) || return

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
    $SPACESHIP_PYENV_COLOR \
    $SPACESHIP_PREFIX_PYENV \
    "${SPACESHIP_PYENV_SYMBOL}  ${pyenv_status}" \
    $SPACESHIP_SUFFIX_PYENV
}

# NVM
# Show current version of node, exception system.
if [[ -n $SPACESHIP_NVM_SHOW || -n $SPACESHIP_NVM_SYMBOL || -n $SPACESHIP_PREFIX_NVM ]]; then
  echo
  echo $fg_bold[yellow]'NVM options are deprecated, use NODE instead!'$reset_color
  echo
  echo "Don't panic! Everything is OK."
  echo "This message means you use deprecated options related to NVM."
  echo "All $bold_color*_NVM_*$reset_color options has been renamed to $bold_color*_NODE_*$reset_color"
  echo "Please, use new $bold_color*_NODE_*$reset_color options and these message will disappear."
  echo
  echo "For backward compatibility these options are used:"
  echo
  [[ -n $SPACESHIP_NVM_SHOW ]] && {
    SPACESHIP_NODE_SHOW=$SPACESHIP_NVM_SHOW
    echo "\t$bold_color\$SPACESHIP_NODE_SHOW$reset_color is set to $SPACESHIP_NODE_SYMBOL"
  }
  [[ -n $SPACESHIP_NVM_SYMBOL ]] && {
    SPACESHIP_NODE_SYMBOL=$SPACESHIP_NVM_SYMBOL
    echo "\t$bold_color\$SPACESHIP_NODE_SYMBOL$reset_color is set to $bold_color$SPACESHIP_NODE_SYMBOL$reset_color"
  }
  [[ -n $SPACESHIP_PREFIX_NVM ]] && {
    SPACESHIP_PREFIX_NODE=$SPACESHIP_PREFIX_NVM
    echo "\t$bold_color\$SPACESHIP_PREFIX_NODE$reset_color is set to $bold_color$SPACESHIP_PREFIX_NODE$reset_color"
  }
fi
spaceship_node() {
  [[ $SPACESHIP_NODE_SHOW == false ]] && return

  # Show NODE status only for JS-specific folders
  [[ -f package.json || -d node_modules || -n *.js(#qN) ]] || return

  local node_version

  if _exists nvm; then
    node_version=$(nvm current 2>/dev/null)
    [[ $node_version == "system" || $node_version == "node" ]] && return
  elif _exists node; then
    node_version=$(node -v)
    [[ $node_version == $SPACESHIP_NODE_DEFAULT_VERSION ]] && return
  else
    return
  fi

  _prompt_section \
    $SPACESHIP_NODE_COLOR \
    $SPACESHIP_PREFIX_NODE \
    "${SPACESHIP_NODE_SYMBOL} ${node_version}" \
    $SPACESHIP_SUFFIX_NODE
}

# RUBY
# Show current version of Ruby
# FIXME: ruby_version should be local
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
    ruby_version=$(rbenv version | sed -e 's/ (set.*$//')
  else
    return
  fi

  [[ "${ruby_version}" == "system" ]] && return

  # Add 'v' before ruby version that starts with a number
  [[ "${ruby_version}" =~ ^[0-9].+$ ]] && ruby_version="v${ruby_version}"

  _prompt_section \
    $SPACESHIP_RUBY_COLOR \
    $SPACESHIP_PREFIX_RUBY \
    "${SPACESHIP_RUBY_SYMBOL}  ${ruby_version}" \
    $SPACESHIP_SUFFIX_RUBY
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
    $SPACESHIP_SWIFT_COLOR \
    $SPACESHIP_PREFIX_SWIFT \
    "${SPACESHIP_SWIFT_SYMBOL}  ${swift_version}" \
    $SPACESHIP_SUFFIX_SWIFT
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
          $SPACESHIP_XCODE_COLOR \
          $SPACESHIP_PREFIX_XCODE \
          "${SPACESHIP_XCODE_SYMBOL}  ${xcode_version}" \
          $SPACESHIP_SUFFIX_XCODE
      fi
    fi
  fi
}

# GOLANG
# Show current version of golang
spaceship_golang() {
  [[ $SPACESHIP_GOLANG_SHOW == false ]] && return

  # If there are Go-specific files in current directory
  [[ -d Godeps || -f glide.yaml || -n *.go(#qN) ]] || return

  _exists go || return

  local go_version=$(go version | grep --colour=never -oE '[[:digit:]].[[:digit:]]')

  _prompt_section \
    $SPACESHIP_GOLANG_COLOR \
    $SPACESHIP_PREFIX_GOLANG \
    "${SPACESHIP_GOLANG_SYMBOL}  v${go_version}" \
    $SPACESHIP_SUFFIX_GOLANG
}

# DOCKER
spaceship_docker() {
  [[ $SPACESHIP_DOCKER_SHOW == false ]] && return

  _exists docker || return

  if [[ -z $DOCKER_MACHINE_NAME ]]; then
    DOCKER_MACHINE_NAME="localhost"
  fi

  local docker_version=$(docker version -f "{{.Server.Version}}")

  _prompt_section \
    $SPACESHIP_DOCKER_COLOR \
    $SPACESHIP_PREFIX_DOCKER \
    "${SPACESHIP_DOCKER_SYMBOL}  v${docker_version} via〔$DOCKER_MACHINE_NAME〕" \
    $SPACESHIP_SUFFIX_DOCKER
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

    # TODO: use variable for color
    _prompt_section \
      $SPACESHIP_VI_MODE_COLOR \
      $SPACESHIP_PREFIX_VI_MODE \
      $mode_indicator \
      $SPACESHIP_SUFFIX_VI_MODE
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
  _prompt_section "%(?.green.red)" '' "${SPACESHIP_PROMPT_SYMBOL}" ''
}

# ------------------------------------------------------------------------------
# MAIN
# An entry point of prompt
# ------------------------------------------------------------------------------

# Entry point
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
  _prompt_section yellow '' $SPACESHIP_PROMPT_SYMBOL ''
}

# Disable python virtualenv environment prompt prefix
VIRTUAL_ENV_DISABLE_PROMPT=true

# Expose Spaceship to environment variables
PROMPT='$(spaceship_prompt)'
PS2='$(spaceship_ps2)'

# LSCOLORS
export LSCOLORS="Gxfxcxdxbxegedabagacab"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:ow=0;41:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'
# Zsh to use the same colors as ls
# Link: http://superuser.com/a/707567
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
