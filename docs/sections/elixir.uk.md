# Elixir `elixir`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Elixir**](https://elixir-lang.org) is a dynamic, functional language for building scalable and maintainable applications.

The `elixir` section displays the version of the Elixir.

Ця секція відображається лише тоді, коли:

* Contains a `mix.exs` file
* Contains any other file with `.ex` or `.exs` extension

## Setting the default Elixir version

If you want to avoid showing the Elixir section for a specific Elixir version (for example system installed version), use the `SPACESHIP_ELIXIR_DEFAULT_VERSION` environment variable. The section will be hidden if the current version of the Elixir is equal to the one specified in the variable.

```zsh title=".zshrc"
SPACESHIP_ELIXIR_DEFAULT_VERSION="1.13.4"
```

## Опції

| Змінна                             |              Default               | Meaning                                 |
|:---------------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_ELIXIR_SHOW`            |               `true`               | Show section                            |
| `SPACESHIP_ELIXIR_ASYNC`           |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_ELIXIR_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                        |
| `SPACESHIP_ELIXIR_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_ELIXIR_DEFAULT_VERSION` |                 -                  | Elixir version to be treated as default |
| `SPACESHIP_ELIXIR_SYMBOL`          |                `💧·`                | Symbol before the section               |
| `SPACESHIP_ELIXIR_COLOR`           |             `magenta`              | Колір секції                            |
