# Код виходу `exit_code`

!!! warning "Цю секцію приховано за замовчуванням"

Розділ `exit_code` відображає код виходу останньої команди.

## Відображення секції

Set `SPACESHIP_EXIT_CODE_SHOW` to `true` in your `.zshrc`, if you need to show the exit code of the last command.

```zsh title=".zshrc"
SPACESHIP_EXIT_CODE_SHOW=true
```

## Опції

| Змінна                       | За замовчуванням | Пояснення                               |
|:---------------------------- |:----------------:| --------------------------------------- |
| `SPACESHIP_EXIT_CODE_SHOW`   |     `false`      | Показати секцію                         |
| `SPACESHIP_EXIT_CODE_PREFIX` |        -         | Префікс секції                          |
| `SPACESHIP_EXIT_CODE_SUFFIX` |        -         | Суфікс секції                           |
| `SPACESHIP_EXIT_CODE_SYMBOL` |       `✘`        | Символ, що відображається перед секцією |
| `SPACESHIP_EXIT_CODE_COLOR`  |      `red`       | Колір секції                            |
