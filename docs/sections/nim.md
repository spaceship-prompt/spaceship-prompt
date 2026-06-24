# Nim `nim`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Nim**](https://nim-lang.org) is a statically typed compiled systems programming language with a focus on efficiency, expressiveness, and elegance.

The `nim` section displays the Nim compiler version.

This section is displayed only when the current directory:

* Upsearch finds a `*.nimble`, `nim.cfg`, or `config.nims` file
* Current directory contains any file with `.nim` extension

## Options

| Variable                 |              Default               | Meaning                             |
| :----------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_NIM_SHOW`     |               `true`               | Show section                        |
| `SPACESHIP_NIM_ASYNC`    |               `true`               | Render section asynchronously       |
| `SPACESHIP_NIM_PREFIX`   | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_NIM_SUFFIX`   | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_NIM_SYMBOL`   |               `👑 `                | Symbol displayed before the section |
| `SPACESHIP_NIM_COLOR`    |              `yellow`              | Section's color                     |
