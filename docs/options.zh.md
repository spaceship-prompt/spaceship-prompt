---
hide:
  - navigation
---

## 选项

您有能力自定义或禁用Spaceship的特定内容。 所有的选项必须在 `.zshrc` 文件中 Spaceship 主题**后**来重写。

模块颜色可以是 [基本颜色](https://wiki.archlinux.org/index.php/zsh#Colors) 或 [颜色代码](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg)。

**注意：** 符号 `·` 在本文档中代表一个常规的空格字符 ` `, 它用于明确指明选项的默认值何时以空格开始或结尾。

### 顺序

您可以使用 `SPACESHIP_PROPT_ORDER` 选项指定提示符的顺序。 使用 Zsh 数组语法来定义您自己的提示符顺序。

该选项同时定义 Spaceship 装载哪些模块。 如果你在缓慢的提示符中挣扎，你可以省略你不使用的模块，它们不会加载。

默认顺序是：

```zsh
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  gradle        # Gradle section
  maven         # Maven section
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  ibmcloud      # IBM Cloud section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
```

您也可以在 `SPACESHIP_RPROPT_ORDER` 选项中指定模块到右边提示符。 默认情况下 `SPACESHIP_RPROPT_ORDER` 是空的。

### Prompt

这组选项定义显示模块的提示符行为和标准参数。

| 变量                                   |   默认    | 释义                                               |
|:------------------------------------ |:-------:| ------------------------------------------------ |
| `SPACESHIP_PROMPT_ADD_NEWLINE`       | `true`  | Adds a newline character before each prompt line |
| `SPACESHIP_PROMPT_SEPARATE_LINE`     | `true`  | Make the prompt span across two lines            |
| `SPACESHIP_PROMPT_FIRST_PREFIX_SHOW` | `false` | Shows a prefix of the first section in prompt    |
| `SPACESHIP_PROMPT_PREFIXES_SHOW`     | `true`  | Show prefixes before prompt sections or not      |
| `SPACESHIP_PROMPT_SUFFIXES_SHOW`     | `true`  | Show suffixes before prompt sections or not      |
| `SPACESHIP_PROMPT_DEFAULT_PREFIX`    | `via·`  | Default prefix for prompt sections               |
| `SPACESHIP_PROMPT_DEFAULT_SUFFIX`    |   ``    | Default suffix for prompt section                |

### Char

| 变量                                |            默认            | 释义                                                                   |
|:--------------------------------- |:------------------------:| -------------------------------------------------------------------- |
| `SPACESHIP_CHAR_PREFIX`           |            ``            | Prefix before prompt character                                       |
| `SPACESHIP_CHAR_SUFFIX`           |            ``            | Suffix after prompt character                                        |
| `SPACESHIP_CHAR_SYMBOL`           |           `➜`            | Prompt character to be shown before any command                      |
| `SPACESHIP_CHAR_SYMBOL_ROOT`      | `$SPACESHIP_CHAR_SYMBOL` | Prompt character to be shown before any command for the root user    |
| `SPACESHIP_CHAR_SYMBOL_SECONDARY` | `$SPACESHIP_CHAR_SYMBOL` | Secondary prompt character to be shown for incomplete commands       |
| `SPACESHIP_CHAR_COLOR_SUCCESS`    |         `green`          | Color of prompt character if last command completes successfully     |
| `SPACESHIP_CHAR_COLOR_FAILURE`    |          `red`           | Color of prompt character if last command returns non-zero exit-code |
| `SPACESHIP_CHAR_COLOR_SECONDARY`  |         `yellow`         | Color of secondary prompt character                                  |

### Time (`time`)

默认为禁用。 如果您需要显示时间戳。在您的 `.zshrc`中, 将 `SPACESHIP_TIME_SHOW` 设置为 `true` 。

| 变量                      |                 默认                 | 释义                                                                                                                    |
|:----------------------- |:----------------------------------:| --------------------------------------------------------------------------------------------------------------------- |
| `SPACESHIP_TIME_SHOW`   |              `false`               | Show time (set to `true` for enabling)                                                                                |
| `SPACESHIP_TIME_PREFIX` |               `at·`                | Prefix before time section                                                                                            |
| `SPACESHIP_TIME_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after time section                                                                                             |
| `SPACESHIP_TIME_COLOR`  |              `yellow`              | Color of time section                                                                                                 |
| `SPACESHIP_TIME_FORMAT` |              `false`               | Custom date formatting [ZSH date formats](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Date-and-time) |
| `SPACESHIP_TIME_12HR`   |              `false`               | Format time using 12-hour clock (am/pm)                                                                               |

### Username (`user`)

默认情况下，只有当用户名与 `$LOGNAME`不同时，当您通过 SSH 连接或当您是 root 时才显示。 根用户用 `SPACESHIP_USER_COLOR_ROOT` 颜色高亮(红色为默认值)。

| 变量                          |                 默认                 | 释义                                                        |
|:--------------------------- |:----------------------------------:| --------------------------------------------------------- |
| `SPACESHIP_USER_SHOW`       |               `true`               | Show user section (`true`, `false`, `always` or `needed`) |
| `SPACESHIP_USER_PREFIX`     |              `with·`               | Prefix before user section                                |
| `SPACESHIP_USER_SUFFIX`     | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after user section                                 |
| `SPACESHIP_USER_COLOR`      |              `yellow`              | Color of user section                                     |
| `SPACESHIP_USER_COLOR_ROOT` |               `red`                | Color of user section when it's root                      |

`SPACESHIP_USER_SHOW` 定义何时显示用户名模块。 以下是可能的值：

| `SPACESHIP_USER_SHOW` | 在本地显示     | 在远程显示     |
|:---------------------:|:--------- |:--------- |
|        `false`        | Never     | Never     |
|       `always`        | Always    | Always    |
|        `true`         | If needed | Always    |
|       `needed`        | If needed | If needed |

### Hostname (`host`)

主机名只在您通过 SSH 连接时才显示，除非您更改此行为。

| 变量                         |                 默认                 | 释义                                              |
|:-------------------------- |:----------------------------------:| ----------------------------------------------- |
| `SPACESHIP_HOST_SHOW`      |               `true`               | Show host section (`true`, `false` or `always`) |
| `SPACESHIP_HOST_SHOW_FULL` |              `false`               | Show full hostname section (`true`, `false`)    |
| `SPACESHIP_HOST_PREFIX`    |               `at·`                | Prefix before the connected SSH machine name    |
| `SPACESHIP_HOST_SUFFIX`    | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the connected SSH machine name     |
| `SPACESHIP_HOST_COLOR`     |               `blue`               | Color of host section                           |
| `SPACESHIP_HOST_COLOR_SSH` |              `green`               | Color of host in SSH connection                 |

### Directory (`dir`)

目录总是显示和截短到 `SPACESHIP_DIR_TRUNC` 的值。 当您在仓库中，它只显示根目录和文件夹。 如果当前目录受写保护或当前用户没有足够的权限写入该目录， 小锁 (默认情况下) 为显示后缀。

| 变量                           |                                                     默认                                                      | 释义                                                                                     |
|:---------------------------- |:-----------------------------------------------------------------------------------------------------------:| -------------------------------------------------------------------------------------- |
| `SPACESHIP_DIR_SHOW`         |                                                   `true`                                                    | Show directory section                                                                 |
| `SPACESHIP_DIR_PREFIX`       |                                                    `in·`                                                    | Prefix before current directory                                                        |
| `SPACESHIP_DIR_SUFFIX`       |                                     `$SPACESHIP_PROMPT_DEFAULT_SUFFIX`                                      | Suffix after current directory                                                         |
| `SPACESHIP_DIR_TRUNC`        |                                                     `3`                                                     | Number of folders of cwd to show in prompt, 0 to show all                              |
| `SPACESHIP_DIR_TRUNC_PREFIX` |                                                     ``                                                      | Prefix before cwd when it's truncated. For example `…/` or `.../`, empty to disable    |
| `SPACESHIP_DIR_TRUNC_REPO`   |                                                   `true`                                                    | While in `git` repo, show only root directory and folders inside it                    |
| `SPACESHIP_DIR_COLOR`        |                                                   `cyan`                                                    | Color of directory section                                                             |
| `SPACESHIP_DIR_LOCK_SYMBOL`  | ![·](https://user-images.githubusercontent.com/10276208/46248218-4af95d80-c434-11e8-8e25-595d792503f1.png) | The symbol displayed if directory is write-protected (requires powerline patched font) |
| `SPACESHIP_DIR_LOCK_COLOR`   |                                                    `red`                                                    | Color for the lock symbol                                                              |

### Git (`git`)

Git 模块由 `git_brant` 和 `git_status` 子模块组成。 它仅在 Git 仓库中显示。

| 变量                     |                                                     默认                                                     | 释义                                                                                                               |
|:---------------------- |:----------------------------------------------------------------------------------------------------------:| ---------------------------------------------------------------------------------------------------------------- |
| `SPACESHIP_GIT_SHOW`   |                                                   `true`                                                   | Show Git section                                                                                                 |
| `SPACESHIP_GIT_PREFIX` |                                                   `on·`                                                    | Prefix before Git section                                                                                        |
| `SPACESHIP_GIT_SUFFIX` |                                     `$SPACESHIP_PROMPT_DEFAULT_SUFFIX`                                     | Suffix after Git section                                                                                         |
| `SPACESHIP_GIT_SYMBOL` | ![·](https://user-images.githubusercontent.com/3459374/34947621-4f324a92-fa13-11e7-9b99-cdba2cdda6b9.png) | Character to be shown before Git section (requires [powerline patched font](https://github.com/powerline/fonts)) |

#### Git branch (`git_branch`)

| 变量                            |           默认            | 释义                                  |
|:----------------------------- |:-----------------------:| ----------------------------------- |
| `SPACESHIP_GIT_BRANCH_SHOW`   |         `true`          | Show Git branch subsection          |
| `SPACESHIP_GIT_BRANCH_PREFIX` | `$SPACESHIP_GIT_SYMBOL` | Prefix before Git branch subsection |
| `SPACESHIP_GIT_BRANCH_SUFFIX` |           ``            | Suffix after Git branch subsection  |
| `SPACESHIP_GIT_BRANCH_COLOR`  |        `magenta`        | Color of Git branch subsection      |

#### Git status (`git_status`)

Git 状态指示器仅在您弄乱的仓库时才显示。

| 变量                               |   默认   | 释义                                                           |
|:-------------------------------- |:------:| ------------------------------------------------------------ |
| `SPACESHIP_GIT_STATUS_SHOW`      | `true` | Show Git status subsection                                   |
| `SPACESHIP_GIT_STATUS_PREFIX`    |  `·[`  | Prefix before Git status subsection                          |
| `SPACESHIP_GIT_STATUS_SUFFIX`    |  `]`   | Suffix after Git status subsection                           |
| `SPACESHIP_GIT_STATUS_COLOR`     | `red`  | Color of Git status subsection                               |
| `SPACESHIP_GIT_STATUS_UNTRACKED` |  `?`   | Indicator for untracked changes                              |
| `SPACESHIP_GIT_STATUS_ADDED`     |  `+`   | Indicator for added changes                                  |
| `SPACESHIP_GIT_STATUS_MODIFIED`  |  `!`   | Indicator for unstaged files                                 |
| `SPACESHIP_GIT_STATUS_RENAMED`   |  `»`   | Indicator for renamed files                                  |
| `SPACESHIP_GIT_STATUS_DELETED`   |  `✘`   | Indicator for deleted files                                  |
| `SPACESHIP_GIT_STATUS_STASHED`   |  `$`   | Indicator for stashed changes                                |
| `SPACESHIP_GIT_STATUS_UNMERGED`  |  `=`   | Indicator for unmerged changes                               |
| `SPACESHIP_GIT_STATUS_AHEAD`     |  `⇡`   | Indicator for unpushed changes (ahead of remote branch)      |
| `SPACESHIP_GIT_STATUS_BEHIND`    |  `⇣`   | Indicator for unpulled changes (behind of remote branch)     |
| `SPACESHIP_GIT_STATUS_DIVERGED`  |  `⇕`   | Indicator for diverged changes (diverged with remote branch) |

### Mercurial (`hg`)

Mercurial 模块由 ` hg_branch ` 和 ` hg_status ` 子模块组成。 它只显示在 Mercurial 仓库中。

| 变量                    |                 默认                 | 释义                                             |
|:--------------------- |:----------------------------------:| ---------------------------------------------- |
| `SPACESHIP_HG_SHOW`   |               `true`               | Show Mercurial section                         |
| `SPACESHIP_HG_PREFIX` |               `on·`                | Prefix before Mercurial section                |
| `SPACESHIP_HG_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Mercurial section                 |
| `SPACESHIP_HG_SYMBOL` |                `☿·`                | Character to be shown before Mercurial section |

#### Mercurial branch (`hg_branch`)

在可用时显示 Mercurial 书签，否则显示 Mercurial 分支信息。

| 变量                           |                 默认                 | 释义                                        |
|:---------------------------- |:----------------------------------:| ----------------------------------------- |
| `SPACESHIP_HG_BRANCH_SHOW`   |               `true`               | Show Mercurial branch subsection          |
| `SPACESHIP_HG_BRANCH_PREFIX` |       `$SPACESHIP_HG_SYMBOL`       | Prefix before Mercurial branch subsection |
| `SPACESHIP_HG_BRANCH_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Mercurial branch subsection  |
| `SPACESHIP_HG_BRANCH_COLOR`  |             `magenta`              | Color of Mercurial branch subsection      |

#### Mercurial status (`hg_status`)

Mercurial 状态指示器仅在您弄乱的仓库时才显示。

| 变量                              |   默认   | 释义                                        |
|:------------------------------- |:------:| ----------------------------------------- |
| `SPACESHIP_HG_STATUS_SHOW`      | `true` | Show Mercurial status subsection          |
| `SPACESHIP_HG_STATUS_PREFIX`    |  `[`   | Prefix before Mercurial status subsection |
| `SPACESHIP_HG_STATUS_SUFFIX`    |  `]`   | Suffix after Mercurial status subsection  |
| `SPACESHIP_HG_STATUS_COLOR`     | `red`  | Color of Mercurial status subsection      |
| `SPACESHIP_HG_STATUS_UNTRACKED` |  `?`   | Indicator for untracked changes           |
| `SPACESHIP_HG_STATUS_ADDED`     |  `+`   | Indicator for added changes               |
| `SPACESHIP_HG_STATUS_MODIFIED`  |  `!`   | Indicator for unstaged files              |
| `SPACESHIP_HG_STATUS_DELETED`   |  `✘`   | Indicator for deleted files               |

### Package version (`package`)

> 目前适用于 [npm](https://www.npmjs.com/) 和 [cargo](https://crates.io/)。 请帮助我们改进这个版块！

当仓库是一个软件包时，将显示软件包版本。

- **npm** — `npm` 软件包包含一个 `package.json` 文件。 我们使用 `jq`, `python` 解析软件包版本以提高性能， `node` 作为后补。 安装 [jq](https://stedolan.github.io/jq/) 来此模块的性能 **改进性能**([为什么？](./troubleshooting.md#why-is-my-prompt-slow))
- **lerna** — `lerna` monorepo contains a `lerna.json` file. We use `jq`, `python` to parse package version for improving performance and `node` as a fallback. Install [jq](https://stedolan.github.io/jq/) for **improved performance** of this section (same reason as npm).
- **cargo** — `cargo` package contains a `Cargo.toml` file. Currently, we use `cargo pkgid`, it depends on `Cargo.lock`. So if package version isn't shown, you may need to run some command like `cargo build` which can generate `Cargo.lock` file.

> **注意：** 这是您正在使用的软件包版本，而不是软件包管理器本身的版本。

| 变量                         |                 默认                 | 释义                                           |
|:-------------------------- |:----------------------------------:| -------------------------------------------- |
| `SPACESHIP_PACKAGE_SHOW`   |               `true`               | Show package version                         |
| `SPACESHIP_PACKAGE_PREFIX` |               `is·`                | Prefix before package version section        |
| `SPACESHIP_PACKAGE_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after package version section         |
| `SPACESHIP_PACKAGE_SYMBOL` |                `📦·`                | Character to be shown before package version |
| `SPACESHIP_PACKAGE_COLOR`  |               `red`                | Color of package version section             |

### Node.js (`node`)

Node.js包只显示在包含 `package.json` 文件, 或 `node_modules` 文件夹, 或者其他以 `.js` 为后缀的文件的包。

如果您将 `SPACESHIP_NODEFAULT_VERSION` 设置为默认 Node.js 版本并且您当前的版本与 `SPACESHIP_NODEFAULT_VERSION`相同，那么Node.js 模块将被隐藏。

| 变量                               |                 默认                 | 释义                                           |
|:-------------------------------- |:----------------------------------:| -------------------------------------------- |
| `SPACESHIP_NODE_SHOW`            |               `true`               | Current Node.js section                      |
| `SPACESHIP_NODE_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Node.js section                |
| `SPACESHIP_NODE_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Node.js section                 |
| `SPACESHIP_NODE_SYMBOL`          |                `⬢·`                | Character to be shown before Node.js version |
| `SPACESHIP_NODE_DEFAULT_VERSION` |                 ``                 | Node.js version to be treated as default     |
| `SPACESHIP_NODE_COLOR`           |              `green`               | Color of Node.js section                     |

### Ruby (`ruby`)

Ruby 模块包只显示在包含 ` Gemfile ` 文件, 或 ` Rakefile ` 文件夹, 或者其他以 `.rb` 为后缀的文件的包。

| 变量                      |                 默认                 | 释义                                        |
|:----------------------- |:----------------------------------:| ----------------------------------------- |
| `SPACESHIP_RUBY_SHOW`   |               `true`               | Show Ruby section                         |
| `SPACESHIP_RUBY_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Ruby section                |
| `SPACESHIP_RUBY_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Ruby section                 |
| `SPACESHIP_RUBY_SYMBOL` |                `💎·`                | Character to be shown before Ruby version |
| `SPACESHIP_RUBY_COLOR`  |               `red`                | Color of Ruby section                     |

### Elm (`elm`)

Elm 模块包只显示在包含 `elm.json` 文件, 或 `elm-package.json` 文件, 或 `elm-stuff` 文件夹或者其他以 `. elm ` 为后缀的文件的包。

| 变量                     |                 默认                 | 释义                                       |
|:---------------------- |:----------------------------------:| ---------------------------------------- |
| `SPACESHIP_ELM_SHOW`   |               `true`               | Show installed Elm version               |
| `SPACESHIP_ELM_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Elm section                |
| `SPACESHIP_ELM_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Elm section                 |
| `SPACESHIP_ELM_SYMBOL` |                `🌳·`                | Character to be shown before Elm version |
| `SPACESHIP_ELM_COLOR`  |               `cyan`               | Color of Elm section                     |

### Elixir (`elixir`)

Elixir 模块只显示在包含 `mix.exs`, 或任何其他有 `.ex` 或 `.exs` 扩展名的文件的目录中。 如果当前elixir版本与 `SPACESHIP_ELIXIR_DEFAULT_VERSION`中设置的版本相同，elixir 模块将被隐藏。

| 变量                                 |                 默认                 | 释义                                          |
|:---------------------------------- |:----------------------------------:| ------------------------------------------- |
| `SPACESHIP_ELIXIR_SHOW`            |               `true`               | Show Elixir section                         |
| `SPACESHIP_ELIXIR_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Elixir section                |
| `SPACESHIP_ELIXIR_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Elixir section                 |
| `SPACESHIP_ELIXIR_DEFAULT_VERSION` |                 ``                 | Elixir version to be treated as default     |
| `SPACESHIP_ELIXIR_SYMBOL`          |                `💧·`                | Character to be shown before Elixir version |
| `SPACESHIP_ELIXIR_COLOR`           |             `magenta`              | Color of Elixir section                     |

### Xcode (`xcode`)

显示 Xcode 的当前版本。 本地版本比全局更优先。

| 变量                            |                 默认                 | 释义                                           |
|:----------------------------- |:----------------------------------:| -------------------------------------------- |
| `SPACESHIP_XCODE_SHOW_LOCAL`  |               `true`               | Current local Xcode version based on [xcenv] |
| `SPACESHIP_XCODE_SHOW_GLOBAL` |              `false`               | Global Xcode version based on [xcenv]        |
| `SPACESHIP_XCODE_PREFIX`      | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Xcode section                  |
| `SPACESHIP_XCODE_SUFFIX`      | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Xcode section                   |
| `SPACESHIP_XCODE_SYMBOL`      |                `🛠·`                | Character to be shown before Xcode version   |
| `SPACESHIP_XCODE_COLOR`       |               `blue`               | Color of Xcode section                       |

### Swift (`swift`)

显示 Swift 的当前版本。 本地版本比全局更优先。

| 变量                            |                 默认                 | 释义                                              |
|:----------------------------- |:----------------------------------:| ----------------------------------------------- |
| `SPACESHIP_SWIFT_SHOW_LOCAL`  |               `true`               | Current local Swift version based on [swiftenv] |
| `SPACESHIP_SWIFT_SHOW_GLOBAL` |              `false`               | Global Swift version based on [swiftenv]        |
| `SPACESHIP_SWIFT_PREFIX`      | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the Swift section                 |
| `SPACESHIP_SWIFT_SUFFIX`      | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix to be shown before the Swift section     |
| `SPACESHIP_SWIFT_SYMBOL`      |                `🐦·`                | Character to be shown before Swift version      |
| `SPACESHIP_SWIFT_COLOR`       |              `yellow`              | Color of Swift section                          |

### Go (`golang`)

Go 模块只在包含 `go.mod`, `Godeps`, `glide.yaml`, 等其他以 `.go` 为后缀的目录中或者工作区被定义在 `$GOPATH`中的目录内显示。

如果您正在使用开发版的 `Go`，版本将使用 git 提交哈希值代替。

例如

- `devel:5efe9a8f11` 开发版本
- `v1.1.4` 发行版

| 变量                        |                 默认                 | 释义                                      |
|:------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_GOLANG_SHOW`   |               `true`               | Shown current Go version or not         |
| `SPACESHIP_GOLANG_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the Go section            |
| `SPACESHIP_GOLANG_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Go section             |
| `SPACESHIP_GOLANG_SYMBOL` |                `🐹·`                | Character to be shown before Go version |
| `SPACESHIP_GOLANG_COLOR`  |               `cyan`               | Color of Go section                     |

### PHP (`php`)

PHP 模块包只显示在包含 ` composer.json ` 文件, 或者其他以 `. php ` 为后缀的文件的包中。

| 变量                     |                 默认                 | 释义                                       |
|:---------------------- |:----------------------------------:| ---------------------------------------- |
| `SPACESHIP_PHP_SHOW`   |                true                | Show PHP section                         |
| `SPACESHIP_PHP_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the PHP section            |
| `SPACESHIP_PHP_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the PHP section             |
| `SPACESHIP_PHP_SYMBOL` |                `🐘·`                | Character to be shown before PHP version |
| `SPACESHIP_PHP_COLOR`  |               `blue`               | Color of PHP section                     |

### Rust (`rust`)

Rust 模块包只显示在包含 ` Cargo.toml ` 文件, 或者其他以 `. rs ` 为后缀的文件的包中。

| 变量                               |                 默认                 | 释义                                                      |
|:-------------------------------- |:----------------------------------:| ------------------------------------------------------- |
| `SPACESHIP_RUST_SHOW`            |               `true`               | Shown current Rust version or not                       |
| `SPACESHIP_RUST_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the Rust section                          |
| `SPACESHIP_RUST_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Rust section                           |
| `SPACESHIP_RUST_SYMBOL`          |                `🦀·`                | Character to be shown before Rust version               |
| `SPACESHIP_RUST_COLOR`           |               `red`                | Color of Rust section                                   |
| `SPACESHIP_RUST_VERBOSE_VERSION` |              `false`               | Show what branch is being used, if any. (Beta, Nightly) |

### Haskell (`haskell`)

Haskell 模块只显示在包含 `stack.yaml` 文件的目录中。

| 变量                         |                 默认                 | 释义                                                      |
|:-------------------------- |:----------------------------------:| ------------------------------------------------------- |
| `SPACESHIP_HASKELL_SHOW`   |               `true`               | Shown current Haskell Tool Stack version or not         |
| `SPACESHIP_HASKELL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the Haskell section                       |
| `SPACESHIP_HASKELL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Haskell section                        |
| `SPACESHIP_HASKELL_SYMBOL` |                `λ·`                | Character to be shown before Haskell Tool Stack version |
| `SPACESHIP_HASKELL_COLOR`  |               `red`                | Color of Haskell section                                |

### Julia (`julia`)

Julia 模块包只显示在包含    文件, 或者其他以 `. jl ` 为后缀的文件的包中。

| 变量                       |                 默认                 | 释义                                         |
|:------------------------ |:----------------------------------:| ------------------------------------------ |
| `SPACESHIP_JULIA_SHOW`   |               `true`               | Shown current Julia version or not         |
| `SPACESHIP_JULIA_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the Julia section            |
| `SPACESHIP_JULIA_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Julia section             |
| `SPACESHIP_JULIA_SYMBOL` |                `ஃ·`                | Character to be shown before Julia version |
| `SPACESHIP_JULIA_COLOR`  |              `green`               | Color of Julia section                     |

### Docker (`docker`)

Docker 模块只显示在包含 `Dockerfile` 或可以运行 `docker-compose` 的目录中。

`docker-compose` 将仅在有 docker-compose.yml 或者其他由 `COMPOSE_FILE` 指定可以访问的文件的情况下运行。

环境变量 `COMPOSE_PATH_SEPARATOR` 也被支持。 更多信息见 [Compose CLI 环境变量](https://docs.docker.com/compose/reference/envvars/)。

| 变量                         |                 默认                 | 释义                                          |
|:-------------------------- |:----------------------------------:| ------------------------------------------- |
| `SPACESHIP_DOCKER_SHOW`    |               `true`               | Show current Docker version or not          |
| `SPACESHIP_DOCKER_PREFIX`  |                `on`                | Prefix before the Docker section            |
| `SPACESHIP_DOCKER_SUFFIX`  | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Docker section             |
| `SPACESHIP_DOCKER_SYMBOL`  |                `🐳·`                | Character to be shown before Docker version |
| `SPACESHIP_DOCKER_COLOR`   |               `cyan`               | Color of Docker section                     |
| `SPACESHIP_DOCKER_VERBOSE` |              `false`               | Show complete Docker version                |

### Docker context (`docker_context`)

| 变量                                |   默认   | 释义                                       |
|:--------------------------------- |:------:| ---------------------------------------- |
| `SPACESHIP_DOCKER_CONTEXT_SHOW`   | `true` | Show current Docker context or not       |
| `SPACESHIP_DOCKER_CONTEXT_PREFIX` |  `·(`  | Prefix before the Docker context section |
| `SPACESHIP_DOCKER_CONTEXT_SUFFIX` |  `)`   | Suffix after the Docker context section  |

### Amazon Web Services (AWS) (`aws`)

Shows selected Amazon Web Services profile configured using [`AWS_VAULT`](https://github.com/99designs/aws-vault) variable if not defined will use [`AWS_PROFILE`](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html).

| 变量                     |                 默认                 | 释义                                           |
|:---------------------- |:----------------------------------:| -------------------------------------------- |
| `SPACESHIP_AWS_SHOW`   |               `true`               | Show current selected AWS-cli profile or not |
| `SPACESHIP_AWS_PREFIX` |              `using·`              | Prefix before the AWS section                |
| `SPACESHIP_AWS_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the AWS section                 |
| `SPACESHIP_AWS_SYMBOL` |               `☁️·`                | Character to be shown before AWS profile     |
| `SPACESHIP_AWS_COLOR`  |               `208`                | Color of AWS section                         |

### Google Cloud Platform (`gcloud`)

使用 gcloud 活动配置文件显示活跃的 Google 云平台配置。

| 变量                        |                 默认                 | 释义                                                       |
|:------------------------- |:----------------------------------:| -------------------------------------------------------- |
| `SPACESHIP_GCLOUD_SHOW`   |               `true`               | Show current active gcloud configuration or not          |
| `SPACESHIP_GCLOUD_PREFIX` |              `using·`              | Prefix before the GCLOUD section                         |
| `SPACESHIP_GCLOUD_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the GCLOUD section                          |
| `SPACESHIP_GCLOUD_SYMBOL` |               `☁️·`                | Character to be shown before GCLOUD active configuration |
| `SPACESHIP_GCLOUD_COLOR`  |                `26`                | Color of GCLOUD section                                  |

### Virtualenv (`venv`)

| 字段                             |                 默认                 | 含义                                                                                             |
|:------------------------------ |:----------------------------------:| ---------------------------------------------------------------------------------------------- |
| `SPACESHIP_VENV_SHOW`          |               `true`               | Show current Python virtualenv or not                                                          |
| `SPACESHIP_VENV_PREFIX`        | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the virtualenv section                                                           |
| `SPACESHIP_VENV_SUFFIX`        | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the virtualenv section                                                            |
| `SPACESHIP_VENV_SYMBOL`        |                `·`                 | Character to be shown before virtualenv                                                        |
| `SPACESHIP_VENV_GENERIC_NAMES` |     `(virtualenv venv .venv)`      | If the virtualenv folder is in this _array_, than use its parent directory as its name instead |
| `SPACESHIP_VENV_COLOR`         |               `blue`               | Color of virtualenv environment section                                                        |

### Conda virtualenv (`conda`)

显示激活的 conda 虚拟环境。 使用 `config --set changeps1 False` 禁用本机conda 提示符。

| 变量                        |                 默认                 | 释义                                                       |
|:------------------------- |:----------------------------------:| -------------------------------------------------------- |
| `SPACESHIP_CONDA_SHOW`    |               `true`               | Show current Python conda virtualenv or not              |
| `SPACESHIP_CONDA_PREFIX`  | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the conda virtualenv section               |
| `SPACESHIP_CONDA_SUFFIX`  | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the conda virtualenv section                |
| `SPACESHIP_CONDA_SYMBOL`  |                `🅒·`                | Character to be shown before conda virtualenv section    |
| `SPACESHIP_CONDA_COLOR`   |               `blue`               | Color of conda virtualenv environment section            |
| `SPACESHIP_CONDA_VERBOSE` |               `true`               | Toggle to truncate environment names under custom prefix |

### Pyenv (`pyenv`)

pyenv 模块包只显示在包含`requirements.txt` 文件, `pyproject.toml` 或者其他以 `.py` 为后缀的文件的包中。

| 变量                       |                 默认                 | 释义                                         |
|:------------------------ |:----------------------------------:| ------------------------------------------ |
| `SPACESHIP_PYENV_SHOW`   |               `true`               | Show current Pyenv version or not          |
| `SPACESHIP_PYENV_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before the pyenv section            |
| `SPACESHIP_PYENV_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the pyenv section             |
| `SPACESHIP_PYENV_SYMBOL` |                `🐍·`                | Character to be shown before Pyenv version |
| `SPACESHIP_PYENV_COLOR`  |              `yellow`              | Color of Pyenv section                     |

### .NET (`dotnet`)

.NET 模块只显示在包含 `project.json` 或 `global.json` 文件或其扩展名为 `.csproj`, `.xproj` 或 `.sln` 的文件的目录中。

| 变量                        |                 默认                 | 释义                                        |
|:------------------------- |:----------------------------------:| ----------------------------------------- |
| `SPACESHIP_DOTNET_SHOW`   |               `true`               | Current .NET section                      |
| `SPACESHIP_DOTNET_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before .NET section                |
| `SPACESHIP_DOTNET_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after .NET section                 |
| `SPACESHIP_DOTNET_SYMBOL` |              `.NET·`               | Character to be shown before .NET version |
| `SPACESHIP_DOTNET_COLOR`  |               `128`                | Color of .NET section                     |

### Ember.js (`ember`)

Ember.js 模块只显示在包含 `ember-cli-build.js` 文件的目录中。

| 变量                       |                 默认                 | 释义                                            |
|:------------------------ |:----------------------------------:| --------------------------------------------- |
| `SPACESHIP_EMBER_SHOW`   |               `true`               | Current Ember.js section                      |
| `SPACESHIP_EMBER_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Ember.js section                |
| `SPACESHIP_EMBER_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Ember.js section                 |
| `SPACESHIP_EMBER_SYMBOL` |                `🐹·`                | Character to be shown before Ember.js version |
| `SPACESHIP_EMBER_COLOR`  |               `210`                | Color of Ember.js section                     |

### Kubernetes (`kubectl`)

Kubernetes 模块由 `kubectl_version` 和 `kubectl_context` 子模块组成。 它仅在 kubectl 可以连接到 Kubernetes 集群时才显示。

| 变量                         |                 默认                 | 释义                                                 |
|:-------------------------- |:----------------------------------:| -------------------------------------------------- |
| `SPACESHIP_KUBECTL_SHOW`   |              `false`               | Show Kubernetes section                            |
| `SPACESHIP_KUBECTL_PREFIX` |               `at·`                | Prefix before Kubernetes section                   |
| `SPACESHIP_KUBECTL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Kubernetes section                    |
| `SPACESHIP_KUBECTL_COLOR`  |              `white`               | Color of Kubernetes section                        |
| `SPACESHIP_KUBECTL_SYMBOL` |               `☸️··`               | Character to be shown before Kubernetes subsection |

#### Kubernetes version (`kubectl_version`)

| 变量                                 |                 默认                 | 释义                                          |
|:---------------------------------- |:----------------------------------:| ------------------------------------------- |
| `SPACESHIP_KUBECTL_VERSION_SHOW`   |               `true`               | Show Kubernetes version subsection          |
| `SPACESHIP_KUBECTL_VERSION_PREFIX` |                 ``                 | Prefix before Kubernetes version subsection |
| `SPACESHIP_KUBECTL_VERSION_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Kubernetes version subsection  |
| `SPACESHIP_KUBECTL_VERSION_COLOR`  |               `cyan`               | Color of Kubernetes version subsection      |

### Kubernetes context (`kubectl_context`)

显示活动的 kubectl 上下文，它包含一个群集名称，并且在非默认命名空间中工作时，也包含命名空间名称。

**💡 提示:** 如果你的集群名称(因而也是上下文名称) 过长。 您可以使用 `kubectl config rename-context very_long_context_name name` 给它一个较短的名称。

| 变量                                     |                 默认                 | 释义                                                              |
|:-------------------------------------- |:----------------------------------:| --------------------------------------------------------------- |
| `SPACESHIP_KUBECONTEXT_SHOW`           |               `true`               | Current Kubectl context section                                 |
| `SPACESHIP_KUBECONTEXT_PREFIX`         |               `at·`                | Prefix before Kubectl context section                           |
| `SPACESHIP_KUBECONTEXT_SUFFIX`         | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Kubectl context section                            |
| `SPACESHIP_KUBECONTEXT_COLOR`          |               `cyan`               | Color of Kubectl context section                                |
| `SPACESHIP_KUBECONTEXT_NAMESPACE_SHOW` |               `true`               | Should namespace be also displayed                              |
| `SPACESHIP_KUBECONTEXT_COLOR_GROUPS`   |                 ``                 | _Array_ of pairs of colors and match patterns, empty by default |

**颜色组：** 根据上下文或命名空间将该模块设置为不同的颜色。 您可以定义一个对值数组，在这个数组中，对值的第一个值是要使用的颜色名称，第二个值是与模块文本 (上下文名称和/或命名空间) 匹配的正则表达式模式。 第一个匹配的模式将决定颜色，所以列表顺序可以用来确定模式的优先次序。

例如：如下设置可被添加到 `.bashrc` 文件中：

```zsh
SPACESHIP_KUBECONTEXT_COLOR_GROUPS=(
  # red if namespace is "kube-system"
  red    '\(kube-system)$'
  # else, green if "dev-01" is anywhere in the context or namespace
  green  dev-01
  # else, red if context name ends with ".k8s.local" _and_ namespace is "system"
  red    '\.k8s\.local \(system)$'
  # else, yellow if the entire content is "test-" followed by digits, and no namespace is displayed
  yellow '^test-[0-9]+$'
)
```

### Gradle (`gradle`)

显示当前的 gradle & jvm 版本。

| 变量                                     |                 默认                 | 释义                                              |
|:-------------------------------------- |:----------------------------------:| ----------------------------------------------- |
| `SPACESHIP_GRADLE_SHOW`                |               `true`               | Current Gradle section                          |
| `SPACESHIP_GRADLE_PREFIX`              | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Gradle section                    |
| `SPACESHIP_GRADLE_SUFFIX`              | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Gradle section                     |
| `SPACESHIP_GRADLE_SYMBOL`              |                `⬡·`                | Character to be shown before Gradle section     |
| `SPACESHIP_GRADLE_DEFAULT_VERSION`     |                 ``                 | Gradle version to be treated as default         |
| `SPACESHIP_GRADLE_COLOR`               |              `green`               | Color of Gradle section                         |
| `SPACESHIP_GRADLE_JVM_SHOW`            |               `true`               | Show JVM version used by Gradle                 |
| `SPACESHIP_GRADLE_JVM_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Gradle JVM section                |
| `SPACESHIP_GRADLE_JVM_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Gradle JVM section                 |
| `SPACESHIP_GRADLE_JVM_SYMBOL`          |               `☕️·`                | Character to be shown before Gradle JVM section |
| `SPACESHIP_GRADLE_JVM_DEFAULT_VERSION` |                 ``                 | Gradle JVM version to be treated as default     |
| `SPACESHIP_GRADLE_JVM_COLOR`           |             `magenta`              | Color of Gradle JVM section                     |

### Maven (`maven`)

显示当前的 maven & jvm 版本。

| 变量                                    |                 默认                 | 释义                                             |
|:------------------------------------- |:----------------------------------:| ---------------------------------------------- |
| `SPACESHIP_MAVEN_SHOW`                |               `true`               | Current Maven section                          |
| `SPACESHIP_MAVEN_PREFIX`              | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Maven section                    |
| `SPACESHIP_MAVEN_SUFFIX`              | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Maven section                     |
| `SPACESHIP_MAVEN_SYMBOL`              |                `𝑚·`                | Character to be shown before Maven section     |
| `SPACESHIP_MAVEN_DEFAULT_VERSION`     |                 ``                 | Maven version to be treated as default         |
| `SPACESHIP_MAVEN_COLOR`               |              `yellow`              | Color of Maven section                         |
| `SPACESHIP_MAVEN_JVM_SHOW`            |               `true`               | Show JVM version used by Maven                 |
| `SPACESHIP_MAVEN_JVM_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Maven JVM section                |
| `SPACESHIP_MAVEN_JVM_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Maven JVM section                 |
| `SPACESHIP_MAVEN_JVM_SYMBOL`          |               `☕️·`                | Character to be shown before Maven JVM section |
| `SPACESHIP_MAVEN_JVM_DEFAULT_VERSION` |                 ``                 | Maven JVM version to be treated as default     |
| `SPACESHIP_MAVEN_JVM_COLOR`           |             `magenta`              | Color of Maven JVM section                     |

### Terraform workspace (`terraform`)

在包含 `.terraform/environment` 文件的目录中显示活动的 Terraform 工作区。

| 变量                           |                 默认                 | 释义                                               |
|:---------------------------- |:----------------------------------:| ------------------------------------------------ |
| `SPACESHIP_TERRAFORM_SHOW`   |               `true`               | Current Terraform workspace section              |
| `SPACESHIP_TERRAFORM_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix before Terraform workspace section        |
| `SPACESHIP_TERRAFORM_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Terraform workspace section         |
| `SPACESHIP_TERRAFORM_SYMBOL` |               `🛠️·`                | Character to be shown before Terraform workspace |
| `SPACESHIP_TERRAFORM_COLOR`  |               `105`                | Color of Terraform workspace section             |

### IBM Cloud (`ibmcloud`)

Shows the selected IBM Cloud account by looking up with `ibmcloud target`.

| 变量                          |                 默认                 | 释义                                             |
|:--------------------------- |:----------------------------------:| ---------------------------------------------- |
| `SPACESHIP_IBMCLOUD_SHOW`   |              `false`               | Current IBM Cloud section                      |
| `SPACESHIP_IBMCLOUD_PREFIX` |              `using·`              | Prefix before IBM Cloud section                |
| `SPACESHIP_IBMCLOUD_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after IBM Cloud section                 |
| `SPACESHIP_IBMCLOUD_SYMBOL` |                `👔·`                | Character to be shown before IBM Cloud section |
| `SPACESHIP_IBMCLOUD_COLOR`  |               `039`                | Color of IBM Cloud section                     |

### Execution time (`exec_time`)

Execution time of the last command. Will be displayed if it exceeds the set threshold of time.

| 变量                            |                 默认                 | 释义                                                               |
|:----------------------------- |:----------------------------------:| ---------------------------------------------------------------- |
| `SPACESHIP_EXEC_TIME_SHOW`    |               `true`               | Show execution time                                              |
| `SPACESHIP_EXEC_TIME_PREFIX`  |              `took·`               | Prefix before execution time section                             |
| `SPACESHIP_EXEC_TIME_SUFFIX`  | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after execution time section                              |
| `SPACESHIP_EXEC_TIME_COLOR`   |              `yellow`              | Color of execution time section                                  |
| `SPACESHIP_EXEC_TIME_ELAPSED` |                `2`                 | The minimum number of seconds for showing execution time section |

### Battery (`battery`)

By default, Battery section is shown only if battery level is below `SPACESHIP_BATTERY_THRESHOLD` (default: 10%).

| Variable                               |              Default               | Meaning                                                              |
|:-------------------------------------- |:----------------------------------:| -------------------------------------------------------------------- |
| `SPACESHIP_BATTERY_SHOW`               |               `true`               | Show battery section or not (`true`, `false`, `always` or `charged`) |
| `SPACESHIP_BATTERY_PREFIX`             |                 ``                 | Prefix before battery section                                        |
| `SPACESHIP_BATTERY_SUFFIX`             | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after battery section                                         |
| `SPACESHIP_BATTERY_SYMBOL_CHARGING`    |                `⇡`                 | Character to be shown if battery is charging                         |
| `SPACESHIP_BATTERY_SYMBOL_DISCHARGING` |                `⇣`                 | Character to be shown if battery is discharging                      |
| `SPACESHIP_BATTERY_SYMBOL_FULL`        |                `•`                 | Character to be shown if battery is full                             |
| `SPACESHIP_BATTERY_THRESHOLD`          |                 10                 | Battery level below which battery section will be shown              |

`SPACESHIP_BATTERY_SHOW` defines when to show battery section. Here are possible values:

| `SPACESHIP_BATTERY_SHOW` | Below threshold | Above threshold | Fully charged |
|:------------------------:|:--------------- |:--------------- |:------------- |
|         `false`          | Hidden          | Hidden          | Hidden        |
|         `always`         | Shown           | Shown           | Shown         |
|          `true`          | Shown           | Hidden          | Hidden        |
|        `charged`         | Shown           | Hidden          | Shown         |

### Vi-mode (`vi_mode`)

This section shows mode indicator only when Vi-mode is enabled.

| Variable                   |              Default               | Meaning                              |
|:-------------------------- |:----------------------------------:| ------------------------------------ |
| `SPACESHIP_VI_MODE_SHOW`   |               `true`               | Shown current Vi-mode or not         |
| `SPACESHIP_VI_MODE_PREFIX` |                 ``                 | Prefix before Vi-mode section        |
| `SPACESHIP_VI_MODE_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after Vi-mode section         |
| `SPACESHIP_VI_MODE_INSERT` |               `[I]`                | Text to be shown when in insert mode |
| `SPACESHIP_VI_MODE_NORMAL` |               `[N]`                | Text to be shown when in normal mode |
| `SPACESHIP_VI_MODE_COLOR`  |              `white`               | Color of Vi-mode section             |

You can temporarily enable or disable vi-mode with handy functions (just execute them in terminal as any other regular command):

| Function                    | Meaning                                      |
|:--------------------------- | -------------------------------------------- |
| `spaceship_vi_mode_enable`  | Enable vi-mode for current terminal session  |
| `spaceship_vi_mode_disable` | Disable vi-mode for current terminal session |

**Note:** If the prompt does not refresh when changing modes add `eval spaceship_vi_mode_enable` to your `.zshrc`. Beware that `spaceship_vi_mode_enable` will override the`zle-keymap-select` widget, so if you have a custom one just make sure it contains the line `zle reset-prompt ; zle -R`.

**Note:** For oh-my-zsh users with vi-mode plugin enabled: Add `export RPS1="%{$reset_color%}"` before `source $ZSH/oh-my-zsh.sh` in `.zshrc` to disable default `<<<` NORMAL mode indicator in right prompt.

### Jobs (`jobs`)

This section show only when there are active jobs in the background.

| 变量                                |   默认   | 释义                                                                        |
|:--------------------------------- |:------:| ------------------------------------------------------------------------- |
| `SPACESHIP_JOBS_SHOW`             | `true` | Show background jobs indicator                                            |
| `SPACESHIP_JOBS_PREFIX`           |   ``   | Prefix before the jobs indicator                                          |
| `SPACESHIP_JOBS_SUFFIX`           |   ``   | Suffix after the jobs indicator                                           |
| `SPACESHIP_JOBS_SYMBOL`           |  `✦`   | Character to be shown when jobs are hiding                                |
| `SPACESHIP_JOBS_COLOR`            | `blue` | Color of background jobs section                                          |
| `SPACESHIP_JOBS_AMOUNT_PREFIX`    |   ``   | Prefix before the number of jobs (between jobs indicator and jobs amount) |
| `SPACESHIP_JOBS_AMOUNT_SUFFIX`    |   ``   | Suffix after the number of jobs                                           |
| `SPACESHIP_JOBS_AMOUNT_THRESHOLD` |  `1`   | Number of jobs after which job count will be shown                        |

### Exit code (`exit_code`)

Disabled by default. Set `SPACESHIP_EXIT_CODE_SHOW` to `true` in your `.zshrc`, if you need to show exit code of last command.

| Variable                     | Default | Meaning                                |
|:---------------------------- |:-------:| -------------------------------------- |
| `SPACESHIP_EXIT_CODE_SHOW`   | `false` | Show exit code of last command         |
| `SPACESHIP_EXIT_CODE_PREFIX` |   ``    | Prefix before exit code section        |
| `SPACESHIP_EXIT_CODE_SUFFIX` |   ``    | Suffix after exit code section         |
| `SPACESHIP_EXIT_CODE_SYMBOL` |   `✘`   | Character to be shown before exit code |
| `SPACESHIP_EXIT_CODE_COLOR`  |  `red`  | Color of exit code section             |

## 需要更多？

If these options are not enough to do what you want, read more about Spaceship's API on [API page](./api.md) of the documentation.
