# Elixir `elixir`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Elixir**](https://elixir-lang.org) is a dynamic, functional language for building scalable and maintainable applications.

The `elixir` section displays the version of the Elixir.

This section is displayed only when the current directory:

* Contains a `mix.exs` file
* Contains any other file with `.ex` or `.exs` extension

## Setting the default Elixir version

If you want to avoid showing the Elixir section for a specific Elixir version (for example system installed version), use the `SPACESHIP_ELIXIR_DEFAULT_VERSION` environment variable. The section will be hidden if the current version of the Elixir is equal to the one specified in the variable.

```zsh title=".zshrc"
SPACESHIP_ELIXIR_DEFAULT_VERSION="1.13.4"
```

## Options

| Variable                           |              Default               | Meaning                                 |
|:---------------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_ELIXIR_SHOW`            |               `true`               | Show section                            |
| `SPACESHIP_ELIXIR_ASYNC`           |               `true`               | Render section asynchronously           |
| `SPACESHIP_ELIXIR_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                        |
| `SPACESHIP_ELIXIR_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                        |
| `SPACESHIP_ELIXIR_DEFAULT_VERSION` |                 -                  | Elixir version to be treated as default |
| `SPACESHIP_ELIXIR_SYMBOL`          |                `💧·`                | Symbol before the section               |
| `SPACESHIP_ELIXIR_COLOR`           |             `magenta`              | Section's color                         |
