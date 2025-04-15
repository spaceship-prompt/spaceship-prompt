# Xcode `xcode`

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Xcode**](https://developer.apple.com/xcode/) є середовищем розробки для iOS, macOS, watchOS і tvOS.

Секція `Xcode` відображає версію Xcode.

Локальна версія має більш пріоритетний за глобальну версію.

## Опції

| Змінна                        |          За замовчуванням          | Пояснення                                                 |
|:----------------------------- |:----------------------------------:| --------------------------------------------------------- |
| `SPACESHIP_XCODE_ASYNC`       |               `true`               | Рендерити секцію асинхронно                               |
| `SPACESHIP_XCODE_SHOW_LOCAL`  |               `true`               | Поточна локальна версія Xcode на основі даних від [xcenv] |
| `SPACESHIP_XCODE_SHOW_GLOBAL` |              `false`               | Глобальна версія Xcode на основі даних [xcenv]            |
| `SPACESHIP_XCODE_PREFIX`      | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                                            |
| `SPACESHIP_XCODE_SUFFIX`      | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                             |
| `SPACESHIP_XCODE_SYMBOL`      |                `🛠·`                | Символ, що відображається перед секцією                   |
| `SPACESHIP_XCODE_COLOR`       |               `blue`               | Колір секції                                              |
