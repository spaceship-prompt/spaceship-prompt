#
# Spaceship ZSH Theme
#
# Author: Denys Dovhan, denysdovhan.com
# License: MIT
# https://github.com/denysdovhan/spaceship-zsh-theme

# Current version of Spaceship
# Useful for issue reporting
export SPACESHIP_VERSION='2.10.0'

# Common-used variable for new line separator
NEWLINE='
'

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

# ------------------------------------------------------------------------------
# CONFIGURATION
# The default configuration that can be overridden in .zshrc
# ------------------------------------------------------------------------------

# ORDER
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

if [ -z "$SPACESHIP_EXTERNAL_FUNCTIONS" ]; then
  SPACESHIP_EXTERNAL_FUNCTIONS=(
    # empty by default
  )
fi

# PROMPT
SPACESHIP_PROMPT_ADD_NEWLINE="${SPACESHIP_PROMPT_ADD_NEWLINE:=true}"
SPACESHIP_PROMPT_SEPARATE_LINE="${SPACESHIP_PROMPT_SEPARATE_LINE:=true}"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="${SPACESHIP_PROMPT_FIRST_PREFIX:=false}"
SPACESHIP_PROMPT_PREFIXES_SHOW="${SPACESHIP_PROMPT_PREFIXES_SHOW:=true}"
SPACESHIP_PROMPT_SUFFIXES_SHOW="${SPACESHIP_PROMPT_SUFFIXES_SHOW:=true}"
SPACESHIP_PROMPT_DEFAULT_PREFIX="${SPACESHIP_PROMPT_DEFAULT_PREFIX:="via "}"
SPACESHIP_PROMPT_DEFAULT_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX:=" "}"

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

for section in $(spaceship::union $SPACESHIP_PROMPT_ORDER $SPACESHIP_RPROMPT_ORDER); do
  if [[ -f "$SPACESHIP_ROOT/sections/$section.zsh" ]]; then
    source "$SPACESHIP_ROOT/sections/$section.zsh"
  elif [[ -z "${SPACESHIP_EXTERNAL_FUNCTIONS[(r)$section]}" ]]; then
    echo "Section '$section' not found or not an external function"
  fi
done

# ------------------------------------------------------------------------------
# BACKWARD COMPATIBILITY WARNINGS
# Show deprecation messages for options that are set, but not supported
# ------------------------------------------------------------------------------

spaceship::deprecated SPACESHIP_PROMPT_SYMBOL SPACESHIP_CHAR_SYMBOL
# SPACESHIP_HOST_SHOW accepts 'always'
# SPACESHIP_USER_SHOW accepts 'always'
# SPACESHIP_HOST_SHOW is disabled by default
# SPACESHIP_HOST_COLOR is blue now
# SPACESHIP_HOST_COLOR_SSH new option
# SPACESHIP_PROMPT_ORDER has been changed
# SPACESHIP_BATTERY_ALWAYS_SHOW is removed, use 'always'

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
  # Must be captured before any other command in prompt is executed
  # Must be the very first line in all entry prompt functions, or the value
  # will be overridden by a different command execution - do not move this line!
  RETVAL=$?

  spaceship::compose_prompt $SPACESHIP_RPROMPT_ORDER
}

# PS2
# Continuation interactive prompt
# @TODO: Probably have to be a separate section. For disussion.
spaceship_ps2() {
  # Retrieve exit code of last command to use in exit_code
  # Must be captured before any other command in prompt is executed
  # Must be the very first line in all entry prompt functions, or the value
  # will be overridden by a different command execution - do not move this line!
  RETVAL=$?

  spaceship::section "$SPACESHIP_CHAR_SECONDARY_COLOR" $SPACESHIP_CHAR_SYMBOL
}

# ------------------------------------------------------------------------------
# SETUP
# Setup requirements for prompt
# ------------------------------------------------------------------------------

# Runs once when user opens a terminal
# All preparation before drawing prompt should be done here
prompt_spaceship_setup() {
  autoload -Uz add-zsh-hook

  # Add exec_time hooks
  add-zsh-hook preexec spaceship_exec_time_preexec_hook
  add-zsh-hook precmd spaceship_exec_time_precmd_hook

  # Disable python virtualenv environment prompt prefix
  VIRTUAL_ENV_DISABLE_PROMPT=true

  # Expose Spaceship to environment variables
  PROMPT='$(spaceship_prompt)'
  PS2='$(spaceship_ps2)'
  RPS1='$(spaceship_rprompt)'

  # LSCOLORS
  # Online editor: https://geoff.greer.fm/lscolors/
  export LSCOLORS="Gxfxcxdxbxegedabagacab"
  export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:ow=0;41:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'
  # Zsh to use the same colors as ls
  # Link: http://superuser.com/a/707567
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
}

# ------------------------------------------------------------------------------
# ENTRY POINT
# An entry point of prompt
# ------------------------------------------------------------------------------

# Pass all arguments to the spaceship_setup function
prompt_spaceship_setup "$@"
