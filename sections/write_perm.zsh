#
# Write permission
#
# Display a padlock if current directory is write-protected or
# if current user has not the rights to write.

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_WRITE_PERM_SHOW="${SPACESHIP_WRITE_PERM_SHOW=true}"
SPACESHIP_WRITE_PERM_PREFIX="${SPACESHIP_WRITE_PERM_PREFIX=""}"
SPACESHIP_WRITE_PERM_SUFFIX="${SPACESHIP_WRITE_PERM_SUFFIX=" "}"
SPACESHIP_WRITE_PERM_COLOR="${SPACESHIP_WRITE_PERM_COLOR=red}"
SPACESHIP_WRITE_PERM_ICON="${SPACESHIP_WRITE_PERM_ICON=""}"


# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_write_perm() {
  [[ $SPACESHIP_WRITE_PERM_SHOW == false ]] && return

  [[ -w . ]] && return

  spaceship::section \
    "$SPACESHIP_WRITE_PERM_COLOR" \
    "$SPACESHIP_WRITE_PERM_PREFIX" \
    "$SPACESHIP_WRITE_PERM_ICON" \
    "$SPACESHIP_WRITE_PERM_SUFFIX"
}
