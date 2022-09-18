# Ім’я хоста `host`

The `host` section displays the hostname of the current machine.

By default, it's displayed only when the machine is connected via SSH (`$SSH_CONNECTION` is not empty).

## Завжди показувати ім'я хоста

If you want the hostname to be always displayed, set the `SPACESHIP_HOST_SHOW` option to `always`.

```zsh title=".zshrc"
# This sets host to be always displayed
SPACESHIP_HOST_SHOW="always"
```

## Відображення повного хоста

By default, the hostname is displayed in a short form (`%m`). If you want to see the full information (`%M`), set the `SPACESHIP_HOST_SHOW_FULL` option to `true`.

```zsh title=".zshrc"
# This displays the full information about the hostname
SPACESHIP_HOST_SHOW_FULL=true
```

## Опції

| Змінна                     |          За замовчуванням          | Пояснення                                        |
|:-------------------------- |:----------------------------------:| ------------------------------------------------ |
| `SPACESHIP_HOST_SHOW`      |               `true`               | Показувати секцію (`true`, `false` або `always`) |
| `SPACESHIP_HOST_SHOW_FULL` |              `false`               | Показувати повне ім'я хоста                      |
| `SPACESHIP_HOST_PREFIX`    |               `at·`                | Префікс секції                                   |
| `SPACESHIP_HOST_SUFFIX`    | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                    |
| `SPACESHIP_HOST_COLOR`     |               `blue`               | Колір секції                                     |
| `SPACESHIP_HOST_COLOR_SSH` |              `green`               | Колір секції при підключенні SSH                 |
