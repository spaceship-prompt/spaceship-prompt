# Virtualenv `venv`

!!! info
    [**virtualenv**](https://virtualenv.pypa.io) is a tool to create isolated Python environments.

The `venv` section shows the current virtualenv name.

## Configuring generic names

For better readability, you can configure the generic names for your virtualenvs. If the virtualenv folder is in `SPACESHIP_VENV_GENERIC_NAMES` _array_, than use its parent directory as its name instead.

```zsh title=".zshrc"
SPACESHIP_VENV_GENERIC_NAMES=(virtualenv venv .venv generic-name)
```

## Опції

| Змінна                         |          За замовчуванням          | Пояснення                                                        |
|:------------------------------ |:----------------------------------:| ---------------------------------------------------------------- |
| `SPACESHIP_VENV_SHOW`          |               `true`               | Показати секцію                                                  |
| `SPACESHIP_VENV_ASYNC`         |              `false`               | Рендерити секцію асинхронно                                      |
| `SPACESHIP_VENV_PREFIX`        | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                                                   |
| `SPACESHIP_VENV_SUFFIX`        | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                                    |
| `SPACESHIP_VENV_SYMBOL`        |                `·`                 | Символ, що відображається перед секцією                          |
| `SPACESHIP_VENV_GENERIC_NAMES` |     `(virtualenv venv .venv)`      | Generic folder names. Parent folder will be used as name instead |
| `SPACESHIP_VENV_COLOR`         |               `blue`               | Колір секції                                                     |
