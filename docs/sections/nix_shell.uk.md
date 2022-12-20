# Оболонка Nix `nix_shell`

!!! info "Інформація"
    [**Оболонку Nix**](https://nixos.org/manual/nix/stable/command-ref/nix-shell.html) можна використати для створення віртуального середовища за допомогою команди nix-shell.

`nix_shell` показує, чи є оболонка чистою/нечистою, а також назву оболонки, якщо її вказано.

Ця секція показується лише тоді, коли nix-shell активовано.

## Параметри

| Змінна                       |               Типово               | Опис                                     |
|:---------------------------- |:----------------------------------:| ---------------------------------------- |
| `SPACESHIP_NIX_SHELL_SHOW`   |               `true`               | Показати секцію                          |
| `SPACESHIP_NIX_SHELL_ASYNC`  |              `false`               | Обробляти секцію асинхронно              |
| `SPACESHIP_NIX_SHELL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                           |
| `SPACESHIP_NIX_SHELL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                            |
| `SPACESHIP_NIX_SHELL_SYMBOL` |                `❄`                 | Символ, що показується на початку секції |
| `SPACESHIP_NIX_SHELL_COLOR`  |              `yellow`              | Колір секції                             |
