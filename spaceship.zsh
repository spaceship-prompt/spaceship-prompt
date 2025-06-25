#!/usr/bin/env zsh
#
# Spaceship ZSH
#
# Author: Denys Dovhan, denysdovhan.com
# License: MIT
# https://github.com/spaceship-prompt/spaceship-prompt

# Current version of Spaceship
# Useful for issue reporting
export SPACESHIP_VERSION='4.19.0'

# Set SPACESHIP_ROOT if it isn't defined yet or if the directory does
# not exist anymore (e.g. after an update to a newer version)
# See https://github.com/spaceship-prompt/spaceship-prompt/pull/1280
if [[ -z "$SPACESHIP_ROOT" || ! -d "$SPACESHIP_ROOT" ]]; then
  # Determination of Spaceship working directory
  # https://git.io/vdBH7
  if [[ "${(%):-%N}" == '(eval)' ]]; then
    if [[ "$0" == '-antigen-load' ]] && [[ -r "${PWD}/spaceship.zsh" ]]; then
      # Antigen uses eval to load things so it can change the plugin (!!)
      # https://github.com/zsh-users/antigen/issues/581
      export -r SPACESHIP_ROOT="$PWD"
    else
      print -P "%F{red}You must set SPACESHIP_ROOT to work from within an (eval).%f"
      return 1
    fi
  else
    # Get the path to file this code is executing in; then
    # get the absolute path and strip the filename.
    # See https://stackoverflow.com/a/28336473/108857
    export -r SPACESHIP_ROOT="${${(%):-%x}:A:h}"
  fi
fi

# ------------------------------------------------------------------------------
# CONFIGURATION
# The default configuration that can be overridden in .zshrc
# ------------------------------------------------------------------------------

if [ -z "$SPACESHIP_PROMPT_ORDER" ]; then
  SPACESHIP_PROMPT_ORDER=(
    time           # Time stamps section
    user           # Username section
    dir            # Current directory section
    host           # Hostname section
    git            # Git section (git_branch + git_status + [git_commit](default off))
    hg             # Mercurial section (hg_branch  + hg_status)
    package        # Package version
    node           # Node.js section
    bun            # Bun section
    deno           # Deno section
    ruby           # Ruby section
    python         # Python section
    red            # Red section
    elm            # Elm section
    elixir         # Elixir section
    xcode          # Xcode section
    xcenv          # xcenv section
    swift          # Swift section
    swiftenv       # swiftenv section
    golang         # Go section
    perl           # Perl section
    php            # PHP section
    rust           # Rust section
    haskell        # Haskell Stack section
    scala          # Scala section
    kotlin         # Kotlin section
    java           # Java section
    lua            # Lua section
    dart           # Dart section
    julia          # Julia section
    crystal        # Crystal section
    docker         # Docker section
    docker_compose # Docker section
    aws            # Amazon Web Services section
    gcloud         # Google Cloud Platform section
    azure          # Azure section
    venv           # virtualenv section
    conda          # conda virtualenv section
    uv             # uv virtualenv section
    dotnet         # .NET section
    ocaml          # OCaml section
    vlang          # V section
    zig            # Zig section
    purescript     # PureScript section
    erlang         # Erlang section
    gleam          # Gleam section
    kubectl        # Kubectl context section
    ansible        # Ansible section
    terraform      # Terraform workspace section
    pulumi         # Pulumi stack section
    ibmcloud       # IBM Cloud section
    nix_shell      # Nix shell
    gnu_screen     # GNU Screen section
    exec_time      # Execution time
    async          # Async jobs indicator
    line_sep       # Line break
    battery        # Battery level and status
    jobs           # Background jobs indicator
    exit_code      # Exit code section
    sudo           # Sudo indicator
    char           # Prompt character
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
SPACESHIP_RPROMPT_FIRST_PREFIX_SHOW="${SPACESHIP_RPROMPT_FIRST_PREFIX_SHOW=false}"
SPACESHIP_PROMPT_PREFIXES_SHOW="${SPACESHIP_PROMPT_PREFIXES_SHOW=true}"
SPACESHIP_PROMPT_SUFFIXES_SHOW="${SPACESHIP_PROMPT_SUFFIXES_SHOW=true}"
SPACESHIP_PROMPT_DEFAULT_PREFIX="${SPACESHIP_PROMPT_DEFAULT_PREFIX="via "}"
SPACESHIP_PROMPT_DEFAULT_SUFFIX="${SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "}"

# ------------------------------------------------------------------------------
# LIBS
# Spaceship utils/hooks/etc
# ------------------------------------------------------------------------------

SPACESHIP_LIBS=(
  "lib/utils.zsh"   # General porpuse utils
  "lib/extract.zsh" # Data extraction utils
  "lib/cache.zsh"   # Cache utils
  "lib/worker.zsh"  # Async worker
  "lib/hooks.zsh"   # Zsh hooks
  "lib/section.zsh" # Section utils
  "lib/core.zsh"    # Core functions for loading and rendering
  "lib/prompts.zsh" # Composing prompt variables
  "lib/cli.zsh"     # CLI interface
  "lib/config.zsh"  # Loading Spaceship configuration file
  "lib/testkit.zsh" # Testing utils
)

# Load and precompile internals
for lib in "${SPACESHIP_LIBS[@]}"; do
  builtin source "$SPACESHIP_ROOT/$lib"
  spaceship::precompile "$SPACESHIP_ROOT/$lib"
done

# Load and precompile this file
spaceship::precompile "$SPACESHIP_ROOT/$0"

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
  spaceship::core::load_sections
}

# ------------------------------------------------------------------------------
# ENTRY POINT
# An entry point of prompt
# ------------------------------------------------------------------------------

# Pass all arguments to the spaceship_setup function
prompt_spaceship_setup "$@"
