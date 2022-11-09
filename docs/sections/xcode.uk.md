# Xcode `xcode`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Xcode**](https://developer.apple.com/xcode/) is a development environment for iOS, macOS, watchOS, and tvOS.

Секція `Xcode` відображає версію Xcode.

Локальна версія має більш пріоритетний за глобальну версію.

## Опції

| Змінна                        |          За замовчуванням          | Пояснення                                    |
|:----------------------------- |:----------------------------------:| -------------------------------------------- |
| `SPACESHIP_XCODE_ASYNC`       |               `true`               | Рендерити секцію асинхронно                  |
| `SPACESHIP_XCODE_SHOW_LOCAL`  |               `true`               | Current local Xcode version based on [xcenv] |
| `SPACESHIP_XCODE_SHOW_GLOBAL` |              `false`               | Global Xcode version based on [xcenv]        |
| `SPACESHIP_XCODE_PREFIX`      | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                               |
| `SPACESHIP_XCODE_SUFFIX`      | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                |
| `SPACESHIP_XCODE_SYMBOL`      |                `🛠·`                | Символ, що відображається перед секцією      |
| `SPACESHIP_XCODE_COLOR`       |               `blue`               | Колір секції                                 |
