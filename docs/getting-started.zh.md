---
hide:
  - navigation
---

# 快速上手

## 安装要求

- [`zsh`](http://www.zsh.org/) 必须安装(v5.2或更新的版本)。
- 安装一种 [Powerline 字体](https://github.com/powerline/fonts)（如 [Fira Code](https://github.com/tonsky/FiraCode)）并在您的终端启用 。

## 安装

如果满足了这些要求，您可以通过以下任何方式安装 Spaceship：

=== "手动方式"

    !!! 提示
        如果你正在使用任何插件管理器，例如 Oh-My-Zsh, zplug, antigen 等，那么手动方式可能不是为您安装 Spaceship 的最佳方式。
    
    如果您不使用任何工具来管理 Zsh 插件，那么此手动方法可以用来安装 Spaceship。

    - 克隆这个仓库 `git clone https://github.com/spaceship-impt/spaceship-impt.git --depth=1`
    - Symlink `spaceship.zsh` to somewhere in [`$fpath`](http://www.refining-linux.org/archives/46/ZSH-Gem-12-Autoloading-functions/) as `prompt_spaceship_setup`.
    - Initialize prompt system and choose `spaceship`.


    #### Example

    Run `echo $fpath` to see possible location and link `spaceship.zsh` there, like:

    ```zsh
    $ ln -sf "$PWD/spaceship.zsh" "/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
    ```

    For a user-specific installation, simply add a directory to `$fpath` for that user in `.zshrc`:

    ```zsh
    fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
    ```

    Then install the theme like this:

    ```zsh
    $ ln -sf "$PWD/spaceship.zsh" "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
    ```

    For initializing prompt system add this to your `.zshrc`:

    ```zsh
    # .zshrc
    autoload -U promptinit; promptinit
    prompt spaceship
    ```

=== "oh-my-zsh"

    Clone this repo:

    ```zsh
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ```


    Symlink `spaceship.zsh-theme` to your oh-my-zsh custom themes directory:

    ```zsh
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```


    Set `ZSH_THEME="spaceship"` in your `.zshrc`.

=== "npm"

    ```
    npm install -g spaceship-prompt
    ```


    Done. This command should link `spaceship.zsh` as `prompt_spaceship_setup` to your `$fpath` and set `prompt spaceship` in `.zshrc`. Just reload your terminal.
    
    !!!tip
        Update Spaceship to new versions as you would any other package.

=== "prezto"

    - Follow [prezto-contrib#usage](https://github.com/belak/prezto-contrib#usage) to clone `prezto-contrib` to the proper location.
    - Enable the `contrib-prompt` module (before the `prompt` module).
    - Set `zstyle ':prezto:module:prompt' theme 'spaceship'` in your `.zpreztorc`.

=== "zim"

    Add `zmodule spaceship-prompt/spaceship-prompt --name spaceship` to your `.zimrc` and run `zimfw install`.

=== "antigen"

    Add the following snippet in your `.zshrc`:

    ```
    antigen theme spaceship-prompt/spaceship-prompt
    ```

=== "antibody"

    Update your `.zshrc` file with the following line:

    ```
    antibody bundle spaceship-prompt/spaceship-prompt
    ```

=== "zinit"

    Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

    ```
    zinit light spaceship-prompt/spaceship-prompt
    ```

=== "zgen"

    Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

    ```
    zgen load spaceship-prompt/spaceship-prompt spaceship
    ```

=== "zplug"

    Use this command in your `.zshrc` to load Spaceship as prompt theme:

    ```
    zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
    ```

=== "Arch"

    Install the latest master from the AUR package [`spaceship-prompt-git`](https://aur.archlinux.org/packages/spaceship-prompt-git/):

    ```
    git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1
    cd spaceship-prompt-git
    makepkg -si
    ```

## Congratulations!

You've made it! You've installed Spaceship on your machine!

What's next? Spaceship has reasonable defaults, but you might want to adjust them to your needs. Visit our [Options](./options.md) page to learn how to configure your Spaceship.

<!-- prettier-ignore -->
!!! tip Follow [our Twitter](//twitter.com/SpaceshipPrompt) to keep yourself updated about new features, improvements, and bugfixes.

## Troubleshooting

Having trouble? Take a look at out [Troubleshooting](./troubleshooting.md) page.

Still struggling? Please, [file an issue](https://github.com/spaceship-prompt/spaceship-prompt/issues/new/choose), describe your problem and we will gladly help you.
