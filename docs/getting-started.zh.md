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

    - 克隆这个仓库 `git clone https://github.com/spaceship-prompt/spaceship-prompt.git --depth=1`
    - 将 `spaceship.zsh` 符号链接到 [`$fpath`](http://www.refining-linux.org/archives/46/ZSH-Gem-12-Autoloading-functions/)中的某个位置以作为 `prompt_spaceship_setup`
    - 初始化命令提示系统并选择 `spaceship`


    #### 示例

    运行 `echo $fpath` 来查看 Zsh 可能存在的位置，并将 `spaceship.zsh` 链接到那里，如下所示：

    ```zsh
    $ ln -sf "$PWD/spaceship.zsh" "/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
    ```

    对于特定用户的安装，只需在 `.zshrc` 中为该用户添加一个目录到 `$fpath`中即可：

    ```zsh
    fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
    ```

    然后像下面这样安装 Spaceship 主题：

    ```zsh
    $ ln -sf "$PWD/spaceship.zsh" "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
    ```

    为了初始化命令提示系统，需要将其添加到您的 `.zshrc` 中：

    ```zsh
    # .zshrc
    autoload -U promptinit; promptinit
    prompt spaceship
    ```

=== "Homebrew"

    ```
    brew install spaceship
    ```


    You can also add the following to your [`Brewfile`](https://github.com/Homebrew/homebrew-bundle#usage):

    ```ruby
    brew "spaceship"
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

    - 遵循 [prezto-contrib#usage使用守则](https://github.com/belak/prezto-contrib#usage) 将 `prezto-contrib` 克隆到正确的位置。
    - 启用 `contrib-prompt` 模块(并且将其放在 `prompt` 模块之前)。
    - 在您的 `.zpreztorc` 中设置 `zstyle ':prezto:module:prompt' theme 'spaceship'` 。

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

    将以下行添加到 `.zshrc`中您要添加其他 Zsh 插件的地方：

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

## 恭喜您！

You've made it! You've installed Spaceship on your machine!

What's next? Spaceship has reasonable defaults, but you might want to adjust them to your needs. Visit our [Options](./options.md) page to learn how to configure your Spaceship.

<!-- prettier-ignore -->
!!! tip Follow [our Twitter](//twitter.com/SpaceshipPrompt) to keep yourself updated about new features, improvements, and bugfixes.

## 疑难解答

Having trouble? Take a look at out [Troubleshooting](./troubleshooting.md) page.

Still struggling? Please, [file an issue](https://github.com/spaceship-prompt/spaceship-prompt/issues/new/choose), describe your problem and we will gladly help you.
