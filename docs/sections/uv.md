# uv-managed virtualenv (uv)

!!! important "This section is rendered asynchronously by default"

!!! info
    [**uv**](https://docs.astral.sh/uv/) is a workflow tool, written in Rust.

The `uv` section displays the version of the Python inside the `.venv` environment created by `uv` at the root of the project.

This section is displayed only when the current directory is within a uv project, meaning:

* Upsearch finds a `uv.lock` file
* Current directory contains a `.venv` directory with a valid Python interpreter

## Options

| Variable              |              Default               | Meaning                             |
| :-------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_UV_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_UV_ASYNC`  |               `true`               | Render section asynchronously       |
| `SPACESHIP_UV_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_UV_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_UV_SYMBOL` |               `uv·`                | Symbol displayed before the section |
| `SPACESHIP_UV_COLOR`  |              `yellow`              | Section's color                     |
