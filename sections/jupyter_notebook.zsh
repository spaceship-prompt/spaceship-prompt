#
# Jupyter Notebook
#
# The Jupyter Notebook is the original web application for creating
# and sharing computational documents. It offers a simple, streamlined,
# document-centric experience.
# Link: https://jupyter.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_JUPYTER_SHOW="${SPACESHIP_JUPYTER_SHOW=true}"
SPACESHIP_JUPYTER_PREFIX="${SPACESHIP_JUPYTER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_JUPYTER_SUFFIX="${SPACESHIP_JUPYTER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_JUPYTER_SYMBOL="${SPACESHIP_JUPYTER_SYMBOL="🌍 "}"
SPACESHIP_JUPYTER_COLOR="${SPACESHIP_JUPYTER_COLOR="178"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show the Jupyter Notebook symbol
spaceship_jupyter() {
  [[ $SPACESHIP_JUPYTER_SHOW == false ]] && return

  [[ -f *.ipynb ]] || return

  spaceship::section \
    "$SPACESHIP_JUPYTER_COLOR" \
    "$SPACESHIP_JUPYTER_PREFIX" \
    "${SPACESHIP_JUPYTER_SYMBOL}Jupyter" \
    "$SPACESHIP_JUPYTER_SUFFIX"
}
