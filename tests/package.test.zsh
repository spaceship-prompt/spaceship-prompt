#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(package)
  SPACESHIP_PACKAGE_ORDER=(npm)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_PACKAGE_SHOW="true"
  SPACESHIP_PACKAGE_SHOW_PRIVATE="false"
  SPACESHIP_PACKAGE_PREFIX="is "
  SPACESHIP_PACKAGE_SUFFIX=""
  SPACESHIP_PACKAGE_SYMBOL="📦 "
  SPACESHIP_PACKAGE_COLOR="red"

  EXTRACT_CAPTURE_FILE="$SHUNIT_TMPDIR/extract.capture"
  : > "$EXTRACT_CAPTURE_FILE"

  spaceship::extract() {
    print -r -- "$3:$2" >> "$EXTRACT_CAPTURE_FILE"

    case "$3" in
      version) print -r -- "1.0.0" ;;
      private) print -r -- "false" ;;
    esac
  }
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_PACKAGE_SHOW
  unset SPACESHIP_PACKAGE_SHOW_PRIVATE
  unset SPACESHIP_PACKAGE_PREFIX
  unset SPACESHIP_PACKAGE_SUFFIX
  unset SPACESHIP_PACKAGE_SYMBOL
  unset SPACESHIP_PACKAGE_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_package_npm_preserves_weird_paths() {
  local dir="$SHUNIT_TMPDIR/foo bar'+\`touch PWNED\`+'"
  local package_json="$dir/package.json"

  mkdir -p "$dir/.git"
  printf '{"version":"1.0.0","private":false}\n' > "$package_json"

  cd "$dir"
  local physical_package_json="$(pwd -P)/package.json"

  local output_file="$SHUNIT_TMPDIR/package.out"
  spaceship_package::npm > "$output_file"
  local actual="$(<"$output_file")"
  local captured="$(<"$EXTRACT_CAPTURE_FILE")"

  assertEquals "should extract the package version" "1.0.0" "$actual"
  assertEquals "should pass the full package path to extract" \
    $'version:'"$physical_package_json"$'\nprivate:'"$physical_package_json" "$captured"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
