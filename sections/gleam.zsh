#
# Gleam
#
# Gleam is a friendly language for building type-safe systems that scale!
# Link: https://gleam.run/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GLEAM_SHOW="${SPACESHIP_GLEAM_SHOW=true}"
SPACESHIP_GLEAM_ASYNC="${SPACESHIP_GLEAM_ASYNC=true}"
SPACESHIP_GLEAM_PREFIX="${SPACESHIP_GLEAM_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_GLEAM_SUFFIX="${SPACESHIP_GLEAM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GLEAM_SYMBOL="${SPACESHIP_GLEAM_SYMBOL="⭐ "}"
SPACESHIP_GLEAM_COLOR="${SPACESHIP_GLEAM_COLOR="#ff8cff"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Gleam
spaceship_gleam() {
  [[ $SPACESHIP_GLEAM_SHOW == false ]] && return

  # Return when gleam is not installed
  spaceship::exists gleam || return

  # Show Gleam status only for Gleam-specific folders
  local is_gleam_project="$(spaceship::upsearch gleam.toml manifest.toml)"
  [[ -n "$is_gleam_project" || -n *.gleam(#qN^/) ]] || return

  local gleam_version="$(gleam --version 2>/dev/null | awk '{print $2}')"

  [[ $gleam_version == "system" ]] && return

  spaceship::section::v4 \
    --color "$SPACESHIP_GLEAM_COLOR" \
    --prefix "$SPACESHIP_GLEAM_PREFIX" \
    --suffix "$SPACESHIP_GLEAM_SUFFIX" \
    --symbol "$SPACESHIP_GLEAM_SYMBOL" \
    "v$gleam_version"
}
