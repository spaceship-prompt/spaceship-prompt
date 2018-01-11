#
# Conda
#
# Package, dependency and environment management for any language
# Link: https://conda.io/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_CONDA_SHOW="${SPACESHIP_CONDA_SHOW=true}"
SPACESHIP_CONDA_PREFIX="${SPACESHIP_CONDA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_CONDA_SUFFIX="${SPACESHIP_CONDA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_CONDA_SYMBOL="${SPACESHIP_CONDA_SYMBOL="🅒 "}"
SPACESHIP_CONDA_COLOR="${SPACESHIP_CONDA_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current conda virtual environment
spaceship_conda() {
  [[ $SPACESHIP_CONDA_SHOW == false ]] && return

  # Check if running via conda virtualenv
  spaceship::exists conda && [ -n "$CONDA_DEFAULT_ENV" ] || return

  spaceship::section \
    "$SPACESHIP_CONDA_COLOR" \
    "$SPACESHIP_CONDA_PREFIX" \
    "${SPACESHIP_CONDA_SYMBOL}${CONDA_DEFAULT_ENV}" \
    "$SPACESHIP_CONDA_SUFFIX"
}
