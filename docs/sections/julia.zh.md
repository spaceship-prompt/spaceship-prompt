# Julia `julia`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Julia**](https://julialang.org) is a high-level, high-performance dynamic programming language for numerical computing.

The `julia` section displays the version of the Julia compiler.

This section is displayed only when:

* `julia` compiler is available.
* The current directory contains `.jl` files.
* The upsearch finds a `Project.toml`, `JuliaProject.toml` or `Manifest.toml` file.

## Options

| Variable                 |              Default               | Meaning                             |
|:------------------------ |:----------------------------------:| ----------------------------------- |
| `SPACESHIP_JULIA_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_JULIA_ASYNC`  |               `true`               | Render section asynchronously       |
| `SPACESHIP_JULIA_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_JULIA_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_JULIA_SYMBOL` |                `ஃ·`                | Symbol displayed before the section |
| `SPACESHIP_JULIA_COLOR`  |              `green`               | Section's color                     |
