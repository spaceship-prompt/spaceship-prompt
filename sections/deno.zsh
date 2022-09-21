#
# Deno
#
# Deno is secure runtime for JavaScript and TypeScript.
# Link: https://deno.land/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DENO_SHOW="${SPACESHIP_DENO_SHOW=true}"
SPACESHIP_DENO_ASYNC="${SPACESHIP_DENO_ASYNC=true}"
SPACESHIP_DENO_PREFIX="${SPACESHIP_DENO_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_DENO_SUFFIX="${SPACESHIP_DENO_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DENO_SYMBOL="${SPACESHIP_DENO_SYMBOL="🦕 "}"
SPACESHIP_DENO_DEFAULT_VERSION="${SPACESHIP_DENO_DEFAULT_VERSION=""}"
SPACESHIP_DENO_COLOR="${SPACESHIP_DENO_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Deno
spaceship_deno() {
  [[ $SPACESHIP_DENO_SHOW == false ]] && return

  # Return when deno is not installed
  spaceship::exists deno || return

  # Show Deno status only for Deno-specific folders
  local is_deno_project="$(spaceship::upsearch deno.json deno.jsonc)"
  [[ -n "$is_deno_project" || -n {mod,dep,main,cli}.ts(#qN^/) ]] || return

  local deno_version=$(deno --version 2>/dev/null | head -1 | cut -d' ' -f2)

  [[ "$deno_version" == "$SPACESHIP_DENO_DEFAULT_VERSION" ]] && return

  spaceship::section \
    --color "$SPACESHIP_DENO_COLOR" \
    --prefix "$SPACESHIP_DENO_PREFIX" \
    --suffix "$SPACESHIP_DENO_SUFFIX" \
    --symbol "$SPACESHIP_DENO_SYMBOL" \
    "v$deno_version"
}
