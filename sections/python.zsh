#
# Python
#
# Python is an interpreted high-level programming language
# Link: https://python.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_PYTHON_SHOW="${SPACESHIP_PYTHON_SHOW=true}"
SPACESHIP_PYTHON_ASYNC="${SPACESHIP_PYTHON_ASYNC=true}"
SPACESHIP_PYTHON_PREFIX="${SPACESHIP_PYTHON_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_PYTHON_SUFFIX="${SPACESHIP_PYTHON_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PYTHON_SYMBOL="${SPACESHIP_PYTHON_SYMBOL="🐍 "}"
SPACESHIP_PYTHON_COLOR="${SPACESHIP_PYTHON_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Python
spaceship_python() {
  [[ $SPACESHIP_PYTHON_SHOW == false ]] && return

  # Show python version only in directories with relevant files
  local is_python_project="$(spaceship::upsearch requirements.txt Pipfile pyproject.toml)"
  [[ -n "$is_python_project" || -n *.py(#qN^/) ]] || return

  local py_version

  if  [[ -n "$VIRTUAL_ENV" ]] || [[ $SPACESHIP_PYTHON_SHOW == always ]]; then
    py_version=${(@)$(python -V 2>&1)[2]}
  fi

  [[ -z $py_version ]] && return

  spaceship::section \
    --color "$SPACESHIP_PYTHON_COLOR" \
    --prefix "$SPACESHIP_PYTHON_PREFIX" \
    --suffix "$SPACESHIP_PYTHON_SUFFIX" \
    --symbol "$SPACESHIP_PYTHON_SYMBOL" \
    "$py_version"
}
