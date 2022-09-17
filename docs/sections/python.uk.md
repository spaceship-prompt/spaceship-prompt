# Python `python`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Python**](https://www.python.org) is a high-level, interpreted, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.

The `python` section displays the version of the Python.

This section is displayed only when the current directory is within a Python project, meaning:

* Upsearch finds a `requirements.txt`, `Pipfile` or `pyproject.toml` file
* Current directory contains any `.py` file

## Опції

| Змінна                    |              Default               | Meaning                                 |
|:------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_PYTHON_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_PYTHON_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_PYTHON_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_PYTHON_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_PYTHON_SYMBOL` |                `🐍·`                | Символ, що відображається перед секцією |
| `SPACESHIP_PYTHON_COLOR`  |              `yellow`              | Колір секції                            |
