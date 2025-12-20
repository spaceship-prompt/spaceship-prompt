#
# uv
# uv is a Python package and project manager
# Link: docs.astral.sh/uv

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_UV_SHOW="${SPACESHIP_UV_SHOW=true}"
SPACESHIP_UV_ASYNC="${SPACESHIP_UV_ASYNC=true}"
SPACESHIP_UV_PREFIX="${SPACESHIP_UV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_UV_SUFFIX="${SPACESHIP_UV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_UV_SYMBOL="${SPACESHIP_UV_SYMBOL="uv "}"
SPACESHIP_UV_COLOR="${SPACESHIP_UV_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Python
spaceship_uv() {
  [[ $SPACESHIP_UV_SHOW == false ]] && return

  [[ -n $VIRTUAL_ENV ]] && return

  # Show python version only in directories with relevant files
  local is_python_project="$(spaceship::upsearch uv.lock)"

  [[ -n "$is_python_project" ]] || return

  local venv=$is_python_project:h/.venv

  if [[ -d $venv ]]; then
    py_version=${(@)$($venv/bin/python -V 2>&1)[2]}
  fi

  [[ -z $py_version ]] && return

  spaceship::section \
    --color "$SPACESHIP_UV_COLOR" \
    --prefix "$SPACESHIP_UV_PREFIX" \
    --suffix "$SPACESHIP_UV_SUFFIX" \
    --symbol "$SPACESHIP_UV_SYMBOL" \
    "$py_version"
}
