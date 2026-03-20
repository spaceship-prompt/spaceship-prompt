#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "lib/extract.zsh"
}

setUp() {
  EXTRACT_CODE=""
  EXTRACT_FILE=""
  EXTRACT_ARG0=""
  EXTRACT_ARG1=""

  unfunction python 2>/dev/null || true
  unfunction ruby 2>/dev/null || true
  unfunction node 2>/dev/null || true
}

tearDown() {
  unfunction python 2>/dev/null || true
  unfunction ruby 2>/dev/null || true
  unfunction node 2>/dev/null || true
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_python_json_passes_file_as_argv() {
  local file="$SHUNIT_TMPDIR/foo'+\`touch PWNED\`+'/package.json"

  python() {
    EXTRACT_ARG0="$1"
    EXTRACT_CODE="$2"
    EXTRACT_FILE="$3"
    print -r -- "1.0.0"
  }

  spaceship::extract::python::json "$file" version >/dev/null

  assertEquals "should use python -c" "-c" "$EXTRACT_ARG0"
  assertEquals "should pass the file as argv" "$file" "$EXTRACT_FILE"
  assertEquals "should reference argv in the script" \
    true "$([[ "$EXTRACT_CODE" == *'sys.argv[1]'* ]] && print true || print false)"
  assertEquals "should not interpolate the file into the script" \
    false "$([[ "$EXTRACT_CODE" == *"$file"* ]] && print true || print false)"
}

test_ruby_json_passes_file_as_argv() {
  local file="$SHUNIT_TMPDIR/foo'+\`touch PWNED\`+'/package.json"

  ruby() {
    EXTRACT_ARG0="$1"
    EXTRACT_ARG1="$2"
    EXTRACT_CODE="$4"
    EXTRACT_FILE="$6"
    print -r -- "1.0.0"
  }

  spaceship::extract::ruby::json "$file" version >/dev/null

  assertEquals "should require json" "-r" "$EXTRACT_ARG0"
  assertEquals "should load the json library" "json" "$EXTRACT_ARG1"
  assertEquals "should pass the file after --" "$file" "$EXTRACT_FILE"
  assertEquals "should reference argv in the script" \
    true "$([[ "$EXTRACT_CODE" == *'ARGV[0]'* ]] && print true || print false)"
  assertEquals "should not interpolate the file into the script" \
    false "$([[ "$EXTRACT_CODE" == *"$file"* ]] && print true || print false)"
}

test_ruby_yaml_uses_safe_load() {
  local file="$SHUNIT_TMPDIR/pubspec.yaml"

  ruby() {
    EXTRACT_CODE="$4"
    EXTRACT_FILE="$6"
    print -r -- "1.0.0"
  }

  spaceship::extract::ruby::yaml "$file" version >/dev/null

  assertEquals "should pass the file after --" "$file" "$EXTRACT_FILE"
  assertEquals "should use YAML.safe_load" \
    true "$([[ "$EXTRACT_CODE" == *'YAML.safe_load(File.read(ARGV[0]))'* ]] && print true || print false)"
}

test_node_json_passes_file_as_argv() {
  local file="$SHUNIT_TMPDIR/foo'+\`touch PWNED\`+'/package.json"

  node() {
    EXTRACT_ARG0="$1"
    EXTRACT_CODE="$2"
    EXTRACT_ARG1="$3"
    EXTRACT_FILE="$4"
    print -r -- "1.0.0"
  }

  spaceship::extract::node::json "$file" version >/dev/null

  assertEquals "should use node -p" "-p" "$EXTRACT_ARG0"
  assertEquals "should keep -- before argv values" "--" "$EXTRACT_ARG1"
  assertEquals "should pass the file as argv" "$file" "$EXTRACT_FILE"
  assertEquals "should resolve the argv path in the script" \
    true "$([[ "$EXTRACT_CODE" == *"process.argv[1]"* && "$EXTRACT_CODE" == *"require('path').resolve"* ]] && print true || print false)"
  assertEquals "should not interpolate the file into the script" \
    false "$([[ "$EXTRACT_CODE" == *"$file"* ]] && print true || print false)"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
