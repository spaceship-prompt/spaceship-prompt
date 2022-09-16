# Elixir `elixir`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Elixir**](https://elixir-lang.org) is a dynamic, functional language for building scalable and maintainable applications.

Секція `elixir` відображає версію Elixir.

This section is displayed only when the current directory:

* Містить файл `mix.exs`
* Містить будь-який інший файл з розширенням `.ex` або `.exs`

## Встановлення версії Elixir за замовчуванням

If you want to avoid showing the Elixir section for a specific Elixir version (for example system installed version), use the `SPACESHIP_ELIXIR_DEFAULT_VERSION` environment variable. The section will be hidden if the current version of the Elixir is equal to the one specified in the variable.

```zsh title=".zshrc"
SPACESHIP_ELIXIR_DEFAULT_VERSION="1.13.4"
```

## Options

| Variable                           |          За замовчуванням          | Пояснення                               |
|:---------------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_ELIXIR_SHOW`            |               `true`               | Показати секцію                         |
| `SPACESHIP_ELIXIR_ASYNC`           |               `true`               | Render section asynchronously           |
| `SPACESHIP_ELIXIR_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_ELIXIR_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_ELIXIR_DEFAULT_VERSION` |                 -                  | Версія Elixir, яку слід вважати типовою |
| `SPACESHIP_ELIXIR_SYMBOL`          |                `💧·`                | Символ перед секцією                    |
| `SPACESHIP_ELIXIR_COLOR`           |             `magenta`              | Section's color                         |
