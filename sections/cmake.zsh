#
# CMAKE
#
# CMake is the de-facto standard for building C++ code, with over 2 million downloads a month. 
# It’s a powerful, comprehensive solution for managing the software build process. 
# Get everything you need to successfully leverage CMake by visiting our resources section.
# Link: https://cmake.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_CMAKE_SHOW="${SPACESHIP_CMAKE_SHOW=true}"
SPACESHIP_CMAKE_ASYNC="${SPACESHIP_CMAKE_ASYNC=true}"
SPACESHIP_CMAKE_PREFIX="${SPACESHIP_CMAKE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_CMAKE_SUFFIX="${SPACESHIP_CMAKE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_CMAKE_SYMBOL="${SPACESHIP_CMAKE_SYMBOL="△ "}"
SPACESHIP_CMAKE_COLOR="${SPACESHIP_CMAKE_COLOR="blue"}"


# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------


spaceship_cmake() {

	[[ $SPACESHIP_CMAKE_SHOW == false ]] && return


	#Let's look for typical CMAKE files in the current dir
	local is_cmake_project="$(spaceship::upsearch CMakeLists.txt CMakeCache.txt cmake_install.cmake CMakeFiles)"

	[[ -n "$is_cmake_project" ]] || return 

	spaceship::exists cmake || return

	local cmake_version=$(cmake --version | head -n 1 | awk '{print "v" $3}')

	spaceship::section \
		--color "$SPACESHIP_CMAKE_COLOR" \
		--prefix "$SPACESHIP_CMAKE_PREFIX" \
		--suffix "$SPACESHIP_CMAKE_SUFFIX" \
		--symbol "$SPACESHIP_CMAKE_SYMBOL" \
		"$cmake_version"
}
