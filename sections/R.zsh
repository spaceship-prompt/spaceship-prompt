#
# R
#
# R is a language and environment for statistical computing and graphics.
# Link: https://www.r-project.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_R_SHOW="${SPACESHIP_R_SHOW=true}"
SPACESHIP_R_ASYNC="${SPACESHIP_R_ASYNC=true}"
SPACESHIP_R_PREFIX="${SPACESHIP_R_PREFIX="with "}"
SPACESHIP_R_SUFFIX="${SPACESHIP_R_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HAXE_SYMBOL="${SPACESHIP_R_SYMBOL="📊 "}"
SPACESHIP_R_COLOR="blue" 
SPACESHIP_R_VERBOSE="${SPACESHIP_R_VERBOSE=false}" 

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_R() {
  [[ $SPACESHIP_R_SHOW == false ]] && return

  # Check if R binary exists
  spaceship::exists R || return

  # Detect R project
  local R_project_globs=('.R','.Rd','Rmd','.Rproj','.Rsx')
  local is_R_project="$(spaceship::upsearch $R_project_globs)"
  [[ -n $is_R_project || -e .Rprofile ||  -d  ".Rproj.user" ]] || return


  # Extract R version
  local R_version="$(R --version 2>/dev/null | head -n 1 | cut -d ' ' -f 3,6,7)"

  # Check if R_version is empty
  [[ $? -ne 0 || -z $R_version ]] && return

  # Verbose output
  [[ $SPACESHIP_R_VERBOSE == false ]] && R_version=$(echo $R_version | cut -d ' ' -f 1)


  spaceship::section \
    --color  "$SPACESHIP_R_COLOR" \
    --prefix "$SPACESHIP_R_PREFIX" \
    --suffix "$SPACESHIP_R_SUFFIX" \
    --symbol "$SPACESHIP_R_SYMBOL" \
    "$R_version"

}
