# Julia `julia`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Julia**](https://julialang.org) is a high-level, high-performance dynamic programming language for numerical computing.

The `julia` section displays the version of the Julia compiler.

This section is displayed only when:

* `julia` compiler is available.
* The current directory contains `.jl` files.
* The upsearch finds a `Project.toml`, `JuliaProject.toml` or `Manifest.toml` file.

## Опції

| Змінна                   |          За замовчуванням          | Пояснення                               |
|:------------------------ |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_JULIA_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_JULIA_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_JULIA_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_JULIA_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_JULIA_SYMBOL` |                `ஃ·`                | Символ, що відображається перед секцією |
| `SPACESHIP_JULIA_COLOR`  |              `green`               | Колір секції                            |
