#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit

TESTS="$(find . -type f -name "*.test.zsh")"
EXIT_CODE=0

for test in $TESTS; do
  echo
  echo '------------------------------------------------------------'
  echo "Run $test..."
  ( eval zsh $test 2>&1 )
  local exitcode="$?"
  [ "$exitcode" != "0" ] && EXIT_CODE=$exitcode
done

if [ "$EXIT_CODE" != "0" ]; then
  echo
  echo "Tests are failing!"
  exit $EXIT_CODE
else
  echo
  echo "Tests are passing!"
  exit 0
fi
