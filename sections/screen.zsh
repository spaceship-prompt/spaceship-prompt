#
# Screen
#
# Screen is a full-screen window manager that multiplexes a physical terminal between several processes, typically interactive shells.
# Link: https://www.gnu.org/software/screen/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SCREEN_SHOW="${SPACESHIP_SCREEN_SHOW=true}"
SPACESHIP_SCREEN_PREFIX="${SPACESHIP_SCREEN_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_SCREEN_SUFFIX="${SPACESHIP_SCREEN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SCREEN_SYMBOL="${SPACESHIP_SCREEN_SYMBOL="💻 "}"
SPACESHIP_SCREEN_COLOR="${SPACESHIP_SCREEN_COLOR="yellow"}"
SPACESHIP_SCREEN_SHOW_SESSION="${SPACESHIP_SCREEN_SHOW_SESSION=true}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show screen name if is in an attached session
spaceship_screen() {
  [[ $SPACESHIP_SCREEN_SHOW == false ]] && return

  spaceship::exists screen || return

  # Show screen section only when it is attached in a session
  [[ "$STY" =~ ^"[0-9]+\." ]] || return

  local screen_session

  if [[ "$SPACESHIP_SCREEN_SHOW_SESSION" == "true" ]]; then
    # STY could not be empty because regex match
    screen_session=$STY
  else
    screen_session=""
  fi

  spaceship::section \
    "$SPACESHIP_SCREEN_COLOR" \
    "$SPACESHIP_SCREEN_PREFIX" \
    "$SPACESHIP_SCREEN_SYMBOL$screen_session" \
    "$SPACESHIP_SCREEN_SUFFIX"
}
