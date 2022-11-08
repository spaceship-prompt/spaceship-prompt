# Ім’я користувача `user`

The `user` section shows the current user's username. By default, it's displayed only when:

* the machine is connected via SSH (`$SSH_CONNECTION` is not empty)
* username is not the same as `$LOGNAME`
* username is a root user

The root user is highlighted in `SPACESHIP_USER_COLOR_ROOT` color (red as default).

## Controlling when to show the `user` section

`SPACESHIP_USER_SHOW` defines when to show the `user` section. Ось можливі значення:

| `SPACESHIP_USER_SHOW` | Показати локально | Показувати віддалено |
|:---------------------:|:----------------- |:-------------------- |
|        `false`        | Ніколи            | Ніколи               |
|       `always`        | Завжди            | Завжди               |
|        `true`         | Якщо потрібно     | Завжди               |
|       `needed`        | Якщо потрібно     | Якщо потрібно        |

*Якщо потрібно,* означає поведінку за замовчуванням.

## Опції

| Змінна                      |          За замовчуванням          | Пояснення                                                  |
|:--------------------------- |:----------------------------------:| ---------------------------------------------------------- |
| `SPACESHIP_USER_SHOW`       |               `true`               | Показувати секцію (`true`, `false`, `always` або `needed`) |
| `SPACESHIP_USER_PREFIX`     |              `with·`               | Префікс секції                                             |
| `SPACESHIP_USER_SUFFIX`     | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                              |
| `SPACESHIP_USER_COLOR`      |              `yellow`              | Колір секції                                               |
| `SPACESHIP_USER_COLOR_ROOT` |               `red`                | Колір секції, якщо користувачем є root                     |



