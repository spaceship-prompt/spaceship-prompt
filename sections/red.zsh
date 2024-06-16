#
# Red
#
# Red is a next-gen programming language, strongly inspired by REBOL
# Link: https://www.red-lang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_RED_SHOW="${SPACESHIP_RED_SHOW=true}"
SPACESHIP_RED_ASYNC="${SPACESHIP_RED_ASYNC=true}"
SPACESHIP_RED_PREFIX="${SPACESHIP_RED_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RED_SUFFIX="${SPACESHIP_RED_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RED_SYMBOL="${SPACESHIP_RED_SYMBOL="🔺 "}"
SPACESHIP_RED_COLOR="${SPACESHIP_RED_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Python
spaceship_red() {
  [[ $SPACESHIP_RED_SHOW == false ]] && return

  # Show red version only in directories with relevant files
  local is_red_project="$(spaceship::upsearch red.rc redbol)"
  [[ -n "$is_red_project" || -n *.red(#qN^/) || -n *.reds(#qN^/) ]] || return

  local red_version

  if  [[ -n "$VIRTUAL_ENV" ]] || [[ $SPACESHIP_RED_SHOW == always ]]; then
    red_version=${(@)$(red --version 2>&1)[2]}
  fi

  [[ -z $red_version ]] && return

  spaceship::section \
    --color "$SPACESHIP_RED_COLOR" \
    --prefix "$SPACESHIP_RED_PREFIX" \
    --suffix "$SPACESHIP_RED_SUFFIX" \
    --symbol "$SPACESHIP_RED_SYMBOL" \
    "$red_version"
}
