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

=== "oh-my-zsh"

    克隆此仓库：

    ```zsh
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ```


    将 `spaceship.zsh-theme` 软链到您 oh-my-zsh 的自定义主题目录：

    ```zsh
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```


    在 `.zshrc` 中设置 `ZSH_THEME="spaceship"。

=== "npm"

    ```
    npm install -g spaceship-prompt
    ```


    安装完毕。 此命令应将 `spaceship.zsh` 作为 `prompt_spaceship_setup` 链接到你的 `$fpath`中 ，并在`.zshrc`中设置 `prompt spaceship ` 。 只需重载您的终端。
    
    !!!小提示
        就像更新其他软件包一样，将 Spaceship 更新到最新版本。

=== "prezto"

    - 遵循 [prezto-contrib#usage使用守则](https://github.com/belak/prezto-contrib#usage) 将 `prezto-contrib` 克隆到正确的位置。
    - 启用 `contrib-prompt` 模块(并且将其放在 `prompt` 模块之前)。
    - 在您的 `.zpreztorc` 中设置 `zstyle ':prezto:module:prompt' theme 'spaceship'` 。

=== "zim"

    将 `zmodule spaceship-prompt/spaceship-prompt --name spaceship --no-submodules` 添加到您的 `.zimrc`中并且运行 `zimfw install`.

=== "antigen"

    将以下代码片段添加到您的 `.zshrc`中:

    ```
    antigen theme spaceship-prompt/spaceship-prompt
    ```

=== "antibody"

    使用以下行更新您的`.zshc`文件：

    ```
    antibody bundle spaceship-prompt/spaceship-prompt
    ```

=== "zinit"

    将以下行添加到 `.zshrc`中您要添加其他 Zsh 插件的地方：

    ```
    zinit light spaceship-prompt/spaceship-prompt
    ```

=== "zgen"

    将以下行添加到 `.zshrc`中您要添加其他 Zsh 插件的地方：

    ```
    zgen load spaceship-prompt/spaceship-prompt spaceship
    ```

=== "zplug"

    在你的`.zshrc`中使用此命令加载 Spaceship 以使其作为命令提示系统的主题：

    ```
    zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
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

下一步是什么？ Spaceship 有合理的默认设置，但您可能想要根据需要调整它们。 访问我们的 [选项](./options.md) 页面来学习如何配置您的 Spaceship。

<!-- prettier-ignore -->
!!! 提示 关注 [我们的 Twitter](//twitter.com/SpaceshipPrompt) 以便随时了解新功能、改进和错误修正的最新情况。

## 疑难解答

遇到问题？ 查看 [疑难解答](./troubleshooting.md) 页面。

仍然困惑？ 请 [提出 issue](https://github.com/spaceship-prompt/spaceship-prompt/issues/new/choose)，描述你的问题，我们将乐意帮助你。
