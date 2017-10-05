#
# Virtualenv
#
# virtualenv is a tool to create isolated Python environments.
# Link: https://virtualenv.pypa.io/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_VENV_SHOW="${SPACESHIP_VENV_SHOW:=true}"
SPACESHIP_VENV_PREFIX="${SPACESHIP_VENV_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_VENV_SUFFIX="${SPACESHIP_VENV_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_VENV_COLOR="${SPACESHIP_VENV_COLOR:="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

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
