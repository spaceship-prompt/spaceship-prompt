# Introduction

Bienvenue dans la configuration de Spaceship ! Here is a quick guide of how to adjust Spaceship to your personal workflows.

## Créer un fichier de configuration

Pour commencer avec la personnalisation, créez un fichier de configuration :

```zsh
touch ~/.spaceshiprc.zsh
```

… ou, si vous préférez conserver votre configuration dans les dossiers `~/.config` ou `~/.config/spaceship`, vous pouvez également :

```zsh
mkdir -p ~/.config/spaceship.zsh
```

Le fichier va être sourcé automatiquement par Spaceship quand il démarrera.

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

[See available options](/config/prompt ""){.md-button}

## Changing the config location

Optionally, you can change the location of the configuration file by setting the `SPACESHIP_CONFIG_FILE` environment variable.

```zsh
export SPACESHIP_CONFIG_FILE="$HOME/.dotfiles/path/to/spaceship.zsh"
```
