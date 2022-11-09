#
# GNU Screen
#
# GNU Screen is a full-screen window manager that multiplexes a physical terminal
# between several processes, typically interactive shells.
# Link: https://www.gnu.org/software/screen/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GNU_SCREEN_SHOW="${SPACESHIP_GNU_SCREEN_SHOW=true}"
SPACESHIP_GNU_SCREEN_ASYNC="${SPACESHIP_GNU_SCREEN_SHOW=false}"
SPACESHIP_GNU_SCREEN_PREFIX="${SPACESHIP_GNU_SCREEN_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_GNU_SCREEN_SUFFIX="${SPACESHIP_GNU_SCREEN_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GNU_SCREEN_SYMBOL="${SPACESHIP_GNU_SCREEN_SYMBOL="💻 "}"
SPACESHIP_GNU_SCREEN_COLOR="${SPACESHIP_GNU_SCREEN_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show screen name if is in an attached session
spaceship_gnu_screen() {
  [[ $SPACESHIP_GNU_SCREEN_SHOW == false ]] && return

  spaceship::exists screen || return

  # Show screen section only when it is attached in a session
  [[ "$STY" =~ ^"[0-9]+\." ]] || return

  # STY could not be empty because regex match
  local screen_session="$STY"

  spaceship::section \
    --color "$SPACESHIP_GNU_SCREEN_COLOR" \
    --prefix "$SPACESHIP_GNU_SCREEN_PREFIX" \
    --suffix "$SPACESHIP_GNU_SCREEN_SUFFIX" \
    --symbol "$SPACESHIP_GNU_SCREEN_SYMBOL" \
    "$screen_session"
}
