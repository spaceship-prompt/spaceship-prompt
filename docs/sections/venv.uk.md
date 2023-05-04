# Virtualenv `venv`

!!! info "Інформація"
    [**virtualenv**](https://virtualenv.pypa.io) є інструментом для створення ізольованого середовища Python.

Секція `venv` показує назву віртуального середовища.

## Налаштування загальних назв

Для кращої зручності, можна налаштувати загальні імена для ваших віртуальних середовищ. Якщо тека virtualenv в _масиві_ `SPACESHIP_VENV_GENERIC_NAMES`, натомість використовуйте її батьківську теку як назву.

```zsh title=".zshrc"
SPACESHIP_VENV_GENERIC_NAMES=(virtualenv venv .venv generic-name)
```

## Опції

| Змінна                         |          За замовчуванням          | Пояснення                                                            |
|:------------------------------ |:----------------------------------:| -------------------------------------------------------------------- |
| `SPACESHIP_VENV_SHOW`          |               `true`               | Показати секцію                                                      |
| `SPACESHIP_VENV_ASYNC`         |              `false`               | Рендерити секцію асинхронно                                          |
| `SPACESHIP_VENV_PREFIX`        | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                                                       |
| `SPACESHIP_VENV_SUFFIX`        | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                                        |
| `SPACESHIP_VENV_SYMBOL`        |                `·`                 | Символ, що відображається перед секцією                              |
| `SPACESHIP_VENV_GENERIC_NAMES` |     `(virtualenv venv .venv)`      | Звичайні назви тек. Батьківська тека буде використовуватися як назва |
| `SPACESHIP_VENV_COLOR`         |               `blue`               | Колір секції                                                         |
