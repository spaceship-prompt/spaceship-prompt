#
# Zig
#
# Zig is a general-purpose programming language and toolchain for maintaining robust, optimal and reusable software.
# Link: https://www.ziglang.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ZIG_SHOW="${SPACESHIP_ZIG_SHOW=true}"
SPACESHIP_ZIG_ASYNC="${SPACESHIP_ZIG_ASYNC=true}"
SPACESHIP_ZIG_PREFIX="${SPACESHIP_ZIG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_ZIG_SUFFIX="${SPACESHIP_ZIG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ZIG_SYMBOL="${SPACESHIP_ZIG_SYMBOL="⚡ "}"
SPACESHIP_ZIG_COLOR="${SPACESHIP_ZIG_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_zig() {
  # If SPACESHIP_ZIG_SHOW is false, don't show zig section
  [[ $SPACESHIP_ZIG_SHOW == false ]] && return

  # Check if zig command is available for execution
  spaceship::exists zig || return

  # Show zig section only when there are zig-specific files in current
  # working directory.
  local is_zig_context="$(spaceship::upsearch build.zig)"
  [[ -n "$is_zig_context" || -n *.zig(#qN^/) ]] || return

  local zig_version="$(zig version)"

  # Display zig section
  spaceship::section \
    --color "$SPACESHIP_ZIG_COLOR" \
    --prefix "$SPACESHIP_ZIG_PREFIX" \
    --suffix "$SPACESHIP_ZIG_SUFFIX" \
    --symbol "$SPACESHIP_ZIG_SYMBOL" \
    "v$zig_version"
}
