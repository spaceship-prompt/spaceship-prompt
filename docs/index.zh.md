---
template: index.html
title: 极简，强大，可灵活自定义的 Zsh prompt
hide:
  - navigation
hero:
  title: 极简，强大，可灵活自定义的 Zsh prompt
  subtitle: 它将所有你需要的方便你工作的一切都结合在一起，同时又不失简洁, 像一个宇宙飞船。
  install_button: 开始
  source_button: 源码
features:
  - title: 清晰简单
    image: /assets/what-is-needed.svg
    description: 它不臃肿，它仅仅显示你需要的 (当前的工作目录, git 分支, 等等)。
  - title: 易于安装
    image: /assets/out-of-the-box.svg
    description: 安装后即可使用，不需要额外的配置。
  - title: 可定制
    image: /assets/configurable.svg
    description: 它也提供可制定的 API 来配置
---

# 欢迎登机, 宇航员!

<p align="center">
  <img alt="Spaceship with Hyper and One Dark" src="https://user-images.githubusercontent.com/10276208/36086434-5de52ace-0ff2-11e8-8299-c67f9ab4e9bd.gif" width="980px">
</p>

## 特性

**Spaceship** 包含了许多酷的特性。让我们先睹为快:

- 智能的主机名，用户名，命令符等显示。
- 当前 Git 和 Mercurial 项目状态。
- 当前后台 jobs 的指示符 `✦`。
- 当前的命令版本包括 Node.js `⬢`, Ruby `💎`, Elm `🌳`, Elixir `💧`, Swift `🐦`, Xcode `🛠`, Go `🐹`, PHP `🐘`, Rust `𝗥`, Haskell `λ`, Julia `ஃ`, Python `🐍`, Conda `🅒`, .NET SDK `.NET`, Ember.js `🐹`。
- 当前包管理器版本, 如果当前目录是一个包显示 `📦`。
- 显示当前的 Docker 版本和所连的机器 `🐳`。
- 显示当前AWS的概述 `☁️` ([Using named profiles](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html))。
- 当前 GCP 的激活配置 `☁️`。
- 当前 Kubectl 上下文 `☸️`。
- 当前 Terraform 工作台 `🛠`。
- 当前电池的电量和状态。
- 当前 Vi-mode 模式 ([临时开启手动别名](./options.zh.md#vi-mode-vi_mode))。
- 显示上一个命令执行的时间。

想要更多特性? 请[打开一个 issue](https://github.com/spaceship-prompt/yspaceship-prompt/issues/new/choose) 或者给我们发 PR。

<!-- prettier-ignore -->
!!! tip
    关注 [我们的 Twitter](//twitter.com/SpaceshipPrompt) 获取我们的新的特性、增强和bug修复的更新。

## 相关项目

以下是受到 Spaceship ZSH 的启发的相关项目列表。

- [**matchai/spacefish**](https://github.com/matchai/spacefish) - 一个针对 fish shell 的 Spaceship ZSH 的移植
- [**starship/starship**](https://github.com/starship/starship) - 一个用Rust编写的特别快的、跨多shell的命令行。

## 感谢您的支持

大家好！除了主要项目，我是利用我的业余时间来编写该项目的。我希望你享受地使用 Spaceship. 如果你真的很享受, 请[成为我的赞助者 🤝][patreon-url]。

|                                                                       Patreon                                                                       |                                                            Bitcoin                                                             |                                                            Ethereum                                                            |
| :-------------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------------------------------------------: |
|                                                           [成为赞助者][patreon-url]                                                            |                                              `1FrPrQb6ACTkbSBAz9PduJWrDFfq41Ggb4`                                              |                                          `0x6aF39C917359897ae6969Ad682C14110afe1a0a1`                                          |
| <a href="https://www.patreon.com/spaceship-prompt"><img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="150px"></a> | <img src="https://user-images.githubusercontent.com/3459374/33760933-1c9b81b4-dc10-11e7-8e4b-22d81f98c138.png" width="100px"/> | <img src="https://user-images.githubusercontent.com/3459374/33760932-1c7b3fb2-dc10-11e7-9774-411264d533da.png" width="100px"/> |

捐助是您表达: **我的工作是有价值.** 最佳方式。

感谢您的支持! _谢谢!_

## 许可

MIT © [Denys Dovhan](http://denysdovhan.com)

[patreon-url]: https://www.patreon.com/denysdovhan
[patreon-image]: https://img.shields.io/badge/zsh-%3E%3Dv5.2-777777.svg?style=flat-square
