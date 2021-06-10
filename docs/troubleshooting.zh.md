---
hide:
  - 导航
---

# 疑难解答

此页面旨在帮助您修复在使用Spaceship提示符遇到的常见问题。

## `git` 分支的奇怪符号是什么?

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

如果不支持 Unicode 符号，您可以用 `SPACESHIP_*_SYMBOL` 选项替换它们与您终端兼容。 查看 [选项](./options.zh.md) 页面以获取更多信息。

## 提示符之前的 `[I]` 是什么？

那是 [`vi_mode`](https://spaceship-prompt.sh/options/#vi-mode-vi_mode) 模块表示 `插入` 模式。 您可以在您的配置中用以下行禁用此功能：

```
SPACESHIP_VI_MODE_SHOW=false
```

## 为什么我的提示符很慢？

由于状态检查是相当繁重的操作，空间飞船在大仓库中Spaceship可能较慢。 在这种情况下，试图避免有许多未提交的文件。

使用 `grep` 获取软件包版本没有返回准确信息。 所以我们现在使用 `jq` ，并且用 `python` 和 `node`作为备选。这可能会稍微影响性能。 在这种情况下安装 [jq](https://stedolan.github.io/jq/) (详情请 [#439][], [#441][])。

由于未使用的模块加载，提示符也可能变慢。 Spaceship只装载 `SPACESHIP_PROPT_ORDER` 或 `SPACESHIP_RPROPT_ORDER` 中提到的模块。 If you think some sections might be useless for you, try to disable them by omitting their names in order options.

In the example below, `time`, `package`, `xcode`, `julia`, `docker`, `ember` and `vi_mode` sections are disabled so that they won't be loaded at all.

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

Disabling a lot of unused section may achieve a significant performance boost. Here's a comparison of rendering Spaceship prompt 100 times with all sections enabled and with `SPACESHIP_PROMPT_ORDER` from example above:

|                      | All section | With disabled sections |
|:-------------------- |:-----------:|:----------------------:|
| Inside Git repo\*  |   `23.5s`   |        `21.3s`         |
| Outside Git repo\* |   `8.3s`    |         `7.4s`         |

\* — `spaceship-prompt` repo is used in this test.

## Some section icons overlap each other?

![](https://user-images.githubusercontent.com/3459374/34945188-1f6398be-fa0b-11e7-9845-a744bc3e148d.png)

This issue is related to how your terminal emulator renders Unicode 9 characters. To fix this issue:

- Make sure terminal uses _Unicode Version 9 Widths_.
- Let your terminal render ambiguous-width characters as double-width.

In _iTerm_ follow these instructions:

- Go _iTerm → Preferences… (⌘,) → Profiles → Text_
- Check _Unicode Version 9 Widths_.
- Check _Threat ambiguous-width characters as double-width_.
- Reload terminal's tab.

## Why doesn't my prompt look like the preview?

![preview](https://user-images.githubusercontent.com/10276208/36086434-5de52ace-0ff2-11e8-8299-c67f9ab4e9bd.gif)

Preview shows `spaceship` prompt setup with:

- [Hyper](https://hyper.is) as terminal emulator.
- [One Dark](https://www.npmjs.com/package/hyperterm-atom-dark) color theme from [Atom](https://atom.io/) editor.
- [Fira Code](https://github.com/tonsky/FiraCode) with with ligatures as primary font (16px size).
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) to have commands colorized.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) to have browser-like autocompletions.

See [screenshots](https://github.com/spaceship-prompt/spaceship-prompt/wiki/Screenshots) wiki for more color schemes examples.

## Does not help?

If any of above does not help, please, [file an issue](https://github.com/spaceship-prompt/spaceship-prompt/issues/new), describe your problem and we will gladly help you.

[#439]: https://github.com/spaceship-prompt/spaceship-prompt/issues/439
[#441]: https://github.com/spaceship-prompt/spaceship-prompt/pull/441
