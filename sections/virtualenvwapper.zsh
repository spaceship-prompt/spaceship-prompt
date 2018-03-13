#
# virtualenvwapper
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_VIRTUALENVWAPPER_SHOW="${SPACESHIP_VIRTUALENVWAPPER_SHOW=true}"
SPACESHIP_VIRTUALENVWAPPER_PREFIX="${SPACESHIP_VIRTUALENVWAPPER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_VIRTUALENVWAPPER_SUFFIX="${SPACESHIP_VIRTUALENVWAPPER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_VIRTUALENVWAPPER_SYMBOL="${SPACESHIP_VIRTUALENVWAPPER_SYMBOL="🐍 "}"
SPACESHIP_VIRTUALENVWAPPER_COLOR="${SPACESHIP_VIRTUALENVWAPPER_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of virtualenvwapper Python, including system.
spaceship_virtualenvwapper() {
  [[ $SPACESHIP_VIRTUALENVWAPPER_SHOW == false ]] && return

  # Show virtualenvwapper python version only for Python-specific folders
  [[ -f requirements.txt ]] || [[ -n *.py(#qN^/) ]] || return

  spaceship::exists workon || return # Do nothing if virtualenvwapper is not installed

  local virtualenvwapper_status=${$( python -c 'import sys; print(sys.version.split()[0].strip())' )//:/ }

  spaceship::section \
    "$SPACESHIP_VIRTUALENVWAPPER_COLOR" \
    "$SPACESHIP_VIRTUALENVWAPPER_PREFIX" \
    "${SPACESHIP_VIRTUALENVWAPPER_SYMBOL}${virtualenvwapper_status}" \
    "$SPACESHIP_VIRTUALENVWAPPER_SUFFIX"
}
