#
# Rust
#
# Rust is a systems programming language sponsored by Mozilla Research.
# Link: https://www.rust-lang.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_RUST_SHOW="${SPACESHIP_RUST_SHOW=true}"
SPACESHIP_RUST_PREFIX="${SPACESHIP_RUST_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RUST_SUFFIX="${SPACESHIP_RUST_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RUST_SYMBOL="${SPACESHIP_RUST_SYMBOL="𝗥 "}"
SPACESHIP_RUST_COLOR="${SPACESHIP_RUST_COLOR="red"}"
SPACESHIP_RUST_VERBOSE_VERSION="${SPACESHIP_RUST_VERBOSE_VERSION=false}"

SPACESHIP_PACKAGE_CARGO_SHOW="${SPACESHIP_PACKAGE_CARGO_SHOW="$SPACESHIP_PACKAGE_SHOW"}"
SPACESHIP_PACKAGE_CARGO_PREFIX="${SPACESHIP_PACKAGE_CARGO_PREFIX="$SPACESHIP_PACKAGE_PREFIX"}"
SPACESHIP_PACKAGE_CARGO_SUFFIX="${SPACESHIP_PACKAGE_CARGO_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PACKAGE_CARGO_SYMBOL="${SPACESHIP_PACKAGE_CARGO_SYMBOL="$SPACESHIP_PACKAGE_SYMBOL"}"
SPACESHIP_PACKAGE_CARGO_COLOR="${SPACESHIP_PACKAGE_CARGO_COLOR="$SPACESHIP_PACKAGE_COLOR"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Rust
spaceship_rust() {

  # If there are Rust-specific files in current directory
  [[ -f Cargo.toml || -n *.rs(#qN^/) ]] || return

  if [[ $SPACESHIP_PACKAGE_CARGO_SHOW == true ]] && spaceship::exists cargo; then
    local package_version
    # Handle missing field `version` in Cargo.toml.
    # `cargo pkgid` need Cargo.lock exists too. If it does't, do not show package version
    # https://github.com/denysdovhan/spaceship-prompt/pull/617
    local pkgid=$(cargo pkgid 2>&1)
    echo $pkgid | grep -q "error:" || package_version=${pkgid##*\#}

    if [[ -n $package_version ]]; then
      spaceship::section \
        "$SPACESHIP_PACKAGE_CARGO_COLOR" \
        "$SPACESHIP_PACKAGE_CARGO_PREFIX" \
        "${SPACESHIP_PACKAGE_CARGO_SYMBOL}v${package_version}" \
        "$SPACESHIP_PACKAGE_CARGO_SUFFIX"
    fi
  fi

  if [[ $SPACESHIP_RUST_SHOW == true ]] && spaceship::exists rustc; then
    local rust_version=$(rustc --version | cut -d' ' -f2)

    if [[ $SPACESHIP_RUST_VERBOSE_VERSION == false ]]; then
      local rust_version=$(echo $rust_version | cut -d'-' -f1) # Cut off -suffixes from version. "v1.30.0-beta.11" or "v1.30.0-nightly"
    fi

    spaceship::section \
      "$SPACESHIP_RUST_COLOR" \
      "$SPACESHIP_RUST_PREFIX" \
      "${SPACESHIP_RUST_SYMBOL}v${rust_version}" \
      "$SPACESHIP_RUST_SUFFIX"
  fi
}
