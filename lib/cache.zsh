#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# CACHE
# Spaceship storage for data
# ------------------------------------------------------------------------------

# Declare a cache variable
typeset -gAh SPACESHIP_CACHE

# Get cache value from a given key
# USAGE:
#   spaceship::cache::get <key>
spaceship::cache::get() {
  local key="$1"
  echo -n "${SPACESHIP_CACHE[$key]}"
}

# Set cache value for a given key
# USAGE:
#   spaceship::cache::set <key> <value>
spaceship::cache::set() {
  local key="$1" value="$2"
  SPACESHIP_CACHE[$key]="$value"
}

# Clear cache
# USAGE:
#   spaceship::cache::clear
spaceship::cache::clear() {
  SPACESHIP_CACHE=( )
}
