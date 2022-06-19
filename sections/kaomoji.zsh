#
# Kaomoji face
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_KAOMOJI_PREFIX="${SPACESHIP_KAOMOJI_PREFIX=""}"
SPACESHIP_KAOMOJI_SUFFIX="${SPACESHIP_KAOMOJI_SUFFIX=" "}"
SPACESHIP_KAOMOJI_HAPPY="${SPACESHIP_KAOMOJI_HAPPY="(ﾉ◕ヮ◕)ﾉ"}"
SPACESHIP_KAOMOJI_SAD="${SPACESHIP_KAOMOJI_SAD="(｡•́︿•̀｡)"}"
SPACESHIP_KAOMOJI_BORED="${SPACESHIP_KAOMOJI_BORED="(－ω－)"}"
SPACESHIP_KAOMOJI_COLOR_SUCCESS="${SPACESHIP_KAOMOJI_COLOR_SUCCESS="green"}"
SPACESHIP_KAOMOJI_COLOR_FAILURE="${SPACESHIP_KAOMOJI_COLOR_FAILURE="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_kaomoji() {
    local 'color' 'face'

    # select face
    if [[ $SPACESHIP_EXEC_TIME_duration -ge 2 ]]; then
        face="$SPACESHIP_KAOMOJI_BORED"
    elif [[ $RETVAL -ne 0 ]]; then
        face="$SPACESHIP_KAOMOJI_SAD"
    else
        face="$SPACESHIP_KAOMOJI_HAPPY"
    fi

    # select color
    if [[ $RETVAL -eq 0 ]]; then
        color="$SPACESHIP_KAOMOJI_COLOR_SUCCESS"
    else
        color="$SPACESHIP_KAOMOJI_COLOR_FAILURE"
    fi

    spaceship::section \
        "$color" \
        "$SPACESHIP_KAOMOJI_PREFIX" \
        "$face" \
        "$SPACESHIP_KAOMOJI_SUFFIX"
}
