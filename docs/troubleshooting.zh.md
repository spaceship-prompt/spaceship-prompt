---
hide:
  - navigation
---

# 检修故障

该页面旨在帮助修复你在使用 Spaceship 时遇到的常见问题。

## `git` 分支符号的乱码是什么?

你需要安装 powerline 补丁字体以便合理得显示 `git` 分支符号。

- 安装任何 powerline 兼容的字体比如 [Fira Code](https://github.com/tonsky/FiraCode) 或者 [其他](https://github.com/powerline/fonts).
- 配置你的模拟终端来 [用那个字体](https://powerline.readthedocs.io/en/master/troubleshooting/osx.html)。

## 模块前边符号的乱码是什么?

这一般不是 Spaceship prompt 的问题。 Spaceship 用 Unicode 字符来表示 `SPACESHIP_*_SYMBOL` 。 为了解决这个问题:

- 验证是否你的终端支持 Unicode 字符， 命令如下:
  ```zsh
  curl -L https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  # 或者
  wget -O - https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  ```
- 配置你的模拟终端用 UTF-8 作为字符编码。

一旦 Unicode 符号不被支持, 你能用 `SPACESHIP_*_SYMBOL` 选项来使用兼容的字符。 查看 [选项](./options.zh.md) 也获取更多信息。

## 在命令符前面的 `[I]` 是什么 ?

它是 [`vi_mode`](https://spaceship-prompt.sh/options/#vi-mode-vi_mode) 模块，表示 `insert` 模式。你能根据下面的配置禁用它。

```
SPACESHIP_VI_MODE_SHOW=false
```

## 为什么我的命令符很慢?

Spaceship 在大的项目下可能变慢因为状态检查是一个很重的操作。 在这种情况下，请试着关闭不使用的模块。

之前我们用 `grep` 来获取版本号发现有些问题，所以我们用 `jq` 还有 `python` 和 `node` 作为互补。后两个可能影响性能因此建议你安装 [jq](https://stedolan.github.io/jq/) (查阅 [#439], [#441] 了解更多信息)。

[#439]: https://github.com/spaceship-prompt/spaceship-prompt/issues/439
[#441]: https://github.com/spaceship-prompt/spaceship-prompt/pull/441

命令符会因为一些没有用的模块而变慢。Spaceship 仅仅加载 `SPACESHIP_PROMPT_ORDER` 和 `SPACESHIP_RPROMPT_ORDER` 中使用的命令。如果你认为某些模块没有用，将其通过注释禁止即可。

例子如下, `time`, `package`, `xcode`, `julia`, `docker`, `ember` 和 `vi_mode` 模块被禁，以至于不再加载。

```zsh
# Just comment a section if you want to disable it
SPACESHIP_PROMPT_ORDER=(
  # time        # Time stamps section (Disabled)
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  # package     # Package version (Disabled)
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  # xcode       # Xcode section (Disabled)
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  # julia       # Julia section (Disabled)
  # docker      # Docker section (Disabled)
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  # ember       # Ember.js section (Disabled)
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  # vi_mode     # Vi-mode indicator (Disabled)
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
```

禁止不用的模块可能大幅度提高性能。下面是两种情况下 Spaceship prompt 渲染100次的比较结果:

|                    | 所有模块 | 禁止部分模块 |
| :----------------- | :---------: | :--------------------: |
| Inside Git repo\*  |   `23.5s`   |        `21.3s`         |
| Outside Git repo\* |   `8.3s`    |         `7.4s`         |

\* — `spaceship-prompt` 项目被用于这个测试。

## 一些模块的符号和其他符号重叠?

![](https://user-images.githubusercontent.com/3459374/34945188-1f6398be-fa0b-11e7-9845-a744bc3e148d.png)

这个问题和你的终端模拟器如何渲染 Unicode 9 字符有关。为了修复该问题按如下操作:

- 确保终端用 _Unicode Version 9 Widths_。
- 让你的终端渲染不明确字符宽度为双倍宽度。

在 _iTerm_ 中按照以下指令:

- 进入 _iTerm → Preferences… (⌘,) → Profiles → Text_
- 选择 _Unicode Version 9 Widths_.
- 选择 _Threat ambiguous-width characters as double-width_.
- 加载命令行 tab.

## 为什么我的终端模拟器样式和介绍中不一样?

![预览](https://user-images.githubusercontent.com/10276208/36086434-5de52ace-0ff2-11e8-8299-c67f9ab4e9bd.gif)

预览中 `spaceship` prompt 安装步骤:

- [Hyper](https://hyper.is)作为终端模拟器。
- [One Dark](https://www.npmjs.com/package/hyperterm-atom-dark) 来自 [Atom](https://atom.io/) 配色主题。
- [Fira Code](https://github.com/tonsky/FiraCode) 用连字主字体 (16px size)。
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) 命令配色。
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) 命令行补全。

查看 [截屏](https://github.com/spaceship-prompt/spaceship-prompt/wiki/Screenshots) wiki 来了解更多的配色。

## 没有帮到你?

如果以上的解答都不能解决你的问题, 请[发起一个 issue](https://github.com/spaceship-prompt/spaceship-prompt/issues/new), 描述一个问题，我们很高兴为你解决。
