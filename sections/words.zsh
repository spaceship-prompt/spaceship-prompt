#
# WORDS
#
# Day   Words

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_WORDS_SHOW="${SPACESHIP_WORDS_SHOW=false}"
SPACESHIP_WORDS_PREFIX="${SPACESHIP_WORDS_PREFIX=" "}"
SPACESHIP_WORDS_TEXT="${SPACESHIP_WORDS_TEXT="spaceship-prompt"}"
SPACESHIP_WORDS_SUFFIX="${SPACESHIP_WORDS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_WORDS_COLOR="${SPACESHIP_WORDS_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_words() {
  [[ $SPACESHIP_WORDS_SHOW == false ]] && return

  spaceship::section \
    "$SPACESHIP_WORDS_COLOR" \
    "$SPACESHIP_WORDS_PREFIX" \
    "$SPACESHIP_WORDS_TEXT" \
    "$SPACESHIP_WORDS_SUFFIX"
}
