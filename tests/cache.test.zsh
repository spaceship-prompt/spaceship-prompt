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

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_get_cache() {
  local value="bar"
  local shared_key="shared"

  SPACESHIP_CACHE[foo]="$value"
  assertEquals "should return the cached value" "$(spaceship::get_cache foo)" "$value"
  assertEquals "should not return unset value" "$(spaceship::get_cache bar)" ""
}

test_set_cache() {
  local key="foo"
  local value="bar"

  spaceship::set_cache "$key" "$value"
  assertEquals "should set the cache" "$value" "$(spaceship::get_cache "$key")"
}

test_clear_cache() {
  local key="foo"
  local value="bar"

  SPACESHIP_CACHE=(foo bar)
  spaceship::clear_cache

  assertEquals "should clear the cache" "" "$(spaceship::get_cache foo)"
  assertEquals "should clear the cache" "" "$(spaceship::get_cache bar)"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
