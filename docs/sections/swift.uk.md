# Swift `swift`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Swift**](https://swift.org) is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. and the open-source community.

The `swift` section displays the version of Swift.

The local version has more priority than the global one.

## Опції

| Змінна                        |              Default               | Meaning                                         |
|:----------------------------- |:----------------------------------:| ----------------------------------------------- |
| `SPACESHIP_SWIFT_ASYNC`       |               `true`               | Рендерити секцію асинхронно                     |
| `SPACESHIP_SWIFT_SHOW_LOCAL`  |               `true`               | Current local Swift version based on [swiftenv] |
| `SPACESHIP_SWIFT_SHOW_GLOBAL` |              `false`               | Global Swift version based on [swiftenv]        |
| `SPACESHIP_SWIFT_PREFIX`      | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                                  |
| `SPACESHIP_SWIFT_SUFFIX`      | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                   |
| `SPACESHIP_SWIFT_SYMBOL`      |                `🐦·`                | Символ, що відображається перед секцією         |
| `SPACESHIP_SWIFT_COLOR`       |              `yellow`              | Колір секції                                    |
