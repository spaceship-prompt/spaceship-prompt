# Bun `bun`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Bun**](https://bun.sh) is a fast all-in-one JavaScript runtime.

The `bun` section displays the Bun version.

This section is displayed only when the current directory:

* Upsearch finds `bun.lockb` file
* Upsearch finds `bun.lock` file
* Upsearch finds `bunfig.toml` file

## Options

| Variable               |              Default               | Meaning                             |
| :--------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_BUN_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_BUN_ASYNC`  |               `true`               | Render section asynchronously       |
| `SPACESHIP_BUN_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_BUN_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_BUN_SYMBOL` |                `🍞 `                | Symbol displayed before the section |
| `SPACESHIP_BUN_COLOR`  |              `#fbf0df`             | Section's color                     |
