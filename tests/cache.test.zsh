#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "lib/cache.zsh"
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_cache_get() {
  local value="bar"
  local shared_key="shared"

  SPACESHIP_CACHE[foo]="$value"
  assertEquals "should return the cached value" "$(spaceship::cache::get foo)" "$value"
  assertEquals "should not return unset value" "$(spaceship::cache::get bar)" ""
}

test_cache_set() {
  local key="foo"
  local value="bar"

  spaceship::cache::set "$key" "$value"
  assertEquals "should set the cache" "$value" "$(spaceship::cache::get "$key")"
}

test_cache_clear() {
  local key="foo"
  local value="bar"

  SPACESHIP_CACHE=(foo bar)
  spaceship::cache::clear

  assertEquals "should clear the cache" "" "$(spaceship::cache::get foo)"
  assertEquals "should clear the cache" "" "$(spaceship::cache::get bar)"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
