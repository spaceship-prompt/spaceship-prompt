#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit

# ------------------------------------------------------------------------------
# Colors
# Set color variables for colorful output
# ------------------------------------------------------------------------------

# If we have tput, let's set colors
if [[ ! -z $(which tput 2> /dev/null) ]]; then
  reset=$(tput sgr0)
  bold=$(tput bold)
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  blue=$(tput setaf 4)
  magenta=$(tput setaf 5)
  cyan=$(tput setaf 6)
fi

# ------------------------------------------------------------------------------
# VARIABLES
# Paths to important resources
# ------------------------------------------------------------------------------

TESTS="$(find . -type f -name "*.test.zsh")"
EXIT_CODE=0

# ------------------------------------------------------------------------------
# HELPERS
# Useful functions for common tasks
# ------------------------------------------------------------------------------

header() {
  [[ -n $2 ]] && color=$1 || color=$cyan
  [[ -n $2 ]] && content=${@:2} || content=$@

  echo $color$bold
  echo '--------------------------------------------------------------------------------'
  echo "$content"
  echo '--------------------------------------------------------------------------------'
  echo $reset
}

# ------------------------------------------------------------------------------
# MAIN
# Checkings and installing process
# ------------------------------------------------------------------------------

main() {
  for test in $TESTS; do
    header "Run $test..."
    ( eval zsh $test 2>&1 )
    local exitcode="$?"
    [ "$exitcode" != "0" ] && EXIT_CODE=$exitcode
  done

  if [ "$EXIT_CODE" != "0" ]; then
    header $red "Tests are failing!"
    exit $EXIT_CODE
  else
    header $green "Tests are passing!"
    exit 0
  fi
}

main "$@"

