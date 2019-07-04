#
# Spaceship ZSH
#
# Author: Denys Dovhan, denysdovhan.com
# License: MIT
# https://github.com/denysdovhan/spaceship-prompt

# Current version of Spaceship
# Useful for issue reporting
readonly SPACESHIP_VERSION='3.8.0'

typeset -gAH __SS_DATA

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
    julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    venv          # virtualenv section
    conda         # conda virtualenv section
    dotnet        # .NET section
    ember         # Ember.js section
    kubecontext   # Kubectl context section
    terraform     # Terraform workspace section
    exec_time     # Execution time
    line_sep      # Line break
    battery       # Battery level and status
    vi_mode       # Vi-mode indicator
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

# PROMPT
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

# load hooks
source "$SPACESHIP_ROOT/lib/hooks.zsh"

# load section utils
source "$SPACESHIP_ROOT/lib/section.zsh"

# load environment detection
source "$SPACESHIP_ROOT/scripts/info.sh"

# ------------------------------------------------------------------------------
# SECTIONS
# Sourcing sections the prompt consists of
# ------------------------------------------------------------------------------

# TODO: use placeholder for async section
SPACESHIP_SECTION_PLACEHOLDER=""

# TODO: complete custom section file support with tag "::custom"
SPACESHIP_CUSTOM_SECTION_LOCATION="${SPACESHIP_CUSTOM_SECTION_LOCATION=$HOME/.config/spaceship/sections}"

spaceship::load_sections() {
  local section raw_section
  local load_async=false
  for alignment in "prompt" "rprompt"; do
    local sections_var="SPACESHIP_${(U)alignment}_ORDER"
    for raw_section in ${(P)sections_var}; do
      local -a section_meta
      # Split by double-colon
      section_meta=(${(s.::.)raw_section})
      # First value is always section name
      section=${section_meta[1]}

      # Cache configured sections! As nested arrays are not really possible,
      # store as single string, separated by whitespace.
      __SS_DATA[${alignment}_sections]+="${section} "

      # Cache sections
      for tag in ${section_meta[2,-1]}; do
        __SS_DATA[${tag}_sections]+="${section} "

        # Special Case: Remember that async lib should be loaded
        [[ "$tag" == "async" ]] && load_async=true
      done

      if [[ -f "$SPACESHIP_ROOT/sections/$section.zsh" ]]; then
        source "$SPACESHIP_ROOT/sections/$section.zsh"
      elif spaceship::defined "spaceship_$section"; then
        # Custom section is declared, nothing else to do
        continue
      elif [[ -f "${SPACESHIP_CUSTOM_SECTION_LOCATION}/${section}.zsh" ]]; then
        # Load custom section from a file
        source "${SPACESHIP_CUSTOM_SECTION_LOCATION}/${section}.zsh"
      else
        # file not found!
        # If this happens, we remove the section from the configured elements,
        # so that we avoid printing errors over and over.
        print -P "%F{yellow}Warning!%f The '%F{cyan}${section}%f' section was not found. Removing it from the prompt."
        SPACESHIP_PROMPT_ORDER=("${(@)SPACESHIP_PROMPT_ORDER:#${section}}")
        SPACESHIP_RPROMPT_ORDER=("${(@)SPACESHIP_RPROMPT_ORDER:#${section}}")
      fi
    done
  done

  # Load Async libs at last, because before initializing
  # ZSH-Async, all functions must be defined.
  if ${load_async}; then
    __SS_DATA[async]=true
    # TODO: ZSH-ASYNC Path configurable!
    # Avoid duplicate laoding of zsh-async by checking flag ASYNC_INIT_DONE
    (( ASYNC_INIT_DONE )) || source "${SPACESHIP_ROOT}/modules/zsh-async/async.zsh"
  fi
}
spaceship::load_sections

# ------------------------------------------------------------------------------
# BACKWARD COMPATIBILITY WARNINGS
# Show deprecation messages for options that are set, but not supported
# ------------------------------------------------------------------------------

spaceship::deprecated SPACESHIP_PROMPT_SYMBOL "Use %BSPACESHIP_CHAR_SYMBOL%b instead."
spaceship::deprecated SPACESHIP_BATTERY_ALWAYS_SHOW "Use %BSPACESHIP_BATTERY_SHOW='always'%b instead."
spaceship::deprecated SPACESHIP_BATTERY_CHARGING_SYMBOL "Use %BSPACESHIP_BATTERY_SYMBOL_CHARGING%b instead."
spaceship::deprecated SPACESHIP_BATTERY_DISCHARGING_SYMBOL "Use %BSPACESHIP_BATTERY_SYMBOL_DISCHARGING%b instead."
spaceship::deprecated SPACESHIP_BATTERY_FULL_SYMBOL "Use %BSPACESHIP_BATTERY_SYMBOL_FULL%b instead."

# pyenv to python deprecation
spaceship::deprecated SPACESHIP_PYENV_SHOW "Use %BSPACESHIP_PYTHON_SHOW%b instead"
spaceship::deprecated SPACESHIP_PYENV_PREFIX "Use %BSPACESHIP_PYTHON_PREFIX%b instead"
spaceship::deprecated SPACESHIP_PYENV_SUFFIX "Use %BSPACESHIP_PYTHON_SUFFIX%b instead"
spaceship::deprecated SPACESHIP_PYENV_SYMBOL "Use %BSPACESHIP_PYTHON_SYMBOL%b instead"
spaceship::deprecated SPACESHIP_PYENV_COLOR "Use %bSPACESHIP_PYTHON_COLOR%b instead"

# ------------------------------------------------------------------------------
# ENTRY POINT
# An entry point of prompt
# ------------------------------------------------------------------------------

# Pass all arguments to the spaceship_setup function
prompt_spaceship_setup "$@"
