# Python `python`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Python**](https://www.python.org) is a high-level, interpreted, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.

Секція `python` відображає версію Python.

Ця секція відображається лише тоді, коли поточний каталог знаходиться у Python-проєкті, тобто:

* Пошук вгору знаходить файли `requirements.txt`, `Pipfile` або `pyproject.toml`
* Поточна папка містить будь-який файл `.py`

## Опції

| Змінна                    |          За замовчуванням          | Пояснення                               |
|:------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_PYTHON_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_PYTHON_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_PYTHON_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_PYTHON_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_PYTHON_SYMBOL` |                `🐍·`                | Символ, що відображається перед секцією |
| `SPACESHIP_PYTHON_COLOR`  |              `yellow`              | Колір секції                            |
