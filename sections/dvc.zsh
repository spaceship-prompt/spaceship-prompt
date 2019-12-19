#
# DVC
#
# DVC is a tool to version control data and models.
# Link: https://dvc.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DVC_SHOW="${SPACESHIP_DVC_SHOW=true}"
SPACESHIP_DVC_PREFIX="${SPACESHIP_DVC_PREFIX=""}"
SPACESHIP_DVC_SUFFIX="${SPACESHIP_DVC_SUFFIX=""}"
SPACESHIP_DVC_SYMBOL="${SPACESHIP_DVC_SYMBOL="%F{cyan}D%F{magenta}V%F{red}C%f "}"
SPACESHIP_DVC_COLOR="${SPACESHIP_DVC_COLOR="white"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show DVC logo when the current working directory is inside a DVC repository.
spaceship_dvc() {
  [[ $SPACESHIP_DVC_SHOW == false ]] && return

  # Show DVC section only when there's a DVC directory
  # This check relies on extended glob,
  # for reference check https://linux.die.net/man/1/zshexpn

  setopt EXTENDED_GLOB LOCAL_OPTIONS
  setopt +o nomatch

  [[ -d "$(print (../)#.dvc(:h))" ]] || return

  setopt -o nomatch

  spaceship::section \
    "$SPACESHIP_DVC_COLOR" \
    "$SPACESHIP_DVC_PREFIX" \
    "$SPACESHIP_DVC_SYMBOL" \
    "$SPACESHIP_DVC_SUFFIX"
}
