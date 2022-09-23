# Exit code `exit_code`

!!! warning "This section is hidden by default"

The `exit_code` section displays the exit code of the last command.

## Displaying the section

Set `SPACESHIP_EXIT_CODE_SHOW` to `true` in your `.zshrc`, if you need to show the exit code of the last command.

```zsh title=".zshrc"
SPACESHIP_EXIT_CODE_SHOW=true
```

## Options

| Variable                     | Default | Meaning                             |
|:---------------------------- |:-------:| ----------------------------------- |
| `SPACESHIP_EXIT_CODE_SHOW`   | `false` | Show section                        |
| `SPACESHIP_EXIT_CODE_PREFIX` |    -    | Section's prefix                    |
| `SPACESHIP_EXIT_CODE_SUFFIX` |    -    | Section's suffix                    |
| `SPACESHIP_EXIT_CODE_SYMBOL` |   `✘`   | Symbol displayed before the section |
| `SPACESHIP_EXIT_CODE_COLOR`  |  `red`  | Section's color                     |
