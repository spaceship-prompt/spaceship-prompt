# Per-directory configuration

Spaceship can load configuration for the current directory without external tools such as `direnv`. This is useful when a project needs a different prompt layout, section visibility, or section styling than your global configuration.

Per-directory configuration is disable by default. You can enabled it from your global Spaceship configuration:

```zsh title="~/.spaceshiprc.zsh"
SPACESHIP_PER_DIRECTORY_CONFIG=true
```

Then create a `.spaceshiprc` file in a project directory:

```zsh title="/path/to/project/.spaceshiprc"
SPACESHIP_USER_SHOW=always
SPACESHIP_KUBECTL_SHOW=false
```

Spaceship restores your global configuration before applying local files. This means options set by one project do not leak into another project after you leave that directory.

## Configuration lookup

Spaceship looks for `.spaceshiprc` files from parent directories down to the current directory. Parent files are loaded first, and child files can override them.

For example, when your current directory is `/work/app/service`, Spaceship checks:

```text
/work/.spaceshiprc
/work/app/.spaceshiprc
/work/app/service/.spaceshiprc
```

If multiple files exist, they are sourced in that order.

## Changing the file name

You can change the per-directory file name from your global Spaceship configuration:

```zsh title="~/.spaceshiprc.zsh"
SPACESHIP_PER_DIRECTORY_CONFIG=true
SPACESHIP_PER_DIRECTORY_CONFIG_FILE=".spaceship.local.zsh"
```

## Security

Per-directory config files are Zsh scripts. Keep this feature enabled only when you trust the directories where Spaceship will find `.spaceshiprc` files.

Spaceship will not treat your global `SPACESHIP_CONFIG` file as a per-directory config file, even if it has the same file name.
