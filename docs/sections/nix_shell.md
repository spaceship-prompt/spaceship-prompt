# Nix shell `nix_shell`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Nix shell**](https://nixos.org/manual/nix/stable/command-ref/nix-shell.html) can be used to provide some kind of virtual environment through the nix-shell command.

The `nix_shell` displays whether the shell is pure/impure as well as the shell's name if one was specified.

This section is displayed only when nix-shell is active.

## Options

| Variable                    |              Default               | Meaning                             |
| :-------------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_NIXSHELL_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_NIXSHELL_ASYNC`  |               `false`              | Render section asynchronously       |
| `SPACESHIP_NIXSHELL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_NIXSHELL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_NIXSHELL_SYMBOL` |               `❄ `                 | Symbol displayed before the section |
| `SPACESHIP_NIXSHELL_COLOR`  |               `yellow`             | Section's color                     |
