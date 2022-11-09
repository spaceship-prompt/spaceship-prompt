# Sudo (`sudo`)

!!! info
    [**Sudo**](https://www.sudo.ws) is a tool that allows a system administrator to delegate authority to users or groups.

The `sudo` section shows an indicator when user has cached passwordless permissions. This section is only displayed when you have a `sudo` command available.

## Displaying the section

Set `SPACESHIP_SUDO_SHOW` to `true` in your `.spaceshiprc.zsh`, if you need to show timestamps:

```zsh title=".spaceshiprc.zsh"
SPACESHIP_SUDO_SHOW=true
```

## Options

| Variable                |              Default               | Meaning                             |
| :---------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_SUDO_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_SUDO_PREFIX` |                 -                  | Section's prefix                    |
| `SPACESHIP_SUDO_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_SUDO_SYMBOL` |               `↯`                  | Symbol displayed as an indicator    |
| `SPACESHIP_SUDO_COLOR`  |              `yellow`              | Section's color                     |
