# Async `async`

Розділ `async` використовується як заповнювач для розділів, які ще не представлені. Цей розділ відображається лише тоді, коли ще залишаються розділи, які повинні відобразитись згодом.

За замовчуванням Spaceship працює асинхронно. It displays the prompt immediately while checking the environment, then it updates the prompt with new information.

Optionally, you can enable displaying the number of sections that are being processed via the `SPACESHIP_ASYNC_SHOW_COUNT` environment variable:

```sh title=".zshrc"
SPACESHIP_ASYNC_SHOW_COUNT=true
```

## Опції

| Змінна                       | За замовчуванням | Пояснення                               |
|:---------------------------- |:----------------:| --------------------------------------- |
| `SPACESHIP_ASYNC_SHOW`       |      `true`      | Показати секцію                         |
| `SPACESHIP_ASYNC_SHOW_COUNT` |     `false`      | Показувати кількість задач              |
| `SPACESHIP_ASYNC_PREFIX`     |        -         | Префікс секції                          |
| `SPACESHIP_ASYNC_SUFFIX`     |        -         | Суфікс секції                           |
| `SPACESHIP_ASYNC_SYMBOL`     |       `…`        | Символ, що відображається перед секцією |
| `SPACESHIP_ASYNC_COLOR`      |      `gray`      | Колір секції                            |

