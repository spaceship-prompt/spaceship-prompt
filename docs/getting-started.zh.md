---
hide:
  - navigation
---

# 开始

## 必备依赖

- [`zsh`](http://www.zsh.org/) (v5.2 及以上版本) 必须被安装。
- [Powerline Font](https://github.com/powerline/fonts) 必须被安装以被用于你的控制台 (例如，切换字体到 [Fira Code](https://github.com/tonsky/FiraCode)).

## 安装

一旦必备依赖已经安装，你能安装 Spaceship 通过下面的方式:

=== "手动安装"

    !!! hint
        如果你用插件管理器，比如 Oh-My-Zsh, zplug, antigen 或者其他, 对你来说这可能不是最好的安装 Spaceship 的方式。

    如果你不用任何 Zsh 插件管理器，你能用这个方法。

    - 克隆项目 `git clone https://github.com/spaceship-prompt/spaceship-prompt.git --depth=1`
    - 软链 `spaceship.zsh` 至 [`$fpath`](http://www.refining-linux.org/archives/46/ZSH-Gem-12-Autoloading-functions/) 中的某个目录将其命名为 `prompt_spaceship_setup`.
    - 初始化提示符系统然后选择 `spaceship`。

    #### 例子

    运行 `echo $fpath` 来查看可能的目录，然后链接到那里，比如：

    ```zsh
    $ ln -sf "$PWD/spaceship.zsh" "/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
    ```

    对于某些特定的安装，仅仅在 `.zshrc`  中加一个目录到`$fpath`：

    ```zsh
    fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
    ```

    然后按照下面的方式安装主题:

    ```zsh
    $ ln -sf "$PWD/spaceship.zsh" "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
    ```

    为了初始化提示符系统，加下面的片段到你的 `.zshrc`:

    ```zsh
    # .zshrc
    autoload -U promptinit; promptinit
    prompt spaceship
    ```

=== "oh-my-zsh"

    克隆项目:

    ```zsh
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ```

    软链 `spaceship.zsh-theme` 到你的 oh-my-zsh 自定义主题目录下:

    ```zsh
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```

    在 `.zshrc` 中设置 `ZSH_THEME="spaceship"`

=== "npm"

    ```
    npm install -g spaceship-prompt
    ```

    搞定。这个命令会将 `spaceship.zsh` 以这个文件 `prompt_spaceship_setup` 链接到 `$fpath` 中然后在 `.zshrc` 中设置 `ZSH_THEME="spaceship"`。重新加载你的控制台即可。

    !!!技巧
        你可以用像更新其他 NPM 包一样方式来更新 Spaceship 包的版本。

=== "prezto"

    - 按照说明 [prezto-contrib#usage](https://github.com/belak/prezto-contrib#usage) 去克隆 `prezto-contrib` 到有效的目录。
    - 激活 `contrib-prompt` 模块 (在 `prompt` 模块执行之前)。
    - 在 `.zpreztorc` 中，设置 `zstyle ':prezto:module:prompt' 主题为 'spaceship'`。

=== "zim"

    添加 `zmodule spaceship-prompt/spaceship-prompt --name spaceship` 到你的 `.zimrc` 文件然后运行 `zimfw install`.

=== "antigen"

    添加下面的片段到你的 `.zshrc` 中:

    ```
    antigen theme spaceship-prompt/spaceship-prompt
    ```

=== "antibody"

    添加下面的片段到你的 `.zshrc` 中:

    ```
    antibody bundle spaceship-prompt/spaceship-prompt
    ```

=== "zinit"

    添加下面的片段到你的 `.zshrc` 中:

    ```
    zinit light spaceship-prompt/spaceship-prompt
    ```

=== "zgen"

    添加下面的片段到你的 `.zshrc` 中:

    ```
    zgen load spaceship-prompt/spaceship-prompt spaceship
    ```

=== "zplug"

    添加下面的片段到你的 `.zshrc` 中:

    ```
    zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
    ```

=== "Arch"

    通过 AUR 包安装最新的 master 分支代码 [`spaceship-prompt-git`](https://aur.archlinux.org/packages/spaceship-prompt-git/):

    ```
    git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1
    cd spaceship-prompt-git
    makepkg -si
    ```

## 祝贺!

你已经完成了！你已经成功把 Spaceship 安装到你的机器上了！

接下来能做些什么? Spaceship 有很合理的配置, 但是你可能想调整配置来满足你的需要。 访问我们的 [控制选项](./options.zh.md) 页面来学习如何配置你的 Spaceship。

<!-- prettier-ignore -->
!!! 技巧
    关注 [我们的 Twitter](//twitter.com/SpaceshipPrompt) 获取我们的新的特性、增强和bug修复的更新。

## 检修故障

遇到了问题? 请看我们的 [检修故障](./troubleshooting.zh.md) 页面。

仍然没有解决? 请[填写发布问题](https://github.com/spaceship-prompt/spaceship-prompt/issues/new/choose), 描述问题我们将会很乐意帮助你。
