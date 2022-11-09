# Crystal `crystal`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Crystal**](https://www.crystal-lang.org) is a general-purpose, object-oriented programming language.

The `crystal` section displays the Crystal version.

Ця секція відображається лише тоді, коли поточна директорія:

* Upsearch finds `shard.yaml` file
* Current directory contains any file with `.cr` extension

## Опції

| Змінна                     |          За замовчуванням          | Пояснення                               |
|:-------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_CRYSTAL_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_CRYSTAL_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_CRYSTAL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_CRYSTAL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_CRYSTAL_SYMBOL` |                `🔮`                 | Символ, що відображається перед секцією |
| `SPACESHIP_CRYSTAL_COLOR`  |               `069`                | Колір секції                            |
