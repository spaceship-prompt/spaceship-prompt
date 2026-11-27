#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"
  export PATH=$PWD/tests/stubs:$PATH

  CMAKE_VERSION="4.3.1"

  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(cmake)

  source "spaceship.zsh"
}

setUp() {
  SPACESHIP_CMAKE_SHOW="true"
  SPACESHIP_CMAKE_PREFIX="via "
  SPACESHIP_CMAKE_SUFFIX=""
  SPACESHIP_CMAKE_SYMBOL="△ "
  SPACESHIP_CMAKE_COLOR="blue"

  cd $SHUNIT_TMPDIR
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_CMAKE_SHOW
  unset SPACESHIP_CMAKE_PREFIX
  unset SPACESHIP_CMAKE_SUFFIX
  unset SPACESHIP_CMAKE_SYMBOL
  unset SPACESHIP_CMAKE_COLOR
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_cmake_no_files() {
	local no_files_expected=""
	local no_files_actual="$(spaceship::testkit::render_prompt)"
	assertEquals "should not render without files" "$no_files_expected" "$no_files_actual"
}

test_cmake_upsearch_file() {
	FILES=(CMakeLists.txt CMakeCache.txt cmake_install.cmake)
	for file in $FILES; do
		touch $file
		local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_CMAKE_COLOR}%}${SPACESHIP_CMAKE_SYMBOL}v${CMAKE_VERSION}%{%b%f%}"
		local actual="$(spaceship::testkit::render_prompt)"
		assertEquals "should render with extension for file $file" "$expected" "$actual"
		rm $file
	done
}

test_cmake_upsearch_dir() {
  DIRS=(CMakeFiles)
  for dir in $DIRS; do
    mkdir $dir
    local expected="%{%B%}via %{%b%}%{%B%F{$SPACESHIP_CMAKE_COLOR}%}${SPACESHIP_CMAKE_SYMBOL}v${CMAKE_VERSION}%{%b%f%}"
    local actual="$(spaceship::testkit::render_prompt)"
    assertEquals "should render with dir $dir" "$expected" "$actual"
    rm -rf $dir
  done
}



# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source tests/shunit2/shunit2
