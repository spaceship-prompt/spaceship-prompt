
![Spaceship](./preview.png)

# ⭐🚀 Spaceship ZSH

> An [“Oh My ZSH!”](http://ohmyz.sh/) theme for Astronauts.

Spaceship is an [“Oh My ZSH!”](http://ohmyz.sh/) minimalistic and powerful theme. It combines everything you may need for convenient work, without unnecessary complications, like a real spaceship.

Currently it shows:

* Current git branch.
* Git repo status:
  * `+` — uncommitted changes in the index;
  * `!` — unstaged changes;
  * `?` — untracked changes;
  * `$` — stashed changes;
  * `⇣` — unpulled commits;
  * `⇡` — unpushed commits.
* Prompt character turns red if the last command exits with non-zero code.
* Hostname only displayed when in an SSH session.
* Username displayed only when it isn't `$LOGNAME`.
* Username turns red when root.
* Current Node.js version, through NVM (`⬢`).
* Current Ruby version, through RVM/RBENV/CHRUBY (`💎`).
* Current Swift version, through swiftenv (`🐦`).
* Current Xcode version, through xenv (`🛠`).
* Current Python virtualenv.
* Current Vi-mode mode.

Want more features? Please, [open an issue](https://github.com/denysdovhan/spaceship-zsh-theme/issues/new) or send pull request.

## Requirements

For correct work you will first need:

* A [`zsh`](http://www.zsh.org/) must be installed
* A zsh–framework like [oh-my-zsh](http://ohmyz.sh/), [antigen](http://antigen.sharats.me/) or [zgen](https://github.com/tarjoilija/zgen)

## Installing

### For oh-my-zsh users

Installing using **curl**:

```
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh
```

Installing using **wget**:

```
wget -O - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh
```

If you have problems, follow these instructions:

1. Download the theme [here](https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh)
2. Rename `spaceship.zsh` to `spaceship.zsh-theme`
3. Put the file `spaceship.zsh-theme` in `$ZSH_CUSTOM/themes/`
4. Add the line to your `~/.zshrc`: `ZSH_THEME="spaceship"`

### For antigen users

Add the following snippet `~/.zshrc` after the line `antigen use oh-my-zsh`:

```
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
```

### For Zgen users

Add the following line to your `~/.zshrc` where you're adding your other zsh plugins:

```
zgen load denysdovhan/spaceship-zsh-theme spaceship
```

## Screenshots

The spaceship theme looks awesome with some popular color schemes. Take a look to make sure:

### Monokai

![Monokai](https://cloud.githubusercontent.com/assets/3459374/12703427/827bfd5e-c84b-11e5-8bef-44d4e6955c01.png)

### Solarized Dark

![Solarized](https://cloud.githubusercontent.com/assets/3459374/12703426/82799b72-c84b-11e5-8943-3a7df0d55978.png)

### Night Eighties

![Night Eighties](https://cloud.githubusercontent.com/assets/3459374/12703429/827d2918-c84b-11e5-95a1-bbfe621e77d5.png)

### One Dark

![One Dark](https://cloud.githubusercontent.com/assets/3459374/12703428/827c7356-c84b-11e5-8764-372ce30dd3fa.png)

## Options

Now you have ability to disable elements of Spaceship. All options must be overridden in your `.zshrc` file.

### Prompt

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_PROMPT_SYMBOL` | `➔` | Character to be shown before any command |
| `SPACESHIP_PROMPT_SEPARATE_LINE` | `true` | Make the prompt span across two lines |
| `SPACESHIP_PROMPT_ADD_NEWLINE` | `true` | Adds a newline character before each prompt line |
| `SPACESHIP_PROMPT_TRUNC` | `3` | Number of folders of cwd to show in prompt, 0 to show all |

### Prefixes

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_PREFIX_SHOW` | `true` | Show Prefix Characters |
| `SPACESHIP_PREFIX_HOST` | `at` | Characters to be shown before the connected SSH machine name |
| `SPACESHIP_PREFIX_DIR` | `in` | Characters to be shown before the current SSH Directory |
| `SPACESHIP_PREFIX_GIT` | `on` | Character to be shown before git status |
| `SPACESHIP_PREFIX_ENV_DEFAULT` | `via` | Default environment prefix |
| `SPACESHIP_PREFIX_NVM` | `SPACESHIP_PREFIX_ENV_DEFAULT` | Prefix before the NVM environment |
| `SPACESHIP_PREFIX_RUBY` | `SPACESHIP_PREFIX_ENV_DEFAULT` | Prefix before the Ruby environment |
| `SPACESHIP_PREFIX_XCODE` | `SPACESHIP_PREFIX_ENV_DEFAULT` | Prefix before the XCode environment |
| `SPACESHIP_PREFIX_SWIFT` | `SPACESHIP_PREFIX_ENV_DEFAULT` | Prefix before the Swift environment |
| `SPACESHIP_PREFIX_VENV` | `SPACESHIP_PREFIX_ENV_DEFAULT` | Prefix before the Python virtualenv Environment |

### Git

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_GIT_SHOW` | `true` | Show/hide git status |
| `SPACESHIP_GIT_UNCOMMITTED` | `+` | Character to be shown on uncommitted changes |
| `SPACESHIP_GIT_UNSTAGED` | `!` | Character to be shown on unstaged changes |
| `SPACESHIP_GIT_UNTRACKED` | `?` | Character to be shown on untracked changes |
| `SPACESHIP_GIT_STASHED` | `$` | Character to be shown on stashed changes |
| `SPACESHIP_GIT_UNPULLED` | `⇣` | Character to be shown on unpulled changes |
| `SPACESHIP_GIT_UNPUSHED` | `⇡` | Character to be shown on unpushed changes |

### Nvm

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_NVM_SHOW` | `true` | Current Node.js version |
| `SPACESHIP_NVM_SYMBOL` | `⬢` | Character to be shown before Node.js version |

### Ruby

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_RUBY_SHOW` | `true` | Current Ruby version |
| `SPACESHIP_RUBY_SYMBOL` | `💎` | Character to be shown before Ruby version |

### Swift

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_SWIFT_SHOW_LOCAL` | `true` | Current local Swift version based on [swiftenv](https://github.com/kylef/swiftenv) |
| `SPACESHIP_SWIFT_SHOW_GLOBAL` | `false` | Global Swift version based on [swiftenv](https://github.com/kylef/swiftenv) |
| `SPACESHIP_SWIFT_SYMBOL` | `🐦` | Character to be shown before Swift version |


### Xcode

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_XCODE_SHOW_LOCAL` | `true` | Current local Xcode version based on [xcenv](http://xcenv.org/) |
| `SPACESHIP_XCODE_SHOW_GLOBAL` | `true` | Global Xcode version based on [xcenv](http://xcenv.org/) |
| `SPACESHIP_XCODE_SYMBOL` | `🛠` | Character to be shown before Xcode version |


### Venv

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_VENV_SHOW` | `true` | Current Python virtualenv |


### Vi-mode

| Variable | Default | Meaning |
| :------- | :-----: | ------- |
| `SPACESHIP_VI_MODE_SHOW` | `true` | Current Vi-mode  |
| `SPACESHIP_VI_MODE_INSERT` | `[I]` | Text to be shown when in insert mode |
| `SPACESHIP_VI_MODE_NORMAL` | `[N]` | Text to be shown when in normal mode |

Note: For oh-my-zsh users with vi-mode plugin enabled: Add `export RPS1="%{$reset_color%}"` before `source $ZSH/oh-my-zsh.sh` in ~/.zshrc to disable default `<<<` NORMAL mode indicator in right prompt.

### Example

Here is all options which may be changed. Copy this to your `~/.zshrc` to make it easy to change.

**Warning!:** These overridden variables should be placed _after_ the theme in your `.zshrc` file.

```zsh
# PROMPT
SPACESHIP_PROMPT_SYMBOL='➔'
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_PROMPT_TRUNC=3

# PREFIXES
SPACESHIP_PREFIX_SHOW=true
SPACESHIP_PREFIX_HOST=' at '
SPACESHIP_PREFIX_DIR=' in '
SPACESHIP_PREFIX_GIT=' on '
SPACESHIP_PREFIX_ENV_DEFAULT=' via '
SPACESHIP_PREFIX_NVM=$SPACESHIP_PREFIX_ENV_DEFAULT
SPACESHIP_PREFIX_RUBY=$SPACESHIP_PREFIX_ENV_DEFAULT
SPACESHIP_PREFIX_XCODE=$SPACESHIP_PREFIX_ENV_DEFAULT
SPACESHIP_PREFIX_SWIFT=$SPACESHIP_PREFIX_ENV_DEFAULT
SPACESHIP_PREFIX_VENV=$SPACESHIP_PREFIX_ENV_DEFAULT

# GIT
SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_UNCOMMITTED='+'
SPACESHIP_GIT_UNSTAGED='!'
SPACESHIP_GIT_UNTRACKED='?'
SPACESHIP_GIT_STASHED='$'
SPACESHIP_GIT_UNPULLED='⇣'
SPACESHIP_GIT_UNPUSHED='⇡'

# NVM
SPACESHIP_NVM_SHOW=true
SPACESHIP_NVM_SYMBOL='⬢'

# RUBY
SPACESHIP_RUBY_SHOW=true
SPACESHIP_RUBY_SYMBOL='💎'

# SWIFT
SPACESHIP_SWIFT_SHOW_LOCAL=true
SPACESHIP_SWIFT_SHOW_GLOBAL=false
SPACESHIP_SWIFT_SYMBOL='🐦'

# XCODE
SPACESHIP_XCODE_SHOW_LOCAL=true
SPACESHIP_XCODE_SHOW_GLOBAL=false
SPACESHIP_XCODE_SYMBOL='🛠'

# VENV
SPACESHIP_VENV_SHOW=true

# VI_MODE
SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_INSERT="[I]"
SPACESHIP_VI_MODE_NORMAL="[N]"
```

## License

MIT © [Denys Dovhan](http://denysdovhan.com)
