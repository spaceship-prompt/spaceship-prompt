# Hostname `host`

The `host` section displays the hostname of the current machine.

By default, it's displayed only when the machine is connected via SSH (`$SSH_CONNECTION` is not empty).

## Always displaying hostname

If you want the hostname to be always displayed, set the `SPACESHIP_HOST_SHOW` option to `always`.

```zsh title=".zshrc"
# This sets host to be always displayed
SPACESHIP_HOST_SHOW="always"
```

## Displaying full hostname

By default, the hostname is displayed in a short form (`%m`). If you want to see the full information (`%M`), set the `SPACESHIP_HOST_SHOW_FULL` option to `true`.

```zsh title=".zshrc"
# This displays the full information about the hostname
SPACESHIP_HOST_SHOW_FULL=true
```

## Options

| Variable                   |              Default               | Meaning                                    |
| :------------------------- | :--------------------------------: | ------------------------------------------ |
| `SPACESHIP_HOST_SHOW`      |               `true`               | Show section (`true`, `false` or `always`) |
| `SPACESHIP_HOST_SHOW_FULL` |              `false`               | Show full hostname                         |
| `SPACESHIP_HOST_PREFIX`    |               `at·`                | Section's prefix                           |
| `SPACESHIP_HOST_SUFFIX`    | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                           |
| `SPACESHIP_HOST_COLOR`     |               `blue`               | Section's color                            |
| `SPACESHIP_HOST_COLOR_SSH` |              `green`               | Section's color on SSH connection          |
