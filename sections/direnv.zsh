#
# Direnv
#
# direnv is a supa-dupa cool tool for making you development easier.
# Link: https://www.direnv.xyz

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DIRENV_SHOW="${SPACESHIP_DIRENV_SHOW=true}"
SPACESHIP_DIRENV_PREFIX="${SPACESHIP_DIRENV_PREFIX="with "}"
SPACESHIP_DIRENV_SUFFIX="${SPACESHIP_DIRENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DIRENV_SYMBOL="${SPACESHIP_DIRENV_SYMBOL="🌳 "}"
SPACESHIP_DIRENV_COLOR="${SPACESHIP_DIRENV_COLOR="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show direnv status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_direnv() {
  [[ $SPACESHIP_DIRENV_SHOW == false ]] && return

  # Check if direnv command is available for execution
  spaceship::exists direnv  || return


  # Use quotes around unassigned local variables to prevent
  # getting replaced by global aliases
  # http://zsh.sourceforge.net/Doc/Release/Shell-Grammar.html#Aliasing
  local 'direnv_status'
  local 'direnv_status_suffix'
  local 'direnv_info'

  # read in direnv status
  direnv_info=$( direnv status )

  # Show section only if a .envrc is found in dir or parent dir
  echo $direnv_info | grep "Found RC" &>/dev/null || return

  # Display foldername of .envrc in section
  direnv_status=$( echo $direnv_info | grep "Found RC path" | awk '{print $4}' | xargs dirname | xargs basename )

  # Display status of direnv
  if $( echo $direnv_info | command grep "Found RC allowed false" &>/dev/null ); then
    direnv_status="$direnv_status [✘]"
  elif $( echo $direnv_info | command grep "Loaded RC" &>/dev/null ); then
    direnv_status="$direnv_status"
  else
    direnv_status="$direnv_status [!]"
  fi

  # Exit section if variable is empty
  [[ -z $direnv_status ]] && return

  # Display foobar section
  spaceship::section \
    "$SPACESHIP_DIRENV_COLOR" \
    "$SPACESHIP_DIRENV_PREFIX" \
    "$SPACESHIP_DIRENV_SYMBOL$direnv_status" \
    "$SPACESHIP_DIRENV_SUFFIX"
}