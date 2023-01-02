# Introduction

Welcome to Spaceship configuration! Here is a quick guide of how to adjust Spaceship to your personal workflows.

## Create a config file

To get started with customization, create a configuration file:

```zsh
touch ~/.spaceshiprc.zsh
```

… or, if you prefer to keep your configuration within a `~/.config` or `~/.config/spaceship` folders, you can do so, as well:

```zsh
mkdir -p ~/.config/spaceship.zsh
```

This file will be automatically sourced by Spaceship when it starts up.

## Configure your prompt

The configuration file is a `.zsh` file, so you can use `zsh` syntax to customize Spaceship. You can use loops, conditions, custom functions or even source additional `zsh` files. It's up to you.

Here's an example of a configuration file:

```zsh
# Display time
SPACESHIP_TIME_SHOW=true

# Display username always
SPACESHIP_USER_SHOW=always

# Do not truncate path in repos
SPACESHIP_DIR_TRUNC_REPO=false

# Add custom Ember section
# See: https://github.com/spaceship-prompt/spaceship-ember
spaceship add ember

# Add a custom vi-mode section to the prompt
# See: https://github.com/spaceship-prompt/spaceship-vi-mode
spaceship add --before char vi_mode
```

You can learn more about available options by reading further documentation.

[See available options](/config/prompt){ .md-button }

## Changing the config location

Optionally, you can change the location of the configuration file by setting the `SPACESHIP_CONFIG` environment variable.

```zsh
export SPACESHIP_CONFIG="$HOME/.dotfiles/path/to/spaceship.zsh"
```
