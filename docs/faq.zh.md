# 常见问题

此页面旨在帮助您修复在使用 Spaceship 时遇到的常见问题。

如果你被某些问题困住，请随时在我们的 Discord 服务或 GitHub 论坛上提问：

[:fontawesome-brands-discord: Discord][discord]{ .md-button }
[:fontawesome-brands-github: Discussions][discussions]{ .md-button }

## 为什么我的提示符看起来不像预览？

<div class="terminal-demo">
  <script id="asciicast-513451" src="https://asciinema.org/a/513451.js" data-autoplay="true" data-loop="true" data-preload="true" async></script>
  <noscript>
    <object class="asciicast" type="image/svg+xml" data="/assets/images/spaceship-demo.svg">
      <img src="/assets/images/spaceship-demo.gif" alt="Spaceship demo" />
    </object>
  </noscript>
</div>

预览显示 `Spaceship` 提示符设置为：

- **终端**
    - [ iTerm2 ](https://iterm2.com/)作为终端仿真器。
    - [One Dark](https://www.npmjs.com/package/hyperterm-atom-dark) 颜色主题。
    - 使用连字的 [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads) 作为主字体 (16px size).
- **Shell 配置**
    - [denysdovhan's Dotfiles](https://github.com/denysdovhan/dotfiles)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) 让命令颜色化。
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) 类似浏览器的自动补全。

查看 [屏幕截图](https://github.com/spaceship-prompt/spaceship-prompt/wiki/Screenshots) 维基以了解更多的配色方案示例。

## 如何实现示例图中自动补全的功能？

使用 [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) 获取基于历史记录和补全的类似浏览器的命令补全。

## `git` 分支前的乱码是什么?

您需要有一个powerline的补丁字体才能正确显示 `git` 分支符号。

- 安装任何powerline兼容的字体，例如 [Fira Code](https://github.com/tonsky/FiraCode) 或 [其他](https://github.com/powerline/fonts)。
- 配置您的终端仿真器 [使用那个字体](https://powerline.readthedocs.io/en/master/troubleshooting/osx.html)。

## 模块前面奇怪的字符是什么？

这并不是Spaceship提示符的问题。 Spaceship在模块中使用 Unicode 符号来代表 `SPACESHIP_*_SYMBOL`。 要解决此问题：

- 使用此命令验证您的终端模拟器支持 Unicode 字符：
  ```zsh
  curl - L https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  # 或
  wget -O - https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  ```
- 配置您的终端模拟器使用UTF-8作为字符编码。
  - `LC_ALL` needs to be [set to a UTF-8 value](https://www.tecmint.com/set-system-locales-in-linux/), like `en_US.UTF-8` or `de_DE.UTF-8`, etc.
  - You need to install an emoji font. Most systems already have such font installed, but some systems don't (for example Arch Linux). You should install one via your preferred package manager. [noto emoji](https://www.google.com/get/noto/help/emoji) is a popular choice.
  -

如果不支持 Unicode 符号，您可以用 `SPACESHIP_*_SYMBOL` 选项替换它们与您终端兼容。 查看 [">选项](/config/intro) 页面以获取更多信息。

## Do `spaceship remove <section>` and `SPACESHIP_<SECTION>_SHOW=false` do the same thing?

Both `spaceship remove` and `SPACESHIP_<SECTION>_SHOW=false` commands hide the section from the prompt, but they do this differently.

`spaceship remove` command removes the section from `SPACESHIP_[R]PROMPT_ORDER` variable, thus preventing the section from loading and executing.

`SPACESHIP_<SECTION>_SHOW=false` command doesn't prevent the section from loading and executing. The section will be loaded and then run, though the section itself will decide how to hide itself (usually, the section just skips all the checks and doesn't render anything).

tldr: `spaceship remove` forces Spaceship renderer to skip the section and `SPACESHIP_<SECTION>_SHOW=false` tells the section to hide itself.

## What the difference between Spaceship and Starship?

Both [Starship](https://starship.rs) is a great prompt and have (more or less) feature parity with Spaceship. So what is the difference?

[Starship](https://starship.rs) is written in Rust and comes as a successor of [Spacefish](https://spacefish.matchai.dev/) – a Fish implementation of the Spaceship prompt. It is heavily inspired by Spaceship prompt (they even confirm that on their website). It's also based on Denys Dovhan's ideas of cross-shell prompts that have been implemented in [denysdovhan/robbyrussell-node](https://github.com/denysdovhan/robbyrussell-node) as proof of concept.

Starship have advantage in supported shells, it works with roughly any shell. Spaceship is limited to Zsh, but uses most of the capabilities of Zsh.

Starship perform its checks asynchronously and renders the prompt as soon as it's ready. Spaceship not only performs checks asynchronously, but also renders the prompt right away and updates it as soon as new information comes from asynchronous tasks.

Spaceship considers custom sections as a first-class citizens and has a Registry of custom sections, whereas Starship suggests to use [custom commands](https://starship.rs/config/#custom-commands) for creating custom modules.

If you use different machines with different shell prompts Starship might be a better choice for you. Spaceship is great if you prefer to use the same Zsh configuration of every machine you use.

## What the difference between Spaceship and Powerlevel10k (with Lean style)?

[Powerlevel10k](https://github.com/romkatv/powerlevel10k) (with Lean mode) is another Zsh prompt that might look very similar to Spaceship.

Both prompts are asynchronous and render the prompt as soon as it's ready. Powerlevel10k takes more monolith approach to prompt with tons of features built in a single prompt. Spaceship, however, takes a more modular approach to prompt with custom sections and more options for customizations.

On the other hand, Powerlevel10k suggests multiple design presets. Spaceship only supports one preset.

## 某些模块图标相互重叠？

![example of icons overlapping](https://user-images.githubusercontent.com/3459374/34945188-1f6398be-fa0b-11e7-9845-a744bc3e148d.png)

此问题与您的终端模拟器如何渲染Unicode 9字符有关。 要解决此问题：

- 确保终端使用 _Unicode 版本 9 宽度_。
- 让您的终端以双宽度渲染不明确的字符。

在 _iTerm_ 中，遵循这些指令：

- 转至 _iTerm → Preferences… (⌘,) → Profiles → Text_
- 检查 _Unicode 版本 9 宽度_。
- 检查 _宽度模糊字符是否为双宽度_。
- 重新装入终端标签页。

## 问题仍未解决

If any of above does not help, please, ask a question on our Discord server or [file an issue][issues], describe your problem, and we will gladly help you.

[:fontawesome-brands-discord: Discord][discord]{ .md-button }
[:fontawesome-brands-github: Discussions][discussions]{ .md-button }
[:fontawesome-brands-github: Open an Issue][issues]{ .md-button }

<!-- References -->

[discord]: https://discord.gg/NTQWz8Dyt9
[discussions]: https://github.com/spaceship-prompt/spaceship-prompt/discussions/
[issues]: https://github.com/spaceship-prompt/spaceship-prompt/issues/new
[issues]: https://github.com/spaceship-prompt/spaceship-prompt/issues/new
