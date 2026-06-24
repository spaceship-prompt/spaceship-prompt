# CMake `cmake`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**CMake**](https://cmake.org) is the de-facto standard for building C++ code, with over 2 million downloads a month. It’s a powerful, comprehensive solution for managing the software build process.

The `cmake` section displays the version of CMake.

This section is displayed only when the current directory is within a CMake project, meaning:

* Upsearch finds `CMakeLists.txt`, `CMakeCache.txt`, `cmake_install.cmake`, or `CMakeFiles`

## Options

| Variable                  |              Default               | Meaning                             |
| :------------------------ | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_CMAKE_SHOW`    |               `true`               | Show section                        |
| `SPACESHIP_CMAKE_ASYNC`   |               `true`               | Render section asynchronously       |
| `SPACESHIP_CMAKE_PREFIX`  | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_CMAKE_SUFFIX`  | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_CMAKE_SYMBOL`  |               `△ `                 | Symbol displayed before the section |
| `SPACESHIP_CMAKE_COLOR`   |               `blue`               | Section's color                     |
