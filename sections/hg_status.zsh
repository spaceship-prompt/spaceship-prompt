#
# Mercurial (hg) status
#
# Show Mercurial status

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_HG_STATUS_SHOW="${SPACESHIP_HG_STATUS_SHOW=true}"
SPACESHIP_HG_STATUS_ASYNC="${SPACESHIP_HG_STATUS_ASYNC=true}"
SPACESHIP_HG_STATUS_PREFIX="${SPACESHIP_HG_STATUS_PREFIX=" ["}"
SPACESHIP_HG_STATUS_SUFFIX="${SPACESHIP_HG_STATUS_SUFFIX="]"}"
SPACESHIP_HG_STATUS_COLOR="${SPACESHIP_HG_STATUS_COLOR="red"}"
SPACESHIP_HG_STATUS_UNTRACKED="${SPACESHIP_HG_STATUS_UNTRACKED="?"}"
SPACESHIP_HG_STATUS_ADDED="${SPACESHIP_HG_STATUS_ADDED="+"}"
SPACESHIP_HG_STATUS_MODIFIED="${SPACESHIP_HG_STATUD_MODIFIED="!"}"
SPACESHIP_HG_STATUS_DELETED="${SPACESHIP_HG_STATUS_DELETED="✘"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Check if current dir is a hg repo and show hg status as indicators
spaceship_hg_status() {
  [[ $SPACESHIP_HG_STATUS_SHOW == false ]] && return

  spaceship::is_hg || return

  local INDEX=$(hg status 2>/dev/null) hg_status=""

  # Indicators are suffixed instead of prefixed to each other to
  # provide uniform view across git and mercurial indicators
  if $(echo "$INDEX" | grep -E '^\? ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_UNTRACKED$hg_status"
  fi
  if $(echo "$INDEX" | grep -E '^A ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_ADDED$hg_status"
  fi
  if $(echo "$INDEX" | grep -E '^M ' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_MODIFIED$hg_status"
  fi
  if $(echo "$INDEX" | grep -E '^(R|!)' &> /dev/null); then
    hg_status="$SPACESHIP_HG_STATUS_DELETED$hg_status"
  fi

  if [[ -n $hg_status ]]; then
    spaceship::section \
      --color "$SPACESHIP_HG_STATUS_COLOR" \
      "$SPACESHIP_HG_STATUS_PREFIX$hg_status$SPACESHIP_HG_STATUS_SUFFIX"
  fi
}
