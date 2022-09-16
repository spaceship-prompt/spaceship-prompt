# Bun `bun`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Bun**](https://bun.sh) це швидкий "все в одному" рантайм для JavaScript.

Секція `bun` показує версію Bun.

Ця секція відображається лише тоді, коли:

* Пошук вгору знаходить файл `bun.lockb`
* Пошук вгору знаходить файл `bunfig.toml`

## Options

| Variable               |          За замовчуванням          | Пояснення                               |
|:---------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_BUN_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_BUN_ASYNC`  |               `true`               | Render section asynchronously           |
| `SPACESHIP_BUN_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_BUN_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                        |
| `SPACESHIP_BUN_SYMBOL` |                `🍞`                 | Символ, що відображається перед секцією |
| `SPACESHIP_BUN_COLOR`  |             `#fbf0df`              | Колір секції                            |
