# Nix shell `nix_shell`

!!! info
    [**Nix shell**](https://nixos.org/manual/nix/stable/command-ref/nix-shell.html) can be used to provide some kind of virtual environment through the nix-shell command.

The `nix_shell` displays whether the shell is pure/impure as well as the shell's name if one was specified.

This section is displayed only when nix-shell is active.

## Options

| Variable                    |              Default               | Meaning                             |
| :-------------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_NIX_SHELL_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_NIX_SHELL_ASYNC`  |               `false`              | Render section asynchronously       |
| `SPACESHIP_NIX_SHELL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_NIX_SHELL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_NIX_SHELL_SYMBOL` |               `❄ `                 | Symbol displayed before the section |
| `SPACESHIP_NIX_SHELL_COLOR`  |               `yellow`             | Section's color                     |
