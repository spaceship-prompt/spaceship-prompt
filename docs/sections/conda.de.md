# Conda virtualenv `conda`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Conda**](https://conda.io) is an open-source package management system and environment management system for various languages, like Python, R, Ruby, Lua, Scala, Java, JavaScript, C/ C++, Fortran, and more.

The `conda` section shows Conda virtual environment.

This section is only displayed when you have a `conda` command available in your path and a `CONDA_DEFAULT_ENV` environment variable is not empty.

!!! tip
    Disable the native conda prompt by executing `conda config --set changeps1 False`.

## Options

| Variable                  |              Default               | Meaning                                                  |
|:------------------------- |:----------------------------------:| -------------------------------------------------------- |
| `SPACESHIP_CONDA_SHOW`    |               `true`               | Show section                                             |
| `SPACESHIP_CONDA_ASYNC`   |              `false`               | Render section asynchronously                            |
| `SPACESHIP_CONDA_PREFIX`  | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                                         |
| `SPACESHIP_CONDA_SUFFIX`  | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                                         |
| `SPACESHIP_CONDA_SYMBOL`  |                `🅒·`                | Symbol displayed before the section                      |
| `SPACESHIP_CONDA_COLOR`   |               `blue`               | Section's color                                          |
| `SPACESHIP_CONDA_VERBOSE` |               `true`               | Toggle to truncate environment names under custom prefix |
