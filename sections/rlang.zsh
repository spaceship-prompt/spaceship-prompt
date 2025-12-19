#
# R
#
# R is a language and environment for statistical computing and graphics.
# Link: https://www.r-project.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_RLANG_SHOW="${SPACESHIP_RLANG_SHOW=true}"
SPACESHIP_RLANG_ASYNC="${SPACESHIP_RLANG_ASYNC=true}"
SPACESHIP_RLANG_PREFIX="${SPACESHIP_RLANG_PREFIX="with "}"
SPACESHIP_RLANG_SUFFIX="${SPACESHIP_RLANG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RLANG_SYMBOL="${SPACESHIP_RLANG_SYMBOL="📊 "}"
SPACESHIP_RLANG_COLOR="blue"
SPACESHIP_RLANG_VERBOSE="${SPACESHIP_RLANG_VERBOSE=false}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_rlang() {
  [[ $SPACESHIP_RLANG_SHOW == false ]] && return

  # Check if R binary exists
  spaceship::exists R || return

  # Detect R project
  local R_project_globs=('*.R' '*.Rd' '*.Rmd' '*.Rproj' '*.Rsx')
  local is_R_project="$(spaceship::upsearch "${R_project_globs[@]}")"
  [[ -n $is_R_project || -e .Rprofile || -d ".Rproj.user" ]] || return


  # Extract R version
  local R_version="$(R --version 2>/dev/null | head -n 1 | cut -d ' ' -f 3,6,7)"

  # Check if R_version is empty
  [[ $? -ne 0 || -z $R_version ]] && return

  # Verbose output
  [[ $SPACESHIP_RLANG_VERBOSE == false ]] && R_version=$(echo $R_version | cut -d ' ' -f 1)

  spaceship::section \
    --color "$SPACESHIP_RLANG_COLOR" \
    --prefix "$SPACESHIP_RLANG_PREFIX" \
    --suffix "$SPACESHIP_RLANG_SUFFIX" \
    --symbol "$SPACESHIP_RLANG_SYMBOL" \
    "$R_version"

}
