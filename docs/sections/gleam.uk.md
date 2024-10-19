# Gleam (`gleam`)

!!! important "Типово ця секція обробляється асинхронно"

!!! info
[**Gleam**] (https://gleam.run/) — дружня мова для побудови типо-безпечних систем, які масштабуються.

Секція `gleam` показує версію Gleam.

Ця секція показується лише тоді, коли поточна тека знаходиться в проєкті Gleam, тобто:

- Пошук вгору знаходить файл `gleam.toml` або `manifest.toml`
- Поточна тека містить файл `.gleam`

## Параметри

| Змінна                   |               Типово               | Опис                                     |   |
| :----------------------- | :--------------------------------: | ---------------------------------------- | - |
| `SPACESHIP_GLEAM_SHOW`   |               `true`               | Показати секцію                          |   |
| `SPACESHIP_GLEAM_ASYNC`  |               `true`               | Обробляти секцію асинхронно              |   |
| `SPACESHIP_GLEAM_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                           |   |
| `SPACESHIP_GLEAM_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                            |   |
| `SPACESHIP_GLEAM_SYMBOL` |                `⭐·`                | Символ, що показується на початку секції |   |
| `SPACESHIP_GLEAM_COLOR`  |              `#ff87df`             | Колір секції                             |   |
