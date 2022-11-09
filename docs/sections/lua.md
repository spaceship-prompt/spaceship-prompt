# Lua `lua`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Lua**](https://lua.org/) is a powerful, efficient, lightweight, embeddable scripting language

The `lua` section displays the Lua version.

This section is displayed only when the current directory:

* Upsearch finds `.lua-version` file or `lua` directory
* Current directory contains any file with `.lua` extension

## Options

| Variable                   |              Default               | Meaning                             |
| :------------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_LUA_SHOW`       |               `true`               | Show section                        |
| `SPACESHIP_LUA_ASYNC`      |               `true`               | Render section asynchronously       |
| `SPACESHIP_LUA_PREFIX`     | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_LUA_SUFFIX`     | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_LUA_SYMBOL`     |               `🌙 `                | Symbol displayed before the section |
| `SPACESHIP_LUA_COLOR`      |               `cyan`               | Section's color                     |
