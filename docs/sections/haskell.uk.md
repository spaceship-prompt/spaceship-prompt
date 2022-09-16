# Haskell `haskell`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Haskell**](https://www.haskell.org) is a general-purpose purely functional programming language, with non-strict semantics.

The `haskell` section displays the version of the Haskell compiler.

This section is displayed only within Haskell projects, meaning:

* Upsearch finds a `stack.yaml` file.
* The current directory contains a file with `.hs` directory.

## Options

| Variable                   |              Default               | Meaning                             |
|:-------------------------- |:----------------------------------:| ----------------------------------- |
| `SPACESHIP_HASKELL_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_HASKELL_ASYNC`  |               `true`               | Render section asynchronously       |
| `SPACESHIP_HASKELL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_HASKELL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_HASKELL_SYMBOL` |                `λ·`                | Symbol displayed before the section |
| `SPACESHIP_HASKELL_COLOR`  |               `red`                | Section's color                     |
