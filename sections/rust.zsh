#
# Rust
#
# Rust is a systems programming language sponsored by Mozilla Research.
# Link: https://www.rust-lang.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_RUST_SHOW="${SPACESHIP_RUST_SHOW=true}"
SPACESHIP_RUST_ASYNC="${SPACESHIP_RUST_ASYNC=true}"
SPACESHIP_RUST_PREFIX="${SPACESHIP_RUST_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RUST_SUFFIX="${SPACESHIP_RUST_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RUST_SYMBOL="${SPACESHIP_RUST_SYMBOL="🦀 "}"
SPACESHIP_RUST_COLOR="${SPACESHIP_RUST_COLOR="red"}"
SPACESHIP_RUST_VERBOSE_VERSION="${SPACESHIP_RUST_VERBOSE_VERSION=false}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Rust
spaceship_rust() {
  [[ $SPACESHIP_RUST_SHOW == false ]] && return

  # If there are Rust-specific files in current directory
  local is_rust_project="$(spaceship::upsearch Cargo.toml)"
  [[ -n "$is_rust_project" || -n *.rs(#qN^/) ]] || return

  spaceship::exists rustc || return

  local rust_version=$(rustc --version | cut -d' ' -f2)

  if [[ $SPACESHIP_RUST_VERBOSE_VERSION == false ]]; then
    # Cut off -suffixes from version. "v1.30.0-beta.11" or "v1.30.0-nightly"
  	local rust_version=$(echo $rust_version | cut -d'-' -f1)
  fi

  spaceship::section \
    --color "$SPACESHIP_RUST_COLOR" \
    --prefix "$SPACESHIP_RUST_PREFIX" \
    --suffix "$SPACESHIP_RUST_SUFFIX" \
    --symbol "$SPACESHIP_RUST_SYMBOL" \
    "$rust_version"
}
