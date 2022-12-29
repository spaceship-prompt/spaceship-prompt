# Getting Started

Welcome aboard! Let's install Spaceship on your machine, astronaut!

## Requirements

Before we begin, let's make sure you have the following installed:

- [Zsh](http://www.zsh.org/) (v5.2 or recent) must be installed. Run the following command to check you version of Zsh:
  ```zsh
  echo $ZSH_VERSION #> 5.8.1
  ```
- [Powerline Font](https://github.com/powerline/fonts) or [Nerd Font](https://www.nerdfonts.com/) (even better) must be installed and used in your terminal. [Fira Code](https://github.com/tonsky/FiraCode) is a popular choice. To check if Powerline Font works for you, run:
  ```zsh
  echo -e "\xee\x82\xa0" #> 
  ```

## Installing

Now that the requirements are satisfied, you can install Spaceship via any of the following approaches:

=== "Manual"

    !!! hint
        If you're using any plugin manager, like Oh-My-Zsh, antigen, zgen, zplug or other, this might not be the best way to install Spaceship for you.

    1. Clone this repo somewhere, for example to `$HOME/.zsh/spaceship`.
    2. Source Spaceship in your `~/.zshrc`.

    ### Example

    ```zsh title="Terminal"
    mkdir -p "$HOME/.zsh"
    git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"
    ```

    For initializing prompt system add this to your `.zshrc`:

    ```zsh title=".zshrc"
    source "$HOME/.zsh/spaceship/spaceship.zsh"
    ```

=== "Homebrew"

    Installing Spaceship via Homebrew is a simple command:

    ```zsh title="Terminal"
    brew install spaceship
    ```

    Add prompt initialization to your `.zshrc`:

    ```zsh title="Terminal"
    echo "source $(brew --prefix)/opt/spaceship/spaceship.zsh" >>! ~/.zshrc
    ```

    !!! tip
        You can also add the following to your [`Brewfile`](https://github.com/Homebrew/homebrew-bundle#usage) to bundle Spaceship along with your other software:

        ```ruby title="Brewfile"
        brew "spaceship"
        ```

=== "oh-my-zsh"

    Clone this repo:

    ```zsh title="Terminal"
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ```

    Symlink `spaceship.zsh-theme` to your oh-my-zsh custom themes directory:

    ```zsh title="Terminal"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```

    Set `ZSH_THEME="spaceship"` in your `.zshrc`.

=== "npm"

    Install Spaceship via npm as you would with any other global package:

    ``` title="Terminal"
    npm install -g spaceship-prompt
    ```

    This command will download Spaceship. It will also ask you to source Spaceship in your `~/.zshrc` file.

    !!! tip
        Update Spaceship to new versions as you would any other package.

=== "prezto"

    - Follow [prezto-contrib#usage](https://github.com/belak/prezto-contrib#usage) to clone `prezto-contrib` to the proper location.
    - Enable the `contrib-prompt` module (before the `prompt` module).
    - Set `zstyle ':prezto:module:prompt' theme 'spaceship'` in your `.zpreztorc`.

=== "zim"

    Add Spaceship to your `.zimrc`:

    ```zsh title=".zimrc"
    zmodule spaceship-prompt/spaceship-prompt --name spaceship --no-submodules
    ```

    Then install Spaceship:

    ```zsh title="Terminal"
    zimfw install
    ```

=== "antigen"

    Add the following snippet in your `.zshrc`:

    ```zsh title=".zshrc"
    antigen theme spaceship-prompt/spaceship-prompt
    ```

=== "antibody"

    Update your `.zshrc` file with the following line:

    ```zsh title=".zshrc"
    antibody bundle spaceship-prompt/spaceship-prompt
    ```

=== "zinit"

    Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

    ```zsh title=".zshrc"
    zinit light spaceship-prompt/spaceship-prompt
    ```

=== "zgen"

    Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

    ```zsh title=".zshrc"
    zgen load spaceship-prompt/spaceship-prompt spaceship
    ```

=== "zplug"

    Use this command in your `.zshrc` to load Spaceship as prompt theme:

    ```zsh title=".zshrc"
    zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
    ```

=== "sheldon"

    Add the following to your `plugins.toml` file (open it with `sheldon edit`):

    ```toml title="plugins.toml"
    [plugins.spaceship]
    github = "spaceship-prompt/spaceship-prompt"
    ```

    Or run the following to automatically add it:

    ```zsh title="Terminal"
    sheldon add spaceship --github spaceship-prompt/spaceship-prompt
    ```

=== "Arch"

    Install the latest release from the AUR package [spaceship-prompt](https://aur.archlinux.org/packages/spaceship-prompt/):

    ```
    git clone https://aur.archlinux.org/spaceship-prompt.git
    cd spaceship-prompt
    makepkg -si
    ```

    or using `yay`:

    ```
    yay -S spaceship-prompt
    ```

    Also there is an unmaintained git package [spaceship-prompt-git](https://aur.archlinux.org/packages/spaceship-prompt-git/).
    ```

## Congratulations!

You've made it! You've installed Spaceship on your machine!

What's next? Spaceship has reasonable defaults, but you might want to adjust them to your needs. Learn how to configure your Spaceship:

[Configure Spaceship](/config/intro){ .md-button }

Additionally, join our community or consider contributing to the project.

[:material-hand-heart: Contribute](/contribute){ .md-button }
[:fontawesome-brands-twitter: Twitter](https//twitter.com/SpaceshipPrompt){ .md-button }
[:fontawesome-brands-discord: Discord](https://discord.gg/NTQWz8Dyt9){ .md-button }

## Having trouble?

Find answers on our troubleshooting page or get help by our community. Still struggling? Please, *file an issue*, describe your problem, and we will gladly help you.

[:fontawesome-brands-discord: Discord](https://discord.gg/NTQWz8Dyt9){ .md-button }
[:fontawesome-brands-github: Discussions](https://github.com/spaceship-prompt/spaceship-prompt/discussions/){ .md-button }
[:fontawesome-brands-github: Issues](https://github.com/spaceship-prompt/spaceship-prompt/issues){ .md-button }
