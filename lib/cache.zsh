# ------------------------------------------------------------------------------
# CACHE
# Spaceship storage for data, works in multiple threads
# ------------------------------------------------------------------------------

# Declare a cache variable
typeset -gAh SPACESHIP_CACHE

# Get cache value from a given key
# USAGE:
#   spaceship::get_cache_value <key>
spaceship::get_cache() {
  local key="$1"

  # Source cache file to make cache work in multiple shells
  if $(spaceship::is_async); then
    source "${SPACESHIP[cache_file]}"
  fi

  echo -n "${SPACESHIP_CACHE[$key]}"
}

# Set cache value for a given key
# USAGE:
#   spaceship::set_cache_value <key> <value>
spaceship::set_cache() {
  local key="$1" value="$2"

  # Write to the cache file to make cache work in multiple shells
  if $(spaceship::is_async); then
    echo "SPACESHIP_CACHE[$key]='$value'" >>| "${SPACESHIP[cache_file]}"
  fi

  SPACESHIP_CACHE[$key]="$value"
}

# Clear cache
# USAGE:
#   spaceship::clear_cache
spaceship::clear_cache() {
  # Clear cache file to make cache work in multiple shells
  if $(spaceship::is_async); then
    echo '' >| "${SPACESHIP[cache_file]}"
  fi

  SPACESHIP_CACHE=( )
}
