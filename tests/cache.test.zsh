#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  source lib/cache.zsh
}

setUp() {
  export CACHE_FILE="$SHUNIT_TMPDIR/cache.zsh"
  touch "$CACHE_FILE"

  # Mock runtime variables
  typeset -gAh SPACESHIP
  SPACESHIP[cache_file]="$CACHE_FILE"
}

tearDown() {
  rm -f "$CACHE_FILE"

  unset CACHE_FILE
  unset SPACESHIP
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_get_cache() {
  local value="bar"
  local shared_key="shared"
  local shared_value="baz"
  local cache_file_value=""

  # Test sync mode
  spaceship::is_async() {
    return 1
  }

  SPACESHIP_CACHE[foo]="$value"
  assertEquals "should return the cached value" "$value" "$(spaceship::get_cache foo)"
  assertEquals "should not return the shared value" "" "$(spaceship::get_cache $shared_key)"

  # Test async mode
  spaceship::is_async() {
    return 0
  }

  echo "SPACESHIP_CACHE[$shared_key]='$shared_value'" >> "$CACHE_FILE"

  assertEquals "should return the cached value" "$value" "$(spaceship::get_cache foo)"
  assertEquals "should return the shared value" "$shared_value" "$(spaceship::get_cache $shared_key)"
}

test_set_cache() {
  local key="foo"
  local value="bar"
  local cache_file_value=""

  # Test sync mode
  spaceship::is_async() {
    return 1
  }

  spaceship::set_cache "$key" "$value"
  assertEquals "should set the cache" "$value" "$(spaceship::get_cache "$key")"

  cache_file_value="$(cat $CACHE_FILE)"
  assertEquals "should not write to shared file" "$cache_file_value" ""

  # Test async mode
  spaceship::is_async() {
    return 0
  }

  spaceship::set_cache "$key" "$value"
  assertEquals "should set the cache" "$value" "$(spaceship::get_cache "$key")"

  cache_file_value="$(cat $CACHE_FILE)"
  assertEquals "should write to shared file" "$cache_file_value" "SPACESHIP_CACHE[$key]='$value'"
}

test_clear_cache() {
  local key="foo"
  local value="bar"
  local cache_file_value=""
  local cache="SPACESHIP_CACHE[$key]='$value'"

  # Test sync mode
  spaceship::is_async() {
    return 1
  }

  echo "$cache" >> "$CACHE_FILE"
  SPACESHIP_CACHE=(foo bar)
  spaceship::clear_cache

  assertEquals "should clear the cache" "" "$(spaceship::get_cache foo)"
  assertEquals "should clear the cache" "" "$(spaceship::get_cache bar)"

  cache_file_value="$(cat $CACHE_FILE)"
  assertEquals "should not write to shared file" "$cache_file_value" "$cache"

  # Test async mode
  spaceship::is_async() {
    return 0
  }

  echo "$cache" >> "$CACHE_FILE"
  SPACESHIP_CACHE=(foo bar)
  spaceship::clear_cache

  assertEquals "should clear the cache" "" "$(spaceship::get_cache foo)"
  assertEquals "should clear the cache" "" "$(spaceship::get_cache bar)"

  cache_file_value="$(cat $CACHE_FILE)"
  assertEquals "should not write to shared file" "$cache_file_value" ""
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
