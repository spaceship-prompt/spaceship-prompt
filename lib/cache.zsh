# ------------------------------------------------------------------------------
# CACHE
# Spaceship storage for data
# ------------------------------------------------------------------------------

# Declare a cache variable
typeset -gAh SPACESHIP_CACHE

# Get cache value from a given key
# USAGE:
#   spaceship::get_cache <key>
spaceship::get_cache() {
  local key="$1"
  echo -n "${SPACESHIP_CACHE[$key]}"
}

# Set cache value for a given key
# USAGE:
#   spaceship::set_cache <key> <value>
spaceship::set_cache() {
  local key="$1" value="$2"
  SPACESHIP_CACHE[$key]="$value"
}

# Clear cache
# USAGE:
#   spaceship::clear_cache
spaceship::clear_cache() {
  SPACESHIP_CACHE=( )
}
