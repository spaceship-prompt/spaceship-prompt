<p align="center">
  <a href="https://github.com/denysdovhan/spaceship-zsh-theme">
    <img alt="spaceship →~ prompt" src="https://cloud.githubusercontent.com/assets/3459374/21679181/46e24706-d34b-11e6-82ee-5efb3d2ba70f.png" width="400">
  </a>
</p>

# ⭐🚀 Spaceship ZSH

> An [“Oh My ZSH!”][oh-my-zsh] theme for Astronauts.

Spaceship is a minimalistic, powerful and extremely customizable [“Oh My ZSH!”][oh-my-zsh] theme. It combines everything you may need for convenient work, without unnecessary complications, like a real spaceship.

Currently it shows:

* Current git branch.
* Git repo status:
  * `?` — untracked changes;
  * `+` — uncommitted changes in the index;
  * `!` — unstaged changes;
  * `»` — renamed files;
  * `✘` — deleted files;
  * `$` — stashed changes;
  * `=` — unmerged changes;
  * `⇡` — ahead of remote branch;
  * `⇣` — behind of remote branch;
  * `⇕` — diverged chages.
* Prompt character turns red if the last command exits with non-zero code.
* Hostname only displayed when in an SSH session.
* Username displayed only when it isn't `$LOGNAME`.
* Username turns red when root.
* Current Node.js version, through nvm or n (`⬢`).
* Current Ruby version, through rvm/rbenv/chruby (`💎`).
* Current Swift version, through swiftenv (`🐦`).
* Current Xcode version, through xenv (`🛠`).
* Current Go version (`🐹`).
* Current Docker version and connected machine (`🐳`).
* Current Python virtualenv.
* Current Python pyenv (`🐍`).
* Current Vi-mode mode ([with handy aliases for temporarily enabling](#vi-mode)).
* Optional time stamps 12/24hr in format ([how to enable](#time)).

Want more features? Please, [open an issue](https://github.com/denysdovhan/spaceship-zsh-theme/issues/new) or send pull request.

## Preview

<p align="center">
  <img alt="Spaceship with Hyper and One Dark" src="./preview.gif" width="800">
</p>

## Requirements

For correct work you will first need:

* A [`zsh`](http://www.zsh.org/) must be installed
* A zsh–framework like [oh-my-zsh], [antigen] or [zgen]

## Installing

### [npm]

```
npm install -g spaceship-zsh-theme
```

Done. This command should link `spaceship.zsh-theme` to your `$ZSH_CUSTOM/themes` and set `$ZSH_CUSTOM` to `"spaceship"`. Just reload your terminal.

**Tip:** Update Spaceship to new versions as any other package.

### [oh-my-zsh]

Installing using **curl**:

```zsh
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
```

Installing using **wget**:

```zsh
wget -O - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
```

### [antigen]

Add the following snippet `~/.zshrc` after the line `antigen use oh-my-zsh`:

```
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
```

### [antibody]

Update your `.zshrc` file with the following line:

```
antibody bundle denysdovhan/spaceship-zsh-theme
```

### [zgen]

Add the following line to your `~/.zshrc` where you're adding your other zsh plugins:

```
zgen load denysdovhan/spaceship-zsh-theme spaceship
```

### [zplug]

Use this command in your `.zshrc` to load Spaceship as prompt theme:

```
zplug denysdovhan/spaceship-zsh-theme, use:spaceship.zsh, from:github, as:theme
```

### Manual

If you have problems with approches above, follow these instructions:

1. Download the theme [here](https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh)
2. Rename `spaceship.zsh` to `spaceship.zsh-theme`
3. Put the file `spaceship.zsh-theme` in `$ZSH_CUSTOM/themes/`
4. Add the line to your `~/.zshrc`: `ZSH_THEME="spaceship"`

## Options

Now you have ability to disable elements of Spaceship. All options must be overridden in your `.zshrc` file.

### Order

You can specify the order of prompt section using `SPACESHIP_PROMPT_ORDER` option. Use zsh array syntax to define your own prompt order. The default order is:

```zsh
SPACESHIP_PROMPT_ORDER=(
  time      # Time stampts section
  user      # Username section
  host      # Hostname section
  dir       # Current directory section
  git       # Git section (git_branch + git_status)
  node      # Node.js section
  ruby      # Ruby section
  xcode     # Xcode section
  swift     # Swift section
  golang    # Go section
  docker    # Docker section
  venv      # virtualenv section
  pyenv     # Pyenv section
  line_sep  # Line break
  vi_mode   # Vi-mode indicator
  char      # Prompt character
)
```

### Prompt

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_PROMPT_SEPARATOR` | ` ` | Character that separates prompt sections |
| `SPACESHIP_PROMPT_SYMBOL` | `➜` | Character to be shown before any command |
| `SPACESHIP_PROMPT_ADD_NEWLINE` | `true` | Adds a newline character before each prompt line |
| `SPACESHIP_PROMPT_SEPARATE_LINE` | `true` | Make the prompt span across two lines |
| `SPACESHIP_PROMPT_PREFIXES_SHOW` | `true` | Show prefixes before prompt sections or not |
| `SPACESHIP_PROMPT_SUFFIXES_SHOW` | `true` | Show suffixes before prompt sections or not |
| `SPACESHIP_PROMPT_DEFAULT_PREFIX` | `via ` | Default prefix environment |

### Time

Disabled as default. Set `SPACESHIP_TIME_SHOW` to `true` in your `.zshrc`, if you need to show time stamps.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_TIME_SHOW` | `false` | Show time (set to `true` for enabling) |
| `SPACESHIP_TIME_PREFIX` | `at ` | Prefix to be shown before time section |
| `SPACESHIP_TIME_SUFFIX` | `` | Suffix to be shown after time section |
| `SPACESHIP_TIME_COLOR` | `yellow` | Color of time section |
| `SPACESHIP_TIME_FORMAT` | `false` | Custom date formatting (e.g. `%D{%a %R}`) [ZSH date formats](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Date-and-time) |
| `SPACESHIP_TIME_12HR` | `false` | Format time using 12-hour clock (am/pm) |

### Username (`user`)

Username is shown only when it's not the same as `$LOGNAME`, when you're connected via SSH or when you're root. Root user is highlighted in `SPACESHIP_USER_COLOR_ROOT` color (red as default).

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_USER_SHOW` | `true` | Show user section |
| `SPACESHIP_USER_PREFIX` | `with ` | Prefix to be shown before user section |
| `SPACESHIP_USER_SUFFIX` | `` | Suffix to be shown after user section |
| `SPACESHIP_USER_COLOR` | `yellow` | Color of user section |
| `SPACESHIP_USER_COLOR_ROOT` | `red` | Color of user section when it's root |

### Hostname (`host`)

Hostname is shown only when you're connected via SSH.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_ROOT_SHOW` | `true` | Show user section |
| `SPACESHIP_HOST_PREFIX` | `at ` | Prefix to be shown before the connected SSH machine name |
| `SPACESHIP_HOST_SUFFIX` | `` | Suffix to be shown after the connected SSH machine name |
| `SPACESHIP_HOST_COLOR` | `green` | Color of host section |

### Directory (`dir`)

Directory is always shown and truncated to the value of `SPACESHIP_DIR_TRUNC`.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_DIR_SHOW` | `true` | Show directory section |
| `SPACESHIP_DIR_PREFIX` | `in ` | Prefix to be shown before current directory |
| `SPACESHIP_DIR_SUFFIX` | `` | Suffix to be shown after current directory |
| `SPACESHIP_DIR_TRUNC` | `3` | Number of folders of cwd to show in prompt, 0 to show all |
| `SPACESHIP_DIR_COLOR` | `cyan` | Color of directory section |

### Git (`git`)

Git section is consists with `git_branch` and `git_status` subsections. It is shown only in Git repositories.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GIT_SHOW` | `true` | Show Git section |
| `SPACESHIP_GIT_PREFIX` | `on ` | Prefix to be shown before Git section |
| `SPACESHIP_GIT_SUFFIX` | `` | Suffix to be shown after Git section |
| `SPACESHIP_GIT_SYMBOL` | ` ` | Character to be shown before Git section |

#### Git branch (`git_branch`)

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GIT_BRANCH_SHOW` | `true` | Show Git branch subsection |
| `SPACESHIP_GIT_BRANCH_PREFIX` | `SPACESHIP_GIT_SYMBOL` | Prefix to be shown before Git branch subsection |
| `SPACESHIP_GIT_BRANCH_SUFFIX` | `` | Suffix to be shown after Git branch subsection |
| `SPACESHIP_GIT_BRANCH_COLOR` | `magenta` | Color of Git branch subsection |

#### Git status (`git_status`)

Git status indicators is shown only when you have dirty repository.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GIT_STATUS_SHOW` | `true` | Show Git status subsection |
| `SPACESHIP_GIT_STATUS_PREFIX` | `[` | Prefix to be shown before Git status subsection |
| `SPACESHIP_GIT_STATUS_SUFFIX` | `]` | Suffix to be shown after Git status subsection |
| `SPACESHIP_GIT_STATUS_COLOR` | `red` | Color of Git status subsection |
| `SPACESHIP_GIT_STATUS_UNTRACKED` | `?` | Indicator for untracked changes |
| `SPACESHIP_GIT_STATUS_ADDED` | `+` | Indicator for added changes |
| `SPACESHIP_GIT_STATUS_MODIFIED` | `!` | Indicator for unstaged files |
| `SPACESHIP_GIT_STATUS_RENAMED` | `»` | Indicator for renamed files |
| `SPACESHIP_GIT_STATUS_DELETED` | `✘` | Indicator for deleted files |
| `SPACESHIP_GIT_STATUS_STASHED` | `$` | Indicator for stashed changes |
| `SPACESHIP_GIT_STATUS_UNMERGED` | `=` | Indicator for unmerged changes |
| `SPACESHIP_GIT_STATUS_AHEAD` | `⇡` | Indicator for unpushed changes (ahead of remote branch) |
| `SPACESHIP_GIT_STATUS_BEHIND` | `⇣` | Indicator for unpulled changes (behind of remote branch) |
| `SPACESHIP_GIT_STATUS_DIVERGED` | `⇕` | Indicator for diverged chages (diverged with remote branch) |

### Node.js (`node`)

Node.js section is shown only in directories that contain `package.json` file, or `node_modules` folder, or any other file with `.js` extension.

If you use [n] as Node.js version manager, please, set `SPACESHIP_NODE_DEFAULT_VERSION` to the default Node.js version. If current version is the same as `SPACESHIP_NODE_DEFAULT_VERSION`, then Node.js section will be hidden.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_NODE_SHOW` | `true` | Current Node.js section |
| `SPACESHIP_NODE_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix to be shown before Node.js section |
| `SPACESHIP_NODE_SUFFIX` | `` | Suffix to be shown after Node.js section |
| `SPACESHIP_NODE_SYMBOL` | `⬢` | Character to be shown before Node.js version |
| `SPACESHIP_NODE_DEFAULT_VERSION` | `` | Node.js version to be treated as default (for [n] support) |
| `SPACESHIP_NODE_COLOR` | `green` | Color of Node.js section |

### Ruby (`ruby`)

Ruby section is shown only in directories that contain `Gemfile`, or `Rakefile`, or any other file with `.rb` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_RUBY_SHOW` | `true` | Show Ruby section |
| `SPACESHIP_RUBY_PREFIX` | `SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix to be shown before Ruby section |
| `SPACESHIP_RUBY_SUFFIX` | `` | Suffix to be shown after Ruby section |
| `SPACESHIP_RUBY_SYMBOL` | `💎` | Character to be shown before Ruby version |
| `SPACESHIP_RUBY_COLOR` | `red` | Color of Ruby section |

### Xcode (`xcode`)

Shows current version of Xcode. Local version has more priority than global.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_XCODE_SHOW_LOCAL` | `true` | Current local Xcode version based on [xcenv] |
| `SPACESHIP_XCODE_SHOW_GLOBAL` | `true` | Global Xcode version based on [xcenv] |
| `SPACESHIP_XCODE_PREFIX` | `SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix to be shown before Xcode section |
| `SPACESHIP_XCODE_SUFFIX` | `` | Suffix to be shown after Xcode section |
| `SPACESHIP_XCODE_SYMBOL` | `🛠` | Character to be shown before Xcode version |
| `SPACESHIP_XCODE_COLOR` | `blue` | Color of Xcode section |

### Swift (`swift`)

Shows current version of Swift. Local version has more priority than global.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_SWIFT_SHOW_LOCAL` | `true` | Current local Swift version based on [swiftenv] |
| `SPACESHIP_SWIFT_SHOW_GLOBAL` | `false` | Global Swift version based on [swiftenv] |
| `SPACESHIP_SWIFT_PREFIX` | `SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix to be shown before the Swift section |
| `SPACESHIP_SWIFT_SUFFIX` | `` | Suffix to be shown before the Swift section |
| `SPACESHIP_SWIFT_SYMBOL` | `🐦` | Character to be shown before Swift version |
| `SPACESHIP_SWIFT_COLOR` | `yellow` | Color of Swift section |

### Go (`golang`)

Go section is shown only in directories that contain `Godeps`, or `glide.yaml`, or any other file with `.go` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GOLANG_SHOW` | `true` | Shown current Go version or not |
| `SPACESHIP_GOLANG_PREFIX` | `SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix to be shown before the Go section |
| `SPACESHIP_GOLANG_SUFFIX` | `` | Suffix to be shown after the Go section |
| `SPACESHIP_GOLANG_SYMBOL` | `🐹` | Character to be shown before Go version |
| `SPACESHIP_GOLANG_COLOR` | `cyan` | Color of Go section |

### Docker (`docker`)

Shows Docker version and current connected machine name.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_DOCKER_SHOW` | `true` | Show current Docker version and connected docker-machine ot not |
| `SPACESHIP_DOCKER_PREFIX` | `on ` | Prefix to be shown before the Docker section |
| `SPACESHIP_DOCKER_SUFFIX` | `` | Suffix to be shown after the Docker section |
| `SPACESHIP_DOCKER_SYMBOL` | `🐳` | Character to be shown before Docker version |
| `SPACESHIP_DOCKER_COLOR` | `cyan` | Color of Docker section |

### Virtualenv (`venv`)

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_VENV_SHOW` | `true` | Show current Python virtualenv or not |
| `SPACESHIP_VENV_PREFIX` | `SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix to be shown before the virtualenv section |
| `SPACESHIP_VENV_SUFFIX` | `` | Suffix to be shown after the virtualenv section |
| `SPACESHIP_VENV_COLOR` | `blue` | Color of virtualenv environment section |

### Pyenv (`pyenv`)

Go section is shown only in directories that contain `requirements.txt` or any other file with `.py` extension.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_PYENV_SHOW` | `true` | Show current Pyenv version or not |
| `SPACESHIP_PYENV_PREFIX` | `SPACESHIP_PROMPT_DEFAULT_PREFIX` | Prefix to be shown before the pyenv section |
| `SPACESHIP_PYENV_SUFFIX` | `` | Suffix to be shown after the pyenv section |
| `SPACESHIP_PYENV_SYMBOL` | `🐍` | Character to be shown before Pyenv version |
| `SPACESHIP_PYENV_COLOR` | `yellow` | Color of Pyenv section |

### Vi-mode (`vi_mode`)

This section shows mode indicator only when Vi-mode is enabled.

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_VI_MODE_SHOW` | `true` | Shown current Vi-mode or not |
| `SPACESHIP_VI_MODE_PREFIX` | `` | Prefix to be shown before Vi-mode section |
| `SPACESHIP_VI_MODE_SUFFIX` | `` | Suffix to be shown after Vi-mode section |
| `SPACESHIP_VI_MODE_INSERT` | `[I]` | Text to be shown when in insert mode |
| `SPACESHIP_VI_MODE_NORMAL` | `[N]` | Text to be shown when in normal mode |
| `SPACESHIP_VI_MODE_COLOR` | `white` | Color of Vi-mode section |

You can temporarily enable or disable vi-mode with handy functions (just execute them in terminal as any other regular command):

| Function | Meaning |
| :------- | ------- |
| `spaceship_vi_mode_enable` | Enable vi-mode for current terminal session |
| `spaceship_vi_mode_disable` | Disable vi-mode for current terminal session |

**Note:** For oh-my-zsh users with vi-mode plugin enabled: Add `export RPS1="%{$reset_color%}"` before `source $ZSH/oh-my-zsh.sh` in `.zshrc` to disable default `<<<` NORMAL mode indicator in right prompt.

### Example

Here is all options which may be changed. Copy this to your `~/.zshrc` to make it easy to change.

**Warning!:** These overridden variables should be placed _after_ the theme in your `.zshrc` file.

```zsh
# ORDER
SPACESHIP_PROMPT_ORDER=(
  time
  user
  host
  dir
  git
  node
  ruby
  xcode
  swift
  golang
  docker
  venv
  pyenv
  line_sep
  vi_mode
  char
)

# PROMPT
SPACESHIP_PROMPT_SEPARATOR=" "
SPACESHIP_PROMPT_SYMBOL="➜"
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_PROMPT_PREFIXES_SHOW=true
SPACESHIP_PROMPT_SUFFIXES_SHOW=true
SPACESHIP_PROMPT_DEFAULT_PREFIX="via "

# TIME
SPACESHIP_TIME_SHOW=false
SPACESHIP_TIME_PREFIX="at "
SPACESHIP_TIME_SUFFIX=""
SPACESHIP_TIME_FORMAT=false
SPACESHIP_TIME_12HR=false
SPACESHIP_TIME_COLOR="yellow"

# USER
SPACESHIP_USER_SHOW=true
SPACESHIP_USER_PREFIX="with "
SPACESHIP_USER_SUFFIX=""
SPACESHIP_USER_COLOR="yellow"
SPACESHIP_USER_COLOR_ROOT="red"

# HOST
SPACESHIP_HOST_SHOW=true
SPACESHIP_HOST_PREFIX="at "
SPACESHIP_HOST_SUFFIX=""
SPACESHIP_HOST_COLOR="green"

# DIR
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_PREFIX="in "
SPACESHIP_DIR_SUFFIX=""
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_COLOR="cyan"

# GIT
SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_PREFIX="on "
SPACESHIP_GIT_SUFFIX=""
SPACESHIP_GIT_SYMBOL=" "
# GIT BRANCH
SPACESHIP_GIT_BRANCH_SHOW=true
SPACESHIP_GIT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_BRANCH_COLOR="magenta"
# GIT STATUS
SPACESHIP_GIT_STATUS_SHOW=true
SPACESHIP_GIT_STATUS_PREFIX="["
SPACESHIP_GIT_STATUS_SUFFIX="]"
SPACESHIP_GIT_STATUS_COLOR="red"
SPACESHIP_GIT_STATUS_UNTRACKED="?"
SPACESHIP_GIT_STATUS_ADDED="+"
SPACESHIP_GIT_STATUS_MODIFIED="!"
SPACESHIP_GIT_STATUS_RENAMED="»"
SPACESHIP_GIT_STATUS_DELETED="✘"
SPACESHIP_GIT_STATUS_STASHED="$"
SPACESHIP_GIT_STATUS_UNMERGED="="
SPACESHIP_GIT_STATUS_AHEAD="⇡"
SPACESHIP_GIT_STATUS_BEHIND="⇣"
SPACESHIP_GIT_STATUS_DIVERGED="⇕"

# NODE
SPACESHIP_NODE_SHOW=true
SPACESHIP_NODE_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_NODE_SUFFIX=""
SPACESHIP_NODE_SYMBOL="⬢"
SPACESHIP_NODE_DEFAULT_VERSION=""
SPACESHIP_NODE_COLOR="green"

# RUBY
SPACESHIP_RUBY_SHOW=true
SPACESHIP_RUBY_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_RUBY_SUFFIX=""
SPACESHIP_RUBY_SYMBOL="💎"
SPACESHIP_RUBY_COLOR="red"

# XCODE
SPACESHIP_XCODE_SHOW_LOCAL=true
SPACESHIP_XCODE_SHOW_GLOBAL=false
SPACESHIP_XCODE_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_XCODE_SUFFIX=""
SPACESHIP_XCODE_SYMBOL="🛠"
SPACESHIP_XCODE_COLOR="blue"

# SWIFT
SPACESHIP_SWIFT_SHOW_LOCAL=true
SPACESHIP_SWIFT_SHOW_GLOBAL=false
SPACESHIP_SWIFT_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_SWIFT_SUFFIX=""
SPACESHIP_SWIFT_SYMBOL="🐦"
SPACESHIP_SWIFT_COLOR="yellow"

# GOLANG
SPACESHIP_GOLANG_SHOW=true
SPACESHIP_GOLANG_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_GOLANG_SUFFIX=""
SPACESHIP_GOLANG_SYMBOL="🐹"
SPACESHIP_GOLANG_COLOR="cyan"

# DOCKER
SPACESHIP_DOCKER_SHOW=true
SPACESHIP_DOCKER_PREFIX="on "
SPACESHIP_DOCKER_SUFFIX=""
SPACESHIP_DOCKER_SYMBOL="🐳"
SPACESHIP_DOCKER_COLOR="cyan"

# VENV
SPACESHIP_VENV_SHOW=true
SPACESHIP_VENV_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_VENV_SUFFIX=""
SPACESHIP_VENV_COLOR="blue"

# PYENV
SPACESHIP_PYENV_SHOW=true
SPACESHIP_PYENV_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_PYENV_SUFFIX=""
SPACESHIP_PYENV_SYMBOL="🐍"
SPACESHIP_PYENV_COLOR="yellow"

# VI_MODE
SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_PREFIX=""
SPACESHIP_VI_MODE_SUFFIX=""
SPACESHIP_VI_MODE_INSERT="[I]"
SPACESHIP_VI_MODE_NORMAL="[N]"
SPACESHIP_VI_MODE_COLOR="white"
```

## License

MIT © [Denys Dovhan](http://denysdovhan.com)

<!-- Reference -->

[oh-my-zsh]: http://ohmyz.sh/
[antigen]: http://antigen.sharats.me/
[zgen]: https://github.com/tarjoilija/zgen
[npm]: https://www.npmjs.com/
[antibody]: https://github.com/getantibody/antibody
[zplug]: https://github.com/zplug/zplug
[n]: https://github.com/tj/n
[xcenv]: http://xcenv.org/
[swiftenv]: https://github.com/kylef/swiftenv
