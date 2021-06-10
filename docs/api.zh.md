---
hide:
  - 导航
---

# 应用程序接口

这个页面描述了用于创建插件和调节 Spaceship 行为的 Spaceship API 。

Spaceship 使用 `SPACESHIP_` 前缀变量和 `spaceship::` 函数前缀以避免与其他函数发生冲突。 所有模块，包括自定义模块，都需要在名称前使用 `spaceship_` 前缀以便合理加载。

## 典型模块

下面是一个 Spaceship 典型模块的例子。 注意几个关键点：

- 定义自定义选项。 它们的名字应该以 `SPACESHIP_` 开头。
- 模块名称应该以 `spaceship_` 开头。
- 仅在需要时显示模块(在包含特定文件的目录中，或当有特定命令可用时等)。

查看 [贡献指南](//github.com/spaceship-prompt/spaceship-prompt/blob/master/CONTRIBUTING.md) 以获取更多信息。

```zsh
#
# Foobar
#
# Foobar 是一个超很酷的工具，可以让开发更容易。
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

一个定义当前运行的 Spaceship prompt 版本的环境变量。 可以用于问题报告或调试目的。

可以在当前 shell 会话中运行的任何程序或脚本中访问。

### 示例:

```zsh
echo $SPACESHIP_VERSION
#> 3.0.0
```

## `SPACESHIP_ROOT`

<!-- prettier-ignore -->
!!! 危险 不要修改此变量的值! 改变值可能会对 Spaceship 的安装造成损坏！

一个定义当前运行的 Spaceship prompt 安装路径的环境变量。 Spaceship 使用此变量解析模块和实用程序的路径。

可以在当前 shell 会话中运行的任何程序或脚本中访问。

### 示例:

```zsh
echo $SPACESHIP_ROOT
#> /path/to/spaceship-prompt
```

## `spaceship::section <color> [prefix] <content> [suffix]`

此命令以 ` prefix `为前缀， ` suffix ` 为后缀， `color` 来绘制 ` content ` 的模块。 默认情况下使用 **粗体** 样式。

` prefix `, ` suffix ` 和 ` content ` 可以包含转义符来设置额外的前景色、 背景色和其他视觉效果。 在[13 Prompt Expansion](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html) Zsh文档中阅读更多关于转义符的信息。

如果 `SPACESHIP_PROMPT_PREFIXES_SHOW` 为 `false` 或如果该部分不是提示符中的第一个模块, 然后 ` prefix ` 将被省去。

如果 `SPACESHIP_PROMPT_SUFFIXES_SHOW` 是 `false`, 那么 ` suffix ` 将被省略。

` prefix ` 和 ` suffix ` 均为可选的。 默认情况下，它们等于空字符串。

### 参数

1. ` color ` _需要_ - 显示 ` content ` 的颜色。 可以是 [基本颜色](https://wiki.archlinux.org/index.php/zsh#Colors) 或 [颜色代码](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg)。
2. `prefix` _可选的_ - `content` 的前缀 通常是 `SPACESHIP_*_PREFIX` 的值。
3. ` content ` _必须的_ — — 模块内容。 Can be any valid value or result of command execution.
4. `suffix` _Optional_ — Suffix after `content`. Usually, it's the value of `SPACESHIP_*_SUFFIX`.

### 示例

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

This command validates that given program is available for execution. It checks for PATH binaries, functions, and builtins. It returns zero exit code if a `command` exists and non-zero code otherwise.

You can use this utility to check if some program is installed and perform actions conditionally. For example, you can either return an error and exit or continue script's execution.

### 参数

1. `command` _Required_ — a command that needs to be checked.

### 示例

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

The same as [`spaceship::exists`](#spaceshipexists-command), but for functions. It returns zero exit code if a `function` has been defined previously and non-zero if `function` hasn't.

You can use this utility to check if a user has previously defined a function or not. Spaceship uses this utility internally to check if a custom section has been defined and available for execution.

### 参数

1. `function` _Required_ — a function that needs to be checked.

### 示例

```zsh
# Check if section has been defined
if spaceship::defined spaceship_section; then
  spaceship_section
else
  # section is not found
fi
```

## `spaceship::is_git`

This utility returns zero exit code if a current working directory is a Git repository and non-zero if it's not.

### 示例

```zsh
# Return if current directory is not a git repository
spaceship::is_git || return
```

## `spaceship::is_hg`

The same as [`spaceship::is_git`](#spaceshipisgit), but for Mercurial repositories. This utility returns zero exit code if a current working directory is a Mercurial repository and non-zero if it's not.

### 示例

```zsh
# Return if current directory is not a Mercurial repository
spaceship::is_hg || return
```

## `spaceship::deprecated <option> [message]`

This utility checks if `option` variable is set and if it is, prints the `message`. The `message` supports escapes to set foreground color, background color and other visual effects. Read more about escapes in [13 Prompt Expansion](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html) section of Zsh documentation.

### 参数

1. `option` _Required_ — the name of a deprecated variable. If this variable is set (contains any value), then `"%B$deprecated%b is deprecated.` will be printed. `%B` and `%b` is escapes to set the bold style for text.
2. `message` _Optional_ — a string for additional deprecation message.

### 示例

```zsh
# Check if SPACESHIP_BATTERY_ALWAYS_SHOW is set
spaceship::deprecated SPACESHIP_BATTERY_ALWAYS_SHOW "Use %BSPACESHIP_BATTERY_SHOW='always'%b instead."
#> SPACESHIP_BATTERY_ALWAYS_SHOW is deprecated. Use SPACESHIP_BATTERY_SHOW='always' instead.
```

## `spaceship::displaytime <seconds>`

This utility converts `seconds` into a human-readable format. It splits `seconds` into days (`d`), hours (`h`), minutes (`m`) and seconds (`s`).

### 参数

1. `seconds` _Required_ — seconds for conversion into the readable format.

### 示例

```zsh
spaceship::displaytime 123456
#> 1d 10h 17m 36s
```

## `spaceship::union <arr1[ arr2[ ...]]>`

一种对数组进行并集(交集) 的实用工具。 它列出了在两个或两个以上数组中发现的内容。

Spaceship 在内部使用此工具来解析需要 source 的部分。

### 参数

1. `arr...` — 一个数组列表。

### 示例

```zsh
arr1=('a' 'b' 'c')
arr2=('b' 'c' 'd')
arr3=('c' 'd' 'e')
spaceship::union $arr1 $arr2 $arr3
#> a b c d e
```
