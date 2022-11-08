# Символ `char`

`char` is a section responsible for rendering a prompt character. By default, Spaceship uses `➜` as a prompt character.

When the previous command was executed successfully, the prompt character is green (`SPACESHIP_CHAR_COLOR_SUCCESS`). Otherwise, if the previous command exited with non-zero code, the prompt character is red (`SPACESHIP_CHAR_COLOR_FAILURE`).

## Changing prompt character for the root user

By default, Spaceship doesn't change prompt character when executing commands as a root user. You can change the custom root prompt by setting a `SPACESHIP_CHAR_SYMBOL_ROOT` option.

```zsh title=".zshrc"
SPACESHIP_CHAR_SYMBOL_ROOT="#"
```

## Опції

| Змінна                            |     За замовчуванням     | Пояснення                                                            |
|:--------------------------------- |:------------------------:| -------------------------------------------------------------------- |
| `SPACESHIP_CHAR_PREFIX`           |            ``            | Prefix before prompt character                                       |
| `SPACESHIP_CHAR_SUFFIX`           |            ``            | Suffix after prompt character                                        |
| `SPACESHIP_CHAR_SYMBOL`           |           `➜`            | Prompt character to be shown before any command                      |
| `SPACESHIP_CHAR_SYMBOL_ROOT`      | `$SPACESHIP_CHAR_SYMBOL` | Prompt character to be shown before any command for the root user    |
| `SPACESHIP_CHAR_SYMBOL_SECONDARY` | `$SPACESHIP_CHAR_SYMBOL` | Secondary prompt character to be shown for incomplete commands       |
| `SPACESHIP_CHAR_COLOR_SUCCESS`    |         `green`          | Color of prompt character if last command completes successfully     |
| `SPACESHIP_CHAR_COLOR_FAILURE`    |          `red`           | Color of prompt character if last command returns non-zero exit-code |
| `SPACESHIP_CHAR_COLOR_SECONDARY`  |         `yellow`         | Color of secondary prompt character                                  |
