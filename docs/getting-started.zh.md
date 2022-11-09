# 快速上手

欢迎登船！ Let's install Spaceship on your machine, astronaut!

## 安装要求

Before we begin, let's make sure you have the following installed:

- [Zsh](http://www.zsh.org/) (v5.2 or recent) must be installed. Run the following command to check you version of Zsh:
  ```zsh
  echo $ZSH_VERSION #> 5.8.1
  ```
- [Powerline Font](https://github.com/powerline/fonts) or [Nerd Font](https://www.nerdfonts.com/) (even better) must be installed and used in your terminal. [Fira Code](https://github.com/tonsky/FiraCode) is a popular choice. To check if Powerline Font works for you, run:
  ```zsh
  echo -e "\xee\x82\xa0" #> 
  ```

## 安装

如果满足了这些要求，您可以通过以下任何方式安装 Spaceship：

=== "手动方式"

    !!! hint
        If you're using any plugin manager, like Oh-My-Zsh, antigen, zgen, zplug or other, this might not be the best way to install Spaceship for you.

    1. Clone this repo somewhere, for example to `$HOME/.zsh/spaceship`.
    2. Source Spaceship in your `~/.zshrc`.


    ### 示例

    ```zsh title="Terminal"
    mkdir -p "$HOME/.zsh"
    git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"
    ```

    为了初始化命令提示系统，需要将其添加到您的 `.zshrc` 中：

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

    克隆此仓库：

    ```zsh title="Terminal"
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ```


    将 `spaceship.zsh-theme` 软链到您 oh-my-zsh 的自定义主题目录：

    ```zsh title="Terminal"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```


    在 `.zshrc` 中设置 `ZSH_THEME="spaceship"。

=== "npm"

    Install Spaceship via npm as you would with any other global package:

    ``` title="Terminal"
    npm install -g spaceship-prompt
    ```


    This command will download Spaceship. It will also ask you to source Spaceship in your `~/.zshrc` file.
    
    !!! tip
        Update Spaceship to new versions as you would any other package.

=== "prezto"

    - 遵循 [prezto-contrib#usage使用守则](https://github.com/belak/prezto-contrib#usage) 将 `prezto-contrib` 克隆到正确的位置。
    - 启用 `contrib-prompt` 模块(并且将其放在 `prompt` 模块之前)。
    - 在您的 `.zpreztorc` 中设置 `zstyle ':prezto:module:prompt' theme 'spaceship'` 。

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

    将以下代码片段添加到您的 `.zshrc`中:

    ```zsh title=".zshrc"
    antigen theme spaceship-prompt/spaceship-prompt
    ```

=== "antibody"

    使用以下行更新您的`.zshc`文件：

    ```zsh title=".zshrc"
    antibody bundle spaceship-prompt/spaceship-prompt
    ```

=== "zinit"

    将以下行添加到 `.zshrc`中您要添加其他 Zsh 插件的地方：

    ```zsh title=".zshrc"
    zinit light spaceship-prompt/spaceship-prompt
    ```

=== "zgen"

    将以下行添加到 `.zshrc`中您要添加其他 Zsh 插件的地方：

    ```zsh title=".zshrc"
    zgen load spaceship-prompt/spaceship-prompt spaceship
    ```

=== "zplug"

    在你的`.zshrc`中使用此命令加载 Spaceship 以使其作为命令提示系统的主题：

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

    从 AUR 软件源安装最近的版本 [`spaceship-prompt-git`](https://aur.archlinux.org/packes/spaceship-prompt-git/):

    ```
    git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1
    cd spaceship-prompt-git
    makepkg -si
    ```

## 恭喜您！

你已经成功了! 你已经在你的机器上安装了 Spaceship！

下一步是什么？ Spaceship 有合理的默认设置，但您可能想要根据需要调整它们。 Learn how to configure your Spaceship:

[Configure Spaceship](/config/intro ""){.md-button}

Additionally, join our community or consider contributing to the project.

[:material-hand-heart: Contribute](/contribute ""){.md-button} [:fontawesome-brands-twitter: Twitter](https//twitter.com/SpaceshipPrompt ""){.md-button} [:fontawesome-brands-discord: Discord](https://discord.gg/NTQWz8Dyt9 ""){.md-button}

## 遇到问题？

Find answers on our troubleshooting page or get help by our community. 仍然困惑？ Please, *file an issue*, describe your problem, and we will gladly help you.

[:fontawesome-brands-discord: Discord](https://discord.gg/NTQWz8Dyt9 ""){.md-button} [:fontawesome-brands-github: Discussions](https://github.com/spaceship-prompt/spaceship-prompt/discussions/ ""){.md-button} [:fontawesome-brands-github: Issues](https://github.com/spaceship-prompt/spaceship-prompt/issues ""){.md-button}
