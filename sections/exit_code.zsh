#
# Exit code
#
# Show exit code of last executed command

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_EXIT_CODE_SHOW="${SPACESHIP_EXIT_CODE_SHOW=false}"
SPACESHIP_EXIT_CODE_PAD="${SPACESHIP_EXIT_CODE_PAD=false}"
SPACESHIP_EXIT_CODE_PAD_CHAR="${SPACESHIP_EXIT_CODE_PAD_CHAR=" "}"
SPACESHIP_EXIT_CODE_PREFIX="${SPACESHIP_EXIT_CODE_PREFIX=""}"
SPACESHIP_EXIT_CODE_SUFFIX="${SPACESHIP_EXIT_CODE_SUFFIX=" "}"
SPACESHIP_EXIT_CODE_SYMBOL="${SPACESHIP_EXIT_CODE_SYMBOL="✘"}"
SPACESHIP_EXIT_CODE_COLOR="${SPACESHIP_EXIT_CODE_COLOR="red"}"

SPACESHIP_EXIT_CODE_PREFIX_SUCCESS="${SPACESHIP_EXIT_CODE_PREFIX_SUCCESS="$SPACESHIP_EXIT_CODE_PREFIX"}"
SPACESHIP_EXIT_CODE_SUFFIX_SUCCESS="${SPACESHIP_EXIT_CODE_SUFFIX_SUCCESS="$SPACESHIP_EXIT_CODE_SUFFIX"}"
SPACESHIP_EXIT_CODE_SYMBOL_SUCCESS="${SPACESHIP_EXIT_CODE_SYMBOL_SUCCESS="✔︎"}"
SPACESHIP_EXIT_CODE_COLOR_SUCCESS="${SPACESHIP_EXIT_CODE_COLOR_SUCCESS="green"}"
SPACESHIP_EXIT_CODE_CHAR_SUCCESS="${SPACESHIP_EXIT_CODE_CHAR_SUCCESS="0"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_exit_code() {
  [[ $SPACESHIP_EXIT_CODE_SHOW == false ]] && return

  if [[ $RETVAL == 0 ]]; then

    if [[ $SPACESHIP_EXIT_CODE_SHOW == 'always' ]]; then

      spaceship::section \
        "$SPACESHIP_EXIT_CODE_COLOR_SUCCESS" \
        "$SPACESHIP_EXIT_CODE_PREFIX_SUCCESS" \
        "${SPACESHIP_EXIT_CODE_SYMBOL_SUCCESS}${SPACESHIP_EXIT_CODE_CHAR_SUCCESS}" \
        "$SPACESHIP_EXIT_CODE_SUFFIX_SUCCESS"

    fi    

  else

    local prefix=${SPACESHIP_EXIT_CODE_PREFIX}
    if [[ $SPACESHIP_EXIT_CODE_PAD ]]; then
      local c=$SPACESHIP_EXIT_CODE_PAD_CHAR
      prefix="$prefix$(sed -e "s/^/$c$c$c/" -e 's/.*\(...\)/\1/' -e 's/[0-9]//g' <<< $RETVAL)"
    fi

    spaceship::section \
      "$SPACESHIP_EXIT_CODE_COLOR" \
      "$prefix" \
      "${SPACESHIP_EXIT_CODE_SYMBOL}$RETVAL" \
      "$SPACESHIP_EXIT_CODE_SUFFIX"

  fi
}
