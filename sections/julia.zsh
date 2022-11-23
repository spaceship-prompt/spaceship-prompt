#
# Julia
#
# A high-level, high-performance dynamic programming language for numerical computing.
# Link: https://julialang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_JULIA_SHOW="${SPACESHIP_JULIA_SHOW=true}"
SPACESHIP_JULIA_ASYNC="${SPACESHIP_JULIA_ASYNC=true}"
SPACESHIP_JULIA_PREFIX="${SPACESHIP_JULIA_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_JULIA_SUFFIX="${SPACESHIP_JULIA_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_JULIA_SYMBOL="${SPACESHIP_JULIA_SYMBOL="ஃ "}"
SPACESHIP_JULIA_COLOR="${SPACESHIP_JULIA_COLOR="green"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Julia
spaceship_julia() {
  [[ $SPACESHIP_JULIA_SHOW == false ]] && return

  # If there are julia files in current directory
  local is_julia_project="$(spaceship::upsearch Project.toml JuliaProject.toml Manifest.toml)"
  [[ -n "$is_julia_project" || -n *.jl(#qN^/) ]] || return

  spaceship::exists julia || return

  local julia_version=$(julia --version | spaceship::grep -oE '([0-9]+\.)([0-9]+\.)?([0-9]+)')

  spaceship::section \
    --color "$SPACESHIP_JULIA_COLOR" \
    --prefix "$SPACESHIP_JULIA_PREFIX" \
    --suffix "$SPACESHIP_JULIA_SUFFIX" \
    --symbol "$SPACESHIP_JULIA_SYMBOL" \
    "$julia_version"
}
