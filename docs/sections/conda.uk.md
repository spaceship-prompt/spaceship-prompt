# Conda virtualenv `conda`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Conda**](https://conda.io) is an open-source package management system and environment management system for various languages, like Python, R, Ruby, Lua, Scala, Java, JavaScript, C/ C++, Fortran, and more.

The `conda` section shows Conda virtual environment.

This section is only displayed when you have a `conda` command available in your path and a `CONDA_DEFAULT_ENV` environment variable is not empty.

!!! tip
    Disable the native conda prompt by executing `conda config --set changeps1 False`.

## Опції

| Змінна                    |          За замовчуванням          | Пояснення                                                |
|:------------------------- |:----------------------------------:| -------------------------------------------------------- |
| `SPACESHIP_CONDA_SHOW`    |               `true`               | Показати секцію                                          |
| `SPACESHIP_CONDA_ASYNC`   |              `false`               | Рендерити секцію асинхронно                              |
| `SPACESHIP_CONDA_PREFIX`  | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                                           |
| `SPACESHIP_CONDA_SUFFIX`  | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                            |
| `SPACESHIP_CONDA_SYMBOL`  |                `🅒·`                | Символ, що відображається перед секцією                  |
| `SPACESHIP_CONDA_COLOR`   |               `blue`               | Колір секції                                             |
| `SPACESHIP_CONDA_VERBOSE` |               `true`               | Toggle to truncate environment names under custom prefix |
