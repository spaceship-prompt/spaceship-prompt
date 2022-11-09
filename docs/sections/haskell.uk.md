# Haskell `haskell`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Haskell**](https://www.haskell.org) is a general-purpose purely functional programming language, with non-strict semantics.

The `haskell` section displays the version of the Haskell compiler.

This section is displayed only within Haskell projects, meaning:

* Пошук вгору знаходить файл `stack.yaml`.
* The current directory contains a file with `.hs` directory.

## Опції

| Змінна                     |          За замовчуванням          | Пояснення                               |
|:-------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_HASKELL_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_HASKELL_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_HASKELL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_HASKELL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_HASKELL_SYMBOL` |                `λ·`                | Символ, що відображається перед секцією |
| `SPACESHIP_HASKELL_COLOR`  |               `red`                | Колір секції                            |
