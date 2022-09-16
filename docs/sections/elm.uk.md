# Elm `elm`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Elm**](https://elm-lang.org) is a functional programming language for building interactive and performant user interfaces.

The `elm` section displays the Elm version.

This section is displayed only when the current directory:

* Is within an Elm project (upsearch finds `elm.json`, `elm-package.json`, or `elm-stuff`)
* Contains any `.elm` file

## Опції

| Змінна                 |          За замовчуванням          | Пояснення                               |
|:---------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_ELM_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_ELM_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_ELM_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_ELM_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_ELM_SYMBOL` |                `🌳·`                | Символ, що відображається перед секцією |
| `SPACESHIP_ELM_COLOR`  |               `cyan`               | Колір секції                            |
