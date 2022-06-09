# Python `python`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Python**](https://www.python.org) is a high-level, interpreted, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.

The `python` section displays the version of the Python.

This section is displayed only when the current directory is within a Python project, meaning:

* Upsearch finds a `requirements.txt`, `Pipfile` or `pyproject.toml` file
* Current directory contains any `.py` file

## Options

| Variable                  |              Default               | Meaning                             |
| :------------------------ | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_PYTHON_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_PYTHON_ASYNC`  |               `true`               | Render section asynchronously       |
| `SPACESHIP_PYTHON_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_PYTHON_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_PYTHON_SYMBOL` |               `🐍·`                | Symbol displayed before the section |
| `SPACESHIP_PYTHON_COLOR`  |              `yellow`              | Section's color                     |
