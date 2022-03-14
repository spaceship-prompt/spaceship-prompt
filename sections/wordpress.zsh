#
# WordPress
#
# WordPress is open source software you can use to create a beautiful website, blog, or app.
# Link: https://wordpress.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_WORDPRESS_SHOW="${SPACESHIP_WORDPRESS_SHOW=true}"
SPACESHIP_WORDPRESS_PREFIX="${SPACESHIP_WORDPRESS_PREFIX="on "}"
SPACESHIP_WORDPRESS_SUFFIX="${SPACESHIP_WORDPRESS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_WORDPRESS_SYMBOL="${SPACESHIP_WORDPRESS_SYMBOL="🐱 "}"
SPACESHIP_WORDPRESS_COLOR="${SPACESHIP_WORDPRESS_COLOR="104"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of WordPress
spaceship_wordpress() {
  [[ $SPACESHIP_WORDPRESS_SHOW == false ]] && return

  # Show only if a WordPress config file exists in current path
  setopt extendedglob
  local wordpress_glob=(../)#wp-config*.php
  local wordpress_config=$(ls $wordpress_glob)
  [[ -z $wordpress_config ]] && return

  # Verify that wp-cli exists
  spaceship::exists wp || return

  local wordpress_version=$(wp core version 2>/dev/null)

  [[ -z $wordpress_version ]] && return

  spaceship::section \
    "$SPACESHIP_WORDPRESS_COLOR" \
    "$SPACESHIP_WORDPRESS_PREFIX" \
    "${SPACESHIP_WORDPRESS_SYMBOL}v${wordpress_version}" \
    "${SPACESHIP_WORDPRESS_SUFFIX}"
}
