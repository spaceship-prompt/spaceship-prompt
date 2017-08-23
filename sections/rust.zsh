# RUST
SPACESHIP_RUST_SHOW="${SPACESHIP_RUST_SHOW:=true}"
SPACESHIP_RUST_PREFIX="${SPACESHIP_RUST_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RUST_SUFFIX="${SPACESHIP_RUST_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RUST_SYMBOL="${SPACESHIP_RUST_SYMBOL:="𝗥 "}"
SPACESHIP_RUST_COLOR="${SPACESHIP_RUST_COLOR:="red"}"

# RUST
# Show current version of Rust
spaceship_rust() {
  [[ $SPACESHIP_RUST_SHOW == false ]] && return

  # If there are Rust-specific files in current directory
  [[ -f Cargo.toml || -n *.rs(#qN^/) ]] || return

  _exists rustc || return

  local rust_version=$(rustc --version | grep --colour=never -oE '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]')

  _prompt_section \
    "$SPACESHIP_RUST_COLOR" \
    "$SPACESHIP_RUST_PREFIX" \
    "${SPACESHIP_RUST_SYMBOL}v${rust_version}" \
    "$SPACESHIP_RUST_SUFFIX"
}
