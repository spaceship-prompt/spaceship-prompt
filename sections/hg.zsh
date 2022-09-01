#
# Mercurial (hg)
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_HG_SHOW="${SPACESHIP_HG_SHOW=true}"
SPACESHIP_HG_ASYNC="${SPACESHIP_HG_ASYNC=true}"
SPACESHIP_HG_PREFIX="${SPACESHIP_HG_PREFIX="on "}"
SPACESHIP_HG_SUFFIX="${SPACESHIP_HG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HG_SYMBOL="${SPACESHIP_HG_SYMBOL="☿ "}"

if [ -z "$SPACESHIP_HG_ORDER" ]; then
  SPACESHIP_HG_ORDER=(hg_branch hg_status)
fi

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/hg_branch.zsh"
source "$SPACESHIP_ROOT/sections/hg_status.zsh"

spaceship::precompile "$SPACESHIP_ROOT/sections/hg_branch.zsh"
spaceship::precompile "$SPACESHIP_ROOT/sections/hg_status.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show both hg branch and hg status:
#   spaceship_hg_branch
#   spaceship_hg_status
spaceship_hg() {
  [[ $SPACESHIP_HG_SHOW == false ]] && return

  for subsection in "${SPACESHIP_HG_ORDER[@]}"; do
    spaceship::core::refresh_section --sync "$subsection"
  done

  # Quit if no hg ref is found
  local hg_branch="$(spaceship::cache::get hg_branch)"
  [[ -z $hg_branch ]] && return

  local hg_data="$(spaceship::core::compose_order $SPACESHIP_HG_ORDER)"

  spaceship::section \
    --color 'white' \
    --prefix "$SPACESHIP_HG_PREFIX" \
    --suffix "$SPACESHIP_HG_SUFFIX" \
    "$hg_data"
}
