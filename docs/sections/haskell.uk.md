# Haskell `haskell`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Haskell**](https://www.haskell.org) is a general-purpose purely functional programming language, with non-strict semantics.

The `haskell` section displays the version of the Haskell compiler.

This section is displayed only within Haskell projects, meaning:

* Upsearch finds a `stack.yaml` file.
* The current directory contains a file with `.hs` directory.

## Опції

| Змінна                     |              Default               | Meaning                                 |
|:-------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_HASKELL_SHOW`   |               `true`               | Show section                            |
| `SPACESHIP_HASKELL_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_HASKELL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                        |
| `SPACESHIP_HASKELL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_HASKELL_SYMBOL` |                `λ·`                | Символ, що відображається перед секцією |
| `SPACESHIP_HASKELL_COLOR`  |               `red`                | Колір секції                            |
