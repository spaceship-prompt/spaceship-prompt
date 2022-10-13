# Lua `lua`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Lua**](https://lua.org/) is a powerful, efficient, lightweight, embeddable scripting language

The `lua` section displays the Lua version.

Ця секція відображається лише тоді, коли поточна директорія:

* Upsearch finds `.lua-version` file or `lua` directory
* Current directory contains any file with `.lua` extension

## Опції

| Змінна                 |          За замовчуванням          | Пояснення                               |
|:---------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_LUA_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_LUA_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_LUA_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_LUA_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_LUA_SYMBOL` |                `🌙`                 | Символ, що відображається перед секцією |
| `SPACESHIP_LUA_COLOR`  |               `cyan`               | Колір секції                            |
