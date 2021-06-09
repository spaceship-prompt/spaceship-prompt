---
hide:
  - navigation
---

# API

该页面包含了 Spaceship 的 API。可以用来创建插件和调节 Spaceship 的功能。

Spaceship 中，变量用 `SPACESHIP_` 前缀，函数用 `spaceship::`。这样做可以避免产生命名冲突。所有的模块 (section) 包括自定义的模块也都需要以 `spaceship_` 为前缀，否则无法正确加载。

## 典型的模块

下面是一个典型的 Spaceship 模块例子。需要关注一下几个重点:

- 自定义 options。要以 `SPACESHIP_` 开头。
- 模块名称要以 `spaceship_` 开头。
- 仅在需要时显示模块。(比如当某些命令可用时，当前所在目录包含特定文件时等等)。

更多详情请参阅 [贡献指南](//github.com/spaceship-prompt/spaceship-prompt/blob/master/CONTRIBUTING.md) 。

```zsh
#
# Foobar
#
# Foobar is a supa-dupa cool tool for making you development easier.
# Link: https://www.foobar.xyz

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_FOOBAR_SHOW="${SPACESHIP_FOOBAR_SHOW=true}"
SPACESHIP_FOOBAR_PREFIX="${SPACESHIP_FOOBAR_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_FOOBAR_SUFFIX="${SPACESHIP_FOOBAR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_FOOBAR_SYMBOL="${SPACESHIP_FOOBAR_SYMBOL="🍷 "}"
SPACESHIP_FOOBAR_COLOR="${SPACESHIP_FOOBAR_COLOR="white"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show foobar status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_foobar() {
  # If SPACESHIP_FOOBAR_SHOW is false, don't show foobar section
  [[ $SPACESHIP_FOOBAR_SHOW == false ]] && return

  # Check if foobar command is available for execution
  spaceship::exists foobar || return

  # Show foobar section only when there are foobar-specific files in current
  # working directory.
  # Here glob qualifiers are used to check if files with specific extension are
  # present in directory. Read more about them here:
  # http://zsh.sourceforge.net/Doc/Release/Expansion.html
  [[ -f foobar.conf || -n *.foo(#qN^/) || -n *.bar(#qN^/) ]] || return

  # Use quotes around unassigned local variables to prevent
  # getting replaced by global aliases
  # http://zsh.sourceforge.net/Doc/Release/Shell-Grammar.html#Aliasing
  local 'foobar_status'

  if [[ $SOME_CONDITION ]]; then
    foobar_status=$(foobar baz)
  else
    foobar_status=$(foobar foo)
  fi

  # Exit section if variable is empty
  [[ -z $foobar_status ]] && return

  # Display foobar section
  spaceship::section \
    "$SPACESHIP_FOOBAR_COLOR" \
    "$SPACESHIP_FOOBAR_PREFIX" \
    "$SPACESHIP_FOOBAR_SYMBOL$foobar_status" \
    "$SPACESHIP_FOOBAR_SUFFIX"
}
```

## `SPACESHIP_VERSION`

该环境变量定义了当前正在运行的 Spaceship 的版本。为上报问题和调试提供关键信息。

当前回话下的所有的程序和脚本都可以访问该变量。

### 例子:

```zsh
echo $SPACESHIP_VERSION
#> 3.0.0
```

## `SPACESHIP_ROOT`

<!-- prettier-ignore -->
!!! danger
    不要修改该变量的值。改变该值可能会破坏 Spaceship 的安装。

该环境变量定义了 Spaceship 的安装路径。Spaceship 用该变量来定位模块或者工具函数的路径。

当前回话下的所有的程序和脚本都可以访问该变量。

### 例子:

```zsh
echo $SPACESHIP_ROOT
#> /path/to/spaceship-prompt
```

## `spaceship::section <color> [prefix] <content> [suffix]`

该命令表示该模块前缀为 `prefix`，后缀为 `suffix`，内容为 `content`，内容颜色为 `color`。默认为**黑体**。

`prefix`, `suffix` 和 `content` 能包含提示符的转义符来设置额外的前景色和背景色还有其他的视觉效果。为了了解更多关于转义符，参阅 zsh 文档 [13 Prompt Expansion](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html)。

如果 `SPACESHIP_PROMPT_PREFIXES_SHOW` 是 `false` 或者如果该模块不是提示符的第一个模块，那么 `prefix` 会被忽略。

如果 `SPACESHIP_PROMPT_SUFFIXES_SHOW` 是 `false`，那么 `suffix` 会被忽略。

`prefix` 和 `suffix` 都是可选的。它们默认都是空字符串。

### 参数

1. `color` _必须的_ — `content` 的显示颜色。 可以是 [basic colors](https://wiki.archlinux.org/index.php/zsh#Colors) 和 [color codes](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg) 中的任意颜色。
2. `prefix` _可选的_ — `content` 的前缀。 通常它是 `SPACESHIP_*_PREFIX` 的值。
3. `content` _必须的_ — 模块的内容。能是任何有效的值和命令的执行结果。
4. `suffix` _可选的_ — `content` 的后缀。 通常它是 `SPACESHIP_*_SUFFIX` 的值。

### 例子

```zsh
# Display prompt section with prefix and suffix
# Backslash is used to escape line ending
spaceship::section \
  "$SPACESHIP_SECTION_COLOR" \
  "$SPACESHIP_SECTION_PREFIX" \
  "$SPACESHIP_SECTION_SYMBOL$section_content" \
  "$SPACESHIP_SECTION_SUFFIX"

# Display prompt section without prefix and suffix
spaceship::section "$color" "$SPACESHIP_CHAR_SYMBOL"
```

## `spaceship::exists <command>`

该命令验证某命令是否可用来被执行，它包括 PATH 内的命令，函数，内置命令和函数等。如果验证成功返回0否则返回非0。

你能通过用命令判断某命令行是否被安装从而根据条件结果执行相应的行为。例如，当返回错误的时候，选择控制退出还是继续执行脚本。

### 参数

1. `command` _必须的_ — 需要被检查的命令。

### 例子

```zsh
# Check multiple commands for existing
if spaceship::exists nvm; then
  # extract nvm version
elif spaceship::exists node; then
  # extract node version
else
  return
fi

# Do nothing if pyenv is not installed
spaceship::exists pyenv || return
```

## `spaceship::defined <function>`

和 [`spaceship::exists`](#spaceshipexists-command) 一样, 但是主要用来判断函数是否被定义。 如果该函数被定义返回0否则返回非0。

你能用该方法检查是否用户之前定义了该方法。Spaceship 内部用这个来检查一个自定义的模块是否被定义且可以执行。

### 参数

1. `function` _必须的_ — 一个需要被检查的函数。

### 例子

```zsh
# Check if section has been defined
if spaceship::defined spaceship_section; then
  spaceship_section
else
  # section is not found
fi
```

## `spaceship::is_git`

如果当前的工作目录是一个 git 仓库返回0否则返回非0。

### 例子

```zsh
# Return if current directory is not a git repository
spaceship::is_git || return
```

## `spaceship::is_hg`

和 [`spaceship::is_git`](#spaceshipisgit) 一样，但是被用于 Mercurial 仓库。 如果当前的工作目录是一个 Mercurial 仓库返回0否则返回非0。

### 例子

```zsh
# Return if current directory is not a Mercurial repository
spaceship::is_hg || return
```

## `spaceship::deprecated <option> [message]`

该工具函数检查 `option` 变量是否被设置，如果设置了会打印废弃消息，该消息可以支持转义符来控制前景和背景色以及其他视觉效果。为了了解更多关于转义符，参阅 zsh 文档 [13 Prompt Expansion](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html)。

### 参数

1. `option` _必须的_ — 一个废弃的变量名。如果该变量包含值，那么 `"%B$deprecated%b is deprecated.` 将要被打印。 `%B` 和 `%b` 是转义符用来设置消息字体的是否加粗。
2. `message` _可选的_ — 一条额外的废弃的消息

### 例子

```zsh
# Check if SPACESHIP_BATTERY_ALWAYS_SHOW is set
spaceship::deprecated SPACESHIP_BATTERY_ALWAYS_SHOW "Use %BSPACESHIP_BATTERY_SHOW='always'%b instead."
#> SPACESHIP_BATTERY_ALWAYS_SHOW is deprecated. Use SPACESHIP_BATTERY_SHOW='always' instead.
```

## `spaceship::displaytime <seconds>`

该工具函数可以将 `seconds` 转化为可读的格式。它将 `seconds` 分为日 (`d`), 时 (`h`), 分 (`m`) 和秒 (`s`)。

### 参数

1. `seconds` _必须的_ — 秒数

### 例子

```zsh
spaceship::displaytime 123456
#> 1d 10h 17m 36s
```

## `spaceship::union <arr1[ arr2[ ...]]>`

该工具函数可以进行数组合并。他会把两个及以上的数组转成列表。

Spaceship 内部用该函数来解析需要被执行的模块。

### 参数

1. `arr...` — 由数组组成的列表。

### 例子

```zsh
arr1=('a' 'b' 'c')
arr2=('b' 'c' 'd')
arr3=('c' 'd' 'e')
spaceship::union $arr1 $arr2 $arr3
#> a b c d e
```
