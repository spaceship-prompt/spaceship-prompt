#
# SingularityCE
#
# SingularityCE is the Community Edition of Singularity, an open source
# container platform designed to be simple, fast, and secure.
# Link: https://sylabs.io/singularity/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SINGULARITYCE_SHOW="${SPACESHIP_SINGULARITYCE_SHOW=true}"
SPACESHIP_SINGULARITYCE_ASYNC="${SPACESHIP_SINGULARITYCE_ASYNC=true}"
SPACESHIP_SINGULARITYCE_PREFIX="${SPACESHIP_SINGULARITYCE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_SINGULARITYCE_SUFFIX="${SPACESHIP_SINGULARITYCE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SINGULARITYCE_SYMBOL="${SPACESHIP_SINGULARITYCE_SYMBOL="⬡ "}"
SPACESHIP_SINGULARITYCE_COLOR="${SPACESHIP_SINGULARITYCE_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of SingularityCE
spaceship_singularityce() {
  [[ $SPACESHIP_SINGULARITYCE_SHOW == false ]] && return

  # Check if singularity binary exists
  spaceship::exists singularity || return

  # Show only in directories containing Singularity definition files
  # `singularity --version` is slow; gate it behind a file check first
  [[ -n *.def(#qN^/) ]] || return

  # `singularity --version` outputs: "singularity version X.Y.Z"
  local singularity_version
  singularity_version="$(singularity --version 2>/dev/null | awk '{print $NF}')"
  [[ -z "$singularity_version" ]] && return

  spaceship::section \
    --color  "$SPACESHIP_SINGULARITYCE_COLOR" \
    --prefix "$SPACESHIP_SINGULARITYCE_PREFIX" \
    --suffix "$SPACESHIP_SINGULARITYCE_SUFFIX" \
    --symbol "$SPACESHIP_SINGULARITYCE_SYMBOL" \
    "$singularity_version"
}
