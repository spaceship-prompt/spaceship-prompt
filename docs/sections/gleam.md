# Gleam (`gleam`)

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Gleam**](https://gleam.run/) is a friendly language for building type-safe systems that scale.

The `gleam` section displays the Gleam version.

This section is displayed only when the current directory is within a Gleam project, meaning:

- Upsearch finds `gleam.toml` or `manifest.toml` file
- Current directory contains any `.gleam` file

## Options

| Variable                 |              Default               | Meaning                             |
| :----------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_GLEAM_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_GLEAM_ASYNC`  |               `true`               | Render section asynchronously       |                 |
| `SPACESHIP_GLEAM_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_GLEAM_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_GLEAM_SYMBOL` |               `⭐·`                | Symbol displayed before the section |
| `SPACESHIP_GLEAM_COLOR`  |             `#ff87df`              | Section's color                     |
