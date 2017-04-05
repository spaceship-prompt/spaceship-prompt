#
# Spaceship ZSH Theme
#
# Author: Denys Dovhan, denysdovhan.com
# License: MIT
# https://github.com/denysdovhan/spaceship-zsh-theme

NEWLINE='
'

# PROMPT
SPACESHIP_PROMPT_SYMBOL="${SPACESHIP_PROMPT_SYMBOL:-➔}"
SPACESHIP_PROMPT_ADD_NEWLINE="${SPACESHIP_PROMPT_ADD_NEWLINE:-true}"
SPACESHIP_PROMPT_SEPARATE_LINE="${SPACESHIP_PROMPT_SEPARATE_LINE:-true}"
SPACESHIP_PROMPT_TRUNC="${SPACESHIP_PROMPT_TRUNC:-3}"

# PREFIXES
SPACESHIP_PREFIX_SHOW="${SPACEHIP_PREFIX_SHOW:-true}"
SPACESHIP_PREFIX_HOST="${SPACESHIP_PREFIX_HOST:-" at "}"
SPACESHIP_PREFIX_DIR="${SPACESHIP_PREFIX_DIR:-" in "}"
SPACESHIP_PREFIX_GIT="${SPACESHIP_PREFIX_GIT:-" on "}"
SPACESHIP_PREFIX_ENV_DEFAULT="${SPACESHIP_PREFIX_ENV_DEFAULT:-" via "}"
SPACESHIP_PREFIX_NVM="${SPACESHIP_PREFIX_NVM:-$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_RUBY="${SPACESHIP_PREFIX_RUBY:-$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_SWIFT="${SPACESHIP_PREFIX_SWIFT:-$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_GOLANG="${SPACESHIP_PREFIX_GOLANG:-$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_DOCKER="${SPACESHIP_PREFIX_DOCKER:-" on "}"
SPACESHIP_PREFIX_XCODE="${SPACESHIP_PREFIX_XCODE:-$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_VENV="${SPACESHIP_PREFIX_VENV:-$SPACESHIP_PREFIX_ENV_DEFAULT}"
SPACESHIP_PREFIX_PYENV="${SPACESHIP_PREFIX_PYENV:-$SPACESHIP_PREFIX_ENV_DEFAULT}"

# GIT
SPACESHIP_GIT_SHOW="${SPACESHIP_GIT_SHOW:-true}"
SPACESHIP_GIT_UNCOMMITTED="${SPACESHIP_GIT_UNCOMMITTED:-+}"
SPACESHIP_GIT_UNSTAGED="${SPACESHIP_GIT_UNSTAGED:-!}"
SPACESHIP_GIT_UNTRACKED="${SPACESHIP_GIT_UNTRACKED:-?}"
SPACESHIP_GIT_STASHED="${SPACESHIP_GIT_STASHED:-$}"
SPACESHIP_GIT_UNPULLED="${SPACESHIP_GIT_UNPULLED:-⇣}"
SPACESHIP_GIT_UNPUSHED="${SPACESHIP_GIT_UNPUSHED:-⇡}"

# TIME
SPACESHIP_TIME_SHOW="${SPACESHIP_TIME_SHOW:-false}"
SPACESHIP_TIME_FORMAT="${SPACESHIP_TIME_FORMAT:-false}"
SPACESHIP_TIME_12HR="${SPACESHIP_TIME_12HR:-false}"

# NVM
SPACESHIP_NVM_SHOW="${SPACESHIP_NVM_SHOW:-true}"
SPACESHIP_NVM_SYMBOL="${SPACESHIP_NVM_SYMBOL:-⬢}"

# RUBY
SPACESHIP_RUBY_SHOW="${SPACESHIP_RUBY_SHOW:-true}"
SPACESHIP_RUBY_SYMBOL="${SPACESHIP_RUBY_SYMBOL:-💎}"

# SWIFT
SPACESHIP_SWIFT_SHOW_LOCAL="${SPACESHIP_SWIFT_SHOW_LOCAL:-true}"
SPACESHIP_SWIFT_SHOW_GLOBAL="${SPACESHIP_SWIFT_SHOW_GLOBAL:-false}"
SPACESHIP_SWIFT_SYMBOL="${SPACESHIP_SWIFT_SYMBOL:-🐦}"

# GOLANG
SPACESHIP_GOLANG_SHOW="${SPACESHIP_GOLANG_SHOW:-true}"
SPACESHIP_GOLANG_SYMBOL="${SPACESHIP_GOLANG_SYMBOL:-🐹}"

# DOCKER
SPACESHIP_DOCKER_SHOW="${SPACESHIP_DOCKER_SHOW:-true}"
SPACESHIP_DOCKER_SYMBOL="${SPACESHIP_DOCKER_SYMBOL:-🐳}"

# XCODE
SPACESHIP_XCODE_SHOW_LOCAL="${SPACESHIP_XCODE_SHOW_LOCAL:-true}"
SPACESHIP_XCODE_SHOW_GLOBAL="${SPACESHIP_XCODE_SHOW_GLOBAL:-false}"
SPACESHIP_XCODE_SYMBOL="${SPACESHIP_XCODE_SYMBOL:-🛠}"

# VENV
SPACESHIP_VENV_SHOW="${SPACESHIP_VENV_SHOW:-true}"

# PYENV
SPACESHIP_PYENV_SHOW="${SPACESHIP_PYENV_SHOW:-true}"
SPACESHIP_PYENV_SYMBOL="${SPACESHIP_PYENV_SYMBOL:-🐍}"

# VI_MODE
SPACESHIP_VI_MODE_SHOW="${SPACESHIP_VI_MODE_SHOW:-true}"
SPACESHIP_VI_MODE_INSERT="${SPACESHIP_VI_MODE_INSERT:-[I]}"
SPACESHIP_VI_MODE_NORMAL="${SPACESHIP_VI_MODE_NORMAL:-[N]}"

# Time
spaceship_time() {
  [[ $SPACESHIP_TIME_SHOW == false ]] && return

  if [[ $SPACESHIP_TIME_FORMAT != false ]]; then
    echo -n "%{$fg_bold[yellow]%}${SPACESHIP_TIME_FORMAT}"
  elif [[ $SPACESHIP_TIME_12HR == true ]]; then
    echo -n "%{$fg_bold[yellow]%}%D{%r}"
  else
    echo -n "%{$fg_bold[yellow]%}%D{%T}"
  fi

  echo -n "%{$reset_color%} "
}

# Username.
# If user is root, then pain it in red. Otherwise, just print in yellow.
spaceship_user() {
  if [[ $USER == 'root' ]]; then
    echo -n "%{$fg_bold[red]%}"
  else
    echo -n "%{$fg_bold[yellow]%}"
  fi
  echo -n "%n"
  echo -n "%{$reset_color%}"
}

# Username and SSH host
# If there is an ssh connections, then show user and current machine.
# If user is not $USER, then show username.
spaceship_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo -n "$(spaceship_user)"

    # Do not show directory prefix if prefixes are disabled
    [[ $SPACESHIP_PREFIX_SHOW == true ]] && echo -n "%B${SPACESHIP_PREFIX_DIR}%b" || echo -n ' '
    # Display machine name
    echo -n "%{$fg_bold[green]%}%m%{$reset_color%}"
    # Do not show host prefix if prefixes are disabled
    [[ $SPACESHIP_PREFIX_SHOW == true ]] && echo -n "%B${SPACESHIP_PREFIX_HOST}%b" || echo -n ' '

  elif [[ $LOGNAME != $USER ]] || [[ $USER == 'root' ]]; then
    echo -n "$(spaceship_user)"

    # Do not show host prefix if prefixes are disabled
    [[ $SPACESHIP_PREFIX_SHOW == true ]] && echo -n "%B${SPACESHIP_PREFIX_HOST}%b" || echo -n ' '

    echo -n "%{$reset_color%}"
  fi
}

# Current directory.
# Return only three last items of path
spaceship_current_dir() {
  echo -n "%{$fg_bold[cyan]%}"
  echo -n "%${SPACESHIP_PROMPT_TRUNC}~";
  echo -n "%{$reset_color%}"
}

# Uncommitted changes.
# Check for uncommitted changes in the index.
spaceship_git_uncomitted() {
  if ! $(git diff --quiet --ignore-submodules --cached); then
    echo -n "${SPACESHIP_GIT_UNCOMMITTED}"
  fi
}

# Unstaged changes.
# Check for unstaged changes.
spaceship_git_unstaged() {
  if ! $(git diff-files --quiet --ignore-submodules --); then
    echo -n "${SPACESHIP_GIT_UNSTAGED}"
  fi
}

# Untracked files.
# Check for untracked files.
spaceship_git_untracked() {
  if [ -n "$(git ls-files --others --exclude-standard)" ]; then
    echo -n "${SPACESHIP_GIT_UNTRACKED}"
  fi
}

# Stashed changes.
# Check for stashed changes.
spaceship_git_stashed() {
  if $(git rev-parse --verify refs/stash &>/dev/null); then
    echo -n "${SPACESHIP_GIT_STASHED}"
  fi
}

# Unpushed and unpulled commits.
# Get unpushed and unpulled commits from remote and draw arrows.
spaceship_git_unpushed_unpulled() {
  # check if there is an upstream configured for this branch
  command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

  local count
  count="$(command git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)"
  # exit if the command failed
  (( !$? )) || return

  # counters are tab-separated, split on tab and store as array
  count=(${(ps:\t:)count})
  local arrows left=${count[1]} right=${count[2]}

  (( ${right:-0} > 0 )) && arrows+="${SPACESHIP_GIT_UNPULLED}"
  (( ${left:-0} > 0 )) && arrows+="${SPACESHIP_GIT_UNPUSHED}"

  [ -n $arrows ] && echo -n "${arrows}"
}

# Git status.
# Collect indicators, git branch and pring string.
spaceship_git_status() {
  [[ $SPACESHIP_GIT_SHOW == false ]] && return

  # Check if the current directory is in a Git repository.
  command git rev-parse --is-inside-work-tree &>/dev/null || return

  # Check if the current directory is in .git before running git checks.
  if [[ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]]; then
    # Ensure the index is up to date.
    git update-index --really-refresh -q &>/dev/null

    # String of indicators
    local indicators=''

    indicators+="$(spaceship_git_uncomitted)"
    indicators+="$(spaceship_git_unstaged)"
    indicators+="$(spaceship_git_untracked)"
    indicators+="$(spaceship_git_stashed)"
    indicators+="$(spaceship_git_unpushed_unpulled)"

    [ -n "${indicators}" ] && indicators=" [${indicators}]";

    # Do not show git prefix if prefixes are disabled
    [[ $SPACESHIP_PREFIX_SHOW == true ]] && echo -n "%B${SPACESHIP_PREFIX_GIT}%b" || echo -n ' '

    echo -n "%{$fg_bold[magenta]%}"
    echo -n "$(git_current_branch)"
    echo -n "%{$reset_color%}"
    echo -n "%{$fg_bold[red]%}"
    echo -n "$indicators"
    echo -n "%{$reset_color%}"
  fi
}

# Virtual environment.
# Show current virtual environment (Python).
spaceship_venv_status() {
  [[ $SPACESHIP_VENV_SHOW == false ]] && return

  # Check if the current directory running via Virtualenv
  [ -n "$VIRTUAL_ENV" ] && $(type deactivate >/dev/null 2>&1) || return

  # Do not show venv prefix if prefixes are disabled
  [[ $SPACESHIP_PREFIX_SHOW == true ]] && echo -n "%B${SPACESHIP_PREFIX_VENV}%b" || echo -n ' '

  echo -n "%{$fg_bold[blue]%}"
  echo -n "$(basename $VIRTUAL_ENV)"
  echo -n "%{$reset_color%}"
}

# Pyenv
# Show current version of pyenv python, including system.
spaceship_pyenv_status() {
  [[ $SPACESHIP_PYENV_SHOW == false ]] && return

  # Show NVM status only for Python-specific folders
  [[ -f requirements.txt || -n *.py(#qN) ]] || return

  command -v pyenv > /dev/null 2>&1 || return # Do nothing if pyenv is not installed

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

  # Do not show pyenv prefix if prefixes are disabled
  [[ $SPACESHIP_PREFIX_SHOW == true ]] && echo -n "%B${SPACESHIP_PREFIX_PYENV}%b" || echo -n ' '

  echo -n "%{$fg_bold[yellow]%}"
  echo -n "${SPACESHIP_PYENV_SYMBOL}  ${pyenv_status}"
  echo -n "%{$reset_color%}"
}

# NVM
# Show current version of node, exception system.
spaceship_nvm_status() {
  [[ $SPACESHIP_NVM_SHOW == false ]] && return

  # Show NVM status only for JS-specific folders
  [[ -f package.json || -d node_modules || -n *.js(#qN) ]] || return

  command -v nvm > /dev/null 2>&1 || return

  local nvm_status=$(nvm current 2>/dev/null)
  [[ "${nvm_status}" == "system" || "${nvm_status}" == "node" ]] && return

  # Do not show NVM prefix if prefixes are disabled
  [[ ${SPACESHIP_PREFIX_SHOW} == true ]] && echo -n "%B${SPACESHIP_PREFIX_NVM}%b" || echo -n ' '

  echo -n "%{$fg_bold[green]%}"
  echo -n "${SPACESHIP_NVM_SYMBOL} ${nvm_status}"
  echo -n "%{$reset_color%}"
}

# Ruby
# Show current version of Ruby
spaceship_ruby_version() {
  [[ $SPACESHIP_RUBY_SHOW == false ]] && return

  # Show versions only for Ruby-specific folders
  [[ -f Gemfile || -f Rakefile || -n *.rb(#qN) ]] || return

  if command -v rvm-prompt > /dev/null 2>&1; then
    ruby_version=$(rvm-prompt i v g)
  elif command -v chruby > /dev/null 2>&1; then
    ruby_version=$(chruby | sed -n -e 's/ \* //p')
  elif command -v rbenv > /dev/null 2>&1; then
    ruby_version=$(rbenv version | sed -e 's/ (set.*$//')
  else
    return
  fi

  [[ "${ruby_version}" == "system" ]] && return

  # Do not show ruby prefix if prefixes are disabled
  [[ $SPACESHIP_PREFIX_SHOW == true ]] && echo -n "%B${SPACESHIP_PREFIX_RUBY}%b" || echo -n ' '

  # Add 'v' before ruby version that starts with a number
  [[ "${ruby_version}" =~ ^[0-9].+$ ]] && ruby_version="v${ruby_version}"

  echo -n "%{$fg_bold[red]%}"
  echo -n "${SPACESHIP_RUBY_SYMBOL}  ${ruby_version}"
  echo -n "%{$reset_color%}"
}

# Swift
# Show current version of Swift
spaceship_swift_version() {
  command -v swiftenv > /dev/null 2>&1 || return

  if [[ $SPACESHIP_SWIFT_SHOW_GLOBAL == true ]] ; then
    local swift_version=$(swiftenv version | sed 's/ .*//')
  elif [[ $SPACESHIP_SWIFT_SHOW_LOCAL == true ]] ; then
    if swiftenv version | grep ".swift-version" > /dev/null; then
      local swift_version=$(swiftenv version | sed 's/ .*//')
    fi
  fi

  if [ -n "${swift_version}" ]; then
    # Do not show prefix if prefixes are disabled
    [[ ${SPACESHIP_PREFIX_SHOW} == true ]] && echo -n "%B${SPACESHIP_PREFIX_SWIFT}%b" || echo -n ' '

    echo -n "%{$fg_bold[yellow]%}"
    echo -n "${SPACESHIP_SWIFT_SYMBOL}  ${swift_version}"
    echo -n "%{$reset_color%}"
  fi
}

# Xcode
# Show current version of Xcode
spaceship_xcode_version() {
  command -v xcenv > /dev/null 2>&1 || return

  if [[ $SPACESHIP_SWIFT_SHOW_GLOBAL == true ]] ; then
    local xcode_path=$(xcenv version | sed 's/ .*//')
  elif [[ $SPACESHIP_SWIFT_SHOW_LOCAL == true ]] ; then
    if xcenv version | grep ".xcode-version" > /dev/null; then
      local xcode_path=$(xcenv version | sed 's/ .*//')
    fi
  fi

  if [ -n "${xcode_path}" ]; then
    local xcode_version_path=$xcode_path"/Contents/version.plist"
    if [ -f ${xcode_version_path} ]; then
      if command -v defaults > /dev/null 2>&1 ; then
        local xcode_version=$(defaults read ${xcode_version_path} CFBundleShortVersionString)
        # Do not show prefix if prefixes are disabled
        [[ ${SPACESHIP_PREFIX_SHOW} == true ]] && echo -n "%B${SPACESHIP_PREFIX_XCODE}%b" || echo -n ' '

        echo -n "%{$fg_bold[blue]%}"
        echo -n "${SPACESHIP_XCODE_SYMBOL}  ${xcode_version}"
        echo -n "%{$reset_color%}"
      fi
    fi
  fi
}

# Golang
# Show current version of golang
spaceship_golang_version() {
  [[ $SPACESHIP_GOLANG_SHOW == false ]] && return

  # If there are Go-specific files in current directory
  [[ -d Godeps || -f glide.yaml || -n *.go(#qN) ]] || return

  command -v go > /dev/null 2>&1 || return

  local go_version=$(go version | grep --colour=never -oE '[[:digit:]].[[:digit:]]')
  # Do not show prefix if prefixes are disabled
  [[ ${SPACESHIP_PREFIX_SHOW} == true ]] && echo -n "%B${SPACESHIP_PREFIX_GOLANG}%b" || echo -n ' '

  echo -n "%{$fg_bold[cyan]%}"
  echo -n "${SPACESHIP_GOLANG_SYMBOL}  v${go_version}"
  echo -n "%{$reset_color%}"
}

spaceship_docker_version() {
  [[ $SPACESHIP_DOCKER_SHOW == false ]] && return

  command -v docker > /dev/null 2>&1 || return
  # if docker daemon isn't running you'll get an error message saying it can't connect...
  docker info 2>&1 | grep -q "Cannot connect" && return

  local docker_version=$(docker version -f "{{.Server.Version}}")

  [[ ${SPACESHIP_PREFIX_SHOW} == true ]] && echo -n "%B${SPACESHIP_PREFIX_DOCKER}%b" || echo -n ' '

  echo -n "%{$fg_bold[cyan]%}"
  if [[ -z $DOCKER_MACHINE_NAME ]]; then
    echo -n "${SPACESHIP_DOCKER_SYMBOL}  v${docker_version}"
  else
    echo -n "${SPACESHIP_DOCKER_SYMBOL}  v${docker_version} via ($DOCKER_MACHINE_NAME)"
  fi
  echo -n "%{$reset_color%}"
}

# Show current vi_mode mode
spaceship_vi_mode() {
  if bindkey | grep "vi-quoted-insert" > /dev/null 2>&1; then # check if vi-mode enabled
    echo -n "%{$fg_bold[white]%}"

    MODE_INDICATOR="${SPACESHIP_VI_MODE_INSERT}"

    case ${KEYMAP} in
      main|viins)
      MODE_INDICATOR="${SPACESHIP_VI_MODE_INSERT}"
      ;;
      vicmd)
      MODE_INDICATOR="${SPACESHIP_VI_MODE_NORMAL}"
      ;;
    esac
    echo -n "${MODE_INDICATOR}"
    echo -n "%{$reset_color%} "
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

# Command prompt.
# Paint $PROMPT_SYMBOL in red if previous command was fail and
# paint in green if everything was OK.
spaceship_return_status() {
  echo -n "%(?.%{$fg[green]%}.%{$fg[red]%})"
  echo -n "%B${SPACESHIP_PROMPT_SYMBOL}%b "
  echo -n "%{$reset_color%}"
}

# Entry point
# Compose whole prompt from smaller parts
spaceship_prompt() {
  # Should it add a new line before the prompt?
  [[ $SPACESHIP_PROMPT_ADD_NEWLINE == true ]] && echo -n "$NEWLINE"

  # Option EXTENDED_GLOB is set locally to force filename generation on
  # argument to conditions, i.e. allow usage of explicit glob qualifier (#q).
  # See the description of filename generation in
  # http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
  setopt EXTENDED_GLOB LOCAL_OPTIONS

  # Execute all parts
  spaceship_time
  spaceship_host
  spaceship_current_dir
  spaceship_git_status
  spaceship_nvm_status
  spaceship_ruby_version
  spaceship_xcode_version
  spaceship_swift_version
  spaceship_golang_version
  spaceship_docker_version
  spaceship_venv_status
  spaceship_pyenv_status

  # Should it write prompt in two lines or not?
  # Write a space before, if it's written in single line
  [[ $SPACESHIP_PROMPT_SEPARATE_LINE == true ]] && echo -n "$NEWLINE" || echo -n ' '

  # Is vi-mode active?
  [[ $SPACESHIP_VI_MODE_SHOW == true ]] && spaceship_vi_mode

  # Prompt character
  spaceship_return_status
}

# PS2 - continuation interactive prompt
spaceship_ps2_prompt() {
  echo -n "%{$fg_bold[yellow]%}"
  echo -n "%{$SPACESHIP_PROMPT_SYMBOL%} "
  echo -n "%{$reset_color%}"
}

# Disable python virtualenv environment prompt prefix
VIRTUAL_ENV_DISABLE_PROMPT=true

# Expose Spaceship to environment variables
PROMPT='$(spaceship_prompt)'
PS2='$(spaceship_ps2_prompt)'

# LSCOLORS
export LSCOLORS="Gxfxcxdxbxegedabagacab"
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:ow=0;41:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'
# Zsh to use the same colors as ls
# Link: http://superuser.com/a/707567
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
