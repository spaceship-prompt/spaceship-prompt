#
# Elixir
#
# Elixir is a dynamic, functional language designed for building scalable applications.
# Link: https://elixir-lang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ELIXIR_SHOW="${SPACESHIP_ELIXIR_SHOW=true}"
SPACESHIP_ELIXIR_ASYNC="${SPACESHIP_ELIXIR_ASYNC=true}"
SPACESHIP_ELIXIR_PREFIX="${SPACESHIP_ELIXIR_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_ELIXIR_SUFFIX="${SPACESHIP_ELIXIR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ELIXIR_SYMBOL="${SPACESHIP_ELIXIR_SYMBOL="💧 "}"
SPACESHIP_ELIXIR_DEFAULT_VERSION="${SPACESHIP_ELIXIR_DEFAULT_VERSION=""}"
SPACESHIP_ELIXIR_COLOR="${SPACESHIP_ELIXIR_COLOR="magenta"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Elixir
spaceship_elixir() {
  [[ $SPACESHIP_ELIXIR_SHOW == false ]] && return

  # Show versions only for Elixir-specific folders
  [[ -f mix.exs || -n *.ex(#qN^/) || -n *.exs(#qN^/) ]] || return

  local elixir_version

  if spaceship::exists kiex; then
    elixir_version="${ELIXIR_VERSION}"
  elif spaceship::exists exenv; then
    elixir_version=$(exenv version-name)
  elif spaceship::exists asdf; then
    elixir_version=${$(asdf current elixir)[2]}
  fi

  if [[ $elixir_version == "" ]]; then
    spaceship::exists elixir || return
    elixir_version=$(elixir -v 2>/dev/null | spaceship::grep "Elixir" | cut -d ' ' -f 2)
  fi

  [[ $elixir_version == "system" ]] && return
  [[ $elixir_version == $SPACESHIP_ELIXIR_DEFAULT_VERSION ]] && return

  # Add 'v' before elixir version that starts with a number
  [[ "${elixir_version}" =~ ^[0-9].+$ ]] && elixir_version="v${elixir_version}"

  spaceship::section \
    --color "$SPACESHIP_ELIXIR_COLOR" \
    --prefix "$SPACESHIP_ELIXIR_PREFIX" \
    --suffix "$SPACESHIP_ELIXIR_SUFFIX" \
    --symbol "$SPACESHIP_ELIXIR_SYMBOL" \
    "$elixir_version"
}
