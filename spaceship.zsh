#
# Spaceship ZSH
#
# Author: Denys Dovhan, denysdovhan.com
# License: MIT
# https://github.com/spaceship-prompt/spaceship-prompt

# Current version of Spaceship
# Useful for issue reporting
export SPACESHIP_VERSION='3.16.5'

# Newline with zero-width space,
# because last newline is trimmed in command expansion.
# See: https://unix.stackexchange.com/a/248229
local NEWLINE=$'\n'

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
    python        # Python section
    elm           # Elm section
    elixir        # Elixir section
    xcode         # Xcode section
    swift         # Swift section
    golang        # Go section
    php           # PHP section
    rust          # Rust section
    haskell       # Haskell Stack section
    java          # Java section
    julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    gcloud        # Google Cloud Platform section
    venv          # virtualenv section
    conda         # conda virtualenv section
    dotnet        # .NET section
    kubectl       # Kubectl context section
    terraform     # Terraform workspace section
    ibmcloud      # IBM Cloud section
    exec_time     # Execution time
    async         # Async jobs indicator
    line_sep      # Line break
    battery       # Battery level and status
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
  )
fi

if [ -z "$SPACESHIP_RPROMPT_ORDER" ]; then
  SPACESHIP_RPROMPT_ORDER=(
    # empty by default
  )
fi

# PROMPT OPTIONS
SPACESHIP_PROMPT_ASYNC="${SPACESHIP_PROMPT_ASYNC=true}"
SPACESHIP_PROMPT_ADD_NEWLINE="${SPACESHIP_PROMPT_ADD_NEWLINE=true}"
SPACESHIP_PROMPT_SEPARATE_LINE="${SPACESHIP_PROMPT_SEPARATE_LINE=true}"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="${SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false}"
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

# Load cache
source "$SPACESHIP_ROOT/lib/cache.zsh"

# Load hooks
source "$SPACESHIP_ROOT/lib/hooks.zsh"

# Load section utils
source "$SPACESHIP_ROOT/lib/section.zsh"

# Load prompt renderer
source "$SPACESHIP_ROOT/lib/renderer.zsh"

# Load functions for composing prompts
source "$SPACESHIP_ROOT/lib/prompts.zsh"

# Load command line interface
source "$SPACESHIP_ROOT/lib/cli.zsh"

# Load testkit
source "$SPACESHIP_ROOT/lib/testkit.zsh"

# ------------------------------------------------------------------------------
# BACKWARD COMPATIBILITY WARNINGS
# Show deprecation messages for options that are set, but not supported
# ------------------------------------------------------------------------------

# pyenv to python deprecation warnings
spaceship::deprecated SPACESHIP_PYENV_SHOW "Use %BSPACESHIP_PYTHON_SHOW%b instead"
spaceship::deprecated SPACESHIP_PYENV_PREFIX "Use %BSPACESHIP_PYTHON_PREFIX%b instead"
spaceship::deprecated SPACESHIP_PYENV_SUFFIX "Use %BSPACESHIP_PYTHON_SUFFIX%b instead"
spaceship::deprecated SPACESHIP_PYENV_SYMBOL "Use %BSPACESHIP_PYTHON_SYMBOL%b instead"
spaceship::deprecated SPACESHIP_PYENV_COLOR "Use %bSPACESHIP_PYTHON_COLOR%b instead"
# kubectl_context warnings
spaceship::deprecated SPACESHIP_KUBECONTEXT_SHOW "Use %BSPACESHIP_KUBECTL_CONTEXT_SHOW%b instead"
spaceship::deprecated SPACESHIP_KUBECONTEXT_PREFIX "Use %BSPACESHIP_KUBECTL_CONTEXT_PREFIX%b instead"
spaceship::deprecated SPACESHIP_KUBECONTEXT_SUFFIX "Use %BSPACESHIP_KUBECTL_CONTEXT_SUFFIX%b instead"
spaceship::deprecated SPACESHIP_KUBECONTEXT_COLOR "Use %BSPACESHIP_KUBECTL_CONTEXT_COLOR%b instead"
spaceship::deprecated SPACESHIP_KUBECONTEXT_NAMESPACE_SHOW "Use %BSPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE%b instead"
spaceship::deprecated SPACESHIP_KUBECONTEXT_COLOR_GROUPS "Use %BSPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS%b instead"

spaceship::deprecated SPACESHIP_VI_MODE_SHOW "vi-mode is now an external section: github.com/spaceship-prompt/spaceship-vi-mode"
spaceship::deprecated SPACESHIP_VI_MODE_PREFIX "vi-mode is now an external section: github.com/spaceship-prompt/spaceship-vi-mode"
spaceship::deprecated SPACESHIP_VI_MODE_SUFFIX "vi-mode is now an external section: github.com/spaceship-prompt/spaceship-vi-mode"
spaceship::deprecated SPACESHIP_VI_MODE_INSERT "vi-mode is now an external section: github.com/spaceship-prompt/spaceship-vi-mode"
spaceship::deprecated SPACESHIP_VI_MODE_NORMAL "vi-mode is now an external section: github.com/spaceship-prompt/spaceship-vi-mode"
spaceship::deprecated SPACESHIP_VI_MODE_COLOR "vi-mode is now an external section: github.com/spaceship-prompt/spaceship-vi-mode"

# ------------------------------------------------------------------------------
# SETUP
# Setup requirements for prompt
# ------------------------------------------------------------------------------

# Runs once when user opens a terminal
# All preparation before drawing prompt should be done here
prompt_spaceship_setup() {
  autoload -Uz vcs_info
  autoload -Uz add-zsh-hook
  autoload -Uz add-zsh-hook
  autoload -Uz is-at-least

  if ! is-at-least 5.2; then
    print -P "%Bspaceship-prompt%b requires at least %Bzsh v5.2%b (you have %Bv$ZSH_VERSION%b)."
    print -P "Please upgrade your zsh installation."
  fi

  # This variable is a magic variable used when loading themes with zsh's prompt
  # function. It will ensure the proper prompt options are set.
  prompt_opts=(cr percent sp subst)

  # Borrowed from promptinit, sets the prompt options in case the prompt was not
  # initialized via promptinit.
  setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"

  # Initialize builtin functions
  zmodload zsh/datetime
  zmodload zsh/mathfunc

  # Add hooks
  add-zsh-hook preexec prompt_spaceship_preexec
  add-zsh-hook precmd prompt_spaceship_precmd
  add-zsh-hook chpwd prompt_spaceship_chpwd

  # Disable python virtualenv environment prompt prefix
  VIRTUAL_ENV_DISABLE_PROMPT=true

  # Configure vcs_info helper for potential use in the future
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats '%b'

  # Load sections before rendering
  spaceship::load_sections
}

# ------------------------------------------------------------------------------
# ENTRY POINT
# An entry point of prompt
# ------------------------------------------------------------------------------

# Pass all arguments to the spaceship_setup function
prompt_spaceship_setup "$@"
