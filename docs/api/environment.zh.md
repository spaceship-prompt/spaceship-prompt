# Environment

Spaceship uses `SPACESHIP_` prefix for variables and `spaceship::` prefix for a function to avoid conflicts with global environment. All section, including custom ones, are being required to use `spaceship_` prefix before their name to load properly.

## Prompt variables

### `SPACESHIP_VERSION`

An environment variable that defines the version of currently running Spaceship prompt version. Can be used for issue reporting or debugging purposes.

Accessible to any program or script running in a current shell session.

```zsh
echo $SPACESHIP_VERSION
#> 3.0.0
```

### `SPACESHIP_ROOT`

<!-- prettier-ignore -->
!!! danger
    This variable is read only. Changing the value may cause the damage to Spaceship installation!

An environment variable that defines the path to Spaceship prompt installation. Spaceship uses this variable for resolving path to sections and utils.

Accessible to any program or script running in a current shell session.

```zsh
echo $SPACESHIP_ROOT
#> /path/to/spaceship-prompt
```

### `SPACESHIP_CONFIG_PATH`

An array of path to configuration files. Spaceship will look for configuration file in the order of the array. The first file that exists will be used.

The default locations are:

```zsh
$HOME/.spaceshiprc
$HOME/.spaceshiprc.zsh
$HOME/.config/spaceship.zsh
$HOME/.config/spaceship/spaceship.zsh
$XDG_CONFIG_HOME/spaceship.zsh
/etc/xdg/spaceship.zsh
$XDG_CONFIG_DIRS/spaceship.zsh
```

### `SPACESHIP_CONFIG`

A variable storing the path to the configuration file. Usually, this variable stores one of the paths from the [`SPACESHIP_CONFIG_PATH`](#spaceship_config_path) array.

You can specify custom path to the configuration file by setting the `SPACESHIP_CONFIG_FILE` environment variable, for example:

```zsh title="$HOME/.zshrc"
export SPACESHIP_CONFIG_FILE="$HOME/.dotfiles/path/to/spaceship.zsh"
```

The variable is empty when no configuration file is found.

### `SPACESHIP_CACHE`

!!! danger
    This variable should be used only for reading. Changing the value may cause the incorrect behavior of Spaceship prompt.

An associative array that stores the cached values of the sections. The cache stores data between renders and is cleared on every prompt.

The cache should not be manipulated directly.

### `SPACESHIP_JOBS`

!!! danger
    This variable should be used only for reading. Changing the value may cause the incorrect behavior of Spaceship prompt.

An array of currently processing asynchronous sections. Can be used to check what asynchronous sections are being rendered.

The section name is added to the array when the asynchronous section is being rendered. Upon completion of the asynchronouse job, the name is removed from the array.

## Asynchronous runtime

Spaceship uses [`zsh-async`](https://github.com/mafredri/zsh-async) library to perform asynchronous tasks. This library comes along with Spaceship and is regularly updated to the latest version.

`zsh-async` is loaded automatically when Spaceship loads sections, when all of these conditions are true:

1. Asynchronous rendering is turned on (see [Asynchronous rendering](/config/prompt/#asynchronous-rendering))
2. There's at least one section that is rendered asynchronously.
3. `zsh-async` was not loaded before.

Otherwise, Spaceship will skip the loading of `zsh-async`.

### Loading `zsh-async` manually

If you plan on using `zsh-async` for purposes other than just rendering Spaceship, it's recommended to load it explicitly, before loading Spaceship.

Here's an example of how to load `zsh-async` manually:

=== "antigen"

    ```zsh title=".zshrc"
    antigen bundle mafredri/zsh-async
    ```

=== "antibody"

    ```zsh title=".zshrc"
    antibody bundle mafredri/zsh-async
    ```

=== "zinit"

    ```zsh title=".zshrc"
    zinit light mafredri/zsh-async
    ```

=== "zgen"

    ```zsh title=".zshrc"
    zgen load mafredri/zsh-async
    ```

=== "zplug"

    ```zsh title=".zshrc"
    zplug mafredri/zsh-async, from:github
    ```

=== "sheldon"

    ```zsh title=".sheldon/plugins.toml"
    [plugins.zsh-async]
    github = 'mafredri/zsh-async'
    ```
