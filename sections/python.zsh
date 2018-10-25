#
# python
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_PYTHON_SHOW="${SPACESHIP_PYTHON_SHOW=true}"
SPACESHIP_PYTHON_PREFIX="${SPACESHIP_PYTHON_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_PYTHON_SUFFIX="${SPACESHIP_PYTHON_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PYTHON_SYMBOL="${SPACESHIP_PYTHON_SYMBOL="🐍 "}"
SPACESHIP_PYTHON_COLOR="${SPACESHIP_PYTHON_COLOR="220"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Python, including system.
spaceship_python() {
  [[ $SPACESHIP_PYTHON_SHOW == false ]] && return

  # Show python python version only for Python-specific folders
  [[ -f requirements.txt ]] || [[ -f Pipfile ]] || [[ -n *.py(#qN^/) ]] || return

  spaceship::exists python || return # Do nothing if python is not installed

  # Get current Python version
  local python_status=$(python -V | awk '{print $2}')

  spaceship::section \
    "$SPACESHIP_PYTHON_COLOR" \
    "$SPACESHIP_PYTHON_PREFIX" \
    "${SPACESHIP_PYTHON_SYMBOL}${python_status}" \
    "$SPACESHIP_PYTHON_SUFFIX"
}
