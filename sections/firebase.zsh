# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
SPACESHIP_FIREBASE_SHOW="${SPACESHIP_FIREBASE_SHOW=true}"
SPACESHIP_FIREBASE_PREFIX="${SPACESHIP_FIREBASE_PREFIX="FB project: "}"
SPACESHIP_FIREBASE_SYMBOL="${SPACESHIP_FIREBASE_SYMBOL="🔥 "}"
SPACESHIP_FIREBASE_COLOR="${SPACESHIP_FIREBASE_COLOR="#d75f00"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows active Firebase Project
spaceship_firebase() {

  # wheather to show this section
  [[ $SPACESHIP_FIREBASE_SHOW == false ]] && return

  # check if firebase-tools cli is installed
  spaceship::exists firebase || return

  local FBDIR=$(which firebase)

  $FBDIR target 1>/dev/null
  if [[ $? -eq 0 ]]; then
    local target=$($FBDIR target | awk '{gsub(/\:/, "", $4)} {print $4}')
  else
    return
  fi

  spaceship::section \
    "$SPACESHIP_FIREBASE_COLOR" \
    "$SPACESHIP_FIREBASE_PREFIX" \
    "${SPACESHIP_FIREBASE_SYMBOL}${target}"

}
