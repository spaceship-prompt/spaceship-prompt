# Conda virtualenv `conda`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info "Інформація"
    [**Conda**](https://conda.io) є системою керування пакунками з відкритими сирцями та системою управління середовищами для різних мов, таких як Python, R, Ruby, Lua, Scala, Java, JavaScript, C/ C++, Fortran та інші.

Секція `conda` показує інформацію про віртуальне середовище Conda.

Ця секція показується лише тоді, коли команда `conda`, доступна у через змінну PATH та значення змінної `CONDA_DEFAULT_ENV` не є порожнім.

!!! tip "Порада"
    Вимкнути вбудований командний рядок conda можна за допомоги `conda config --set changeps1 False`.

## Параметри

| Змінна                    |          За замовчуванням          | Пояснення                                                                   |
|:------------------------- |:----------------------------------:| --------------------------------------------------------------------------- |
| `SPACESHIP_CONDA_SHOW`    |               `true`               | Показати секцію                                                             |
| `SPACESHIP_CONDA_ASYNC`   |              `false`               | Рендерити секцію асинхронно                                                 |
| `SPACESHIP_CONDA_PREFIX`  | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                                                              |
| `SPACESHIP_CONDA_SUFFIX`  | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                                               |
| `SPACESHIP_CONDA_SYMBOL`  |                `🅒·`                | Символ, що відображається перед секцією                                     |
| `SPACESHIP_CONDA_COLOR`   |               `blue`               | Колір секції                                                                |
| `SPACESHIP_CONDA_VERBOSE` |               `true`               | Перемикнутися на скорочення назви середовища використовуючи власний префікс |
