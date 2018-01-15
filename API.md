# API

This page describes internal API for creating plugins, contributing, etc.

All methods are under the `spaceship::` namespace. All options starts with `SPACESHIP_`.

TODO: Add an example of custom section.

## `SPACESHIP_VERSION`

An environment variable that defines the version of currently running Spaceship prompt version. Can be used for issue reporting or debugging purposes.

Accessible to any program or script running in a current shell session.

### Example:

```zsh
echo $SPACESHIP_VERSION
#> 3.0.0
```

## `SPACESHIP_ROOT`

> **Attention!** Do not modify the value of this variable! Changing the value may cause the damage of Spaceship installation!

An environment variable that defines the path to Spaceship prompt installation. Spaceship uses this variable for resolving path to sections and utils.

Accessible to any program or script running in a current shell session.

### Example:

```zsh
echo $SPACESHIP_ROOT
#> /path/to/spaceship-zsh-theme
```

## `spaceship::section <color> [prefix] <content> [suffix]`

This command displays prompt section prefixed with `prefix`, suffixed with `suffix` and `content` painted in `color`. **Bold** style is applied by default.

If `SPACESHIP_PROMPT_PREFIXES_SHOW` is `false` or if the section is not the first in the prompt, then `prefix` will be omitted.

If `SPACESHIP_PROMPT_SUFFIXES_SHOW` is `false`, then `suffix` will be omitted.

Both `prefix` and `suffix` are optional. They are equal to empty strings by default.

### Arguments

1. `color` _Required_ — Color for displaying the `content`. Can be any of [basic colors](https://wiki.archlinux.org/index.php/zsh#Colors) or [color codes](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).
2. `prefix` _Optional_ — Prefix before `content`. Usually, it's the value of `SPACESHIP_*_PREFIX`.
3. `content` _Required_ — The content of the section. Can be any valid value or result of command execution.
4. `suffix` _Optional_ — Suffix after `content`. Usually, it's the value of `SPACESHIP_*_SUFFIX`.

### Example

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

This command validates that given program is available for execution. It returns zero exit code if a `command` exists and non-zero if `command` doesn't.

You can use this utility to check if some program is installed and perform actions conditionally. For example, you can either return an error and exit or continue script's execution.

### Arguments

1. `command` _Required_ — a command that needs to be checked.

### Example

```zsh
# Check multiple commands for existin
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

### Arguments

1. `function` _Required_ — a function that needs to be checked.

### Example

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

### Example

```zsh
# Return if current directory is not a git repository
spaceship::is_git || return
```

## `spaceship::is_hg`

The same as [`spaceship::is_git`](#spaceshipisgit), but for functions. This utility returns zero exit code if a current working directory is a Git repository and non-zero if it's not.

### Example

```zsh
# Return if current directory is not a Mercurial repository
spaceship::is_hg || return
```

## `spaceship::deprecated <deprecated> [message]`

This utility checks if `deprecated` variable is set and if it is, prints the `message`. The `message` supports escapes to set foreground color, background color and other visual effects.

### Arguments

1. `deprecated` _Required_ — the name of a deprecated variable. If this variable is set (contains any value), then `"%B$deprecated%b is deprecated.` will be printed.
2. `message` _Optional_ — a string for additional deprecation message.

### Example

```zsh
# Check if SPACESHIP_BATTERY_ALWAYS_SHOW is set
spaceship::deprecated SPACESHIP_BATTERY_ALWAYS_SHOW "Use %BSPACESHIP_BATTERY_SHOW='always'%b instead."
#> SPACESHIP_BATTERY_ALWAYS_SHOW is deprecated. Use SPACESHIP_BATTERY_SHOW='always' instead.
```

## `spaceship::displaytime <seconds>`

This utility converts `seconds` into a human-readable format. It splits `seconds` into days (`d`), hours (`h`), minutes (`m`) and seconds (`s`).

### Arguments

1. `seconds` _Required_ — seconds for conversion into the readable format.

### Example

```zsh
spaceship::displaytime 123456
#> 1d 10h 17m 36s
```

## `spaceship::union <arr1[ arr2[ ...]]>`

A utility for performing a union (intersection) of arrays. It lists the contents found in two or more arrays.

Spaceship uses this utility internally for resolution of sections that need to be sourced.

### Arguments

1. `arr...` — a list of arrays.

### Example

```zsh
arr1=('a' 'b' 'c')
arr2=('b' 'c' 'd')
arr2=('c' 'd' 'e')
spaceship::union $arr1 $arr2 $arr3
#> a b c d e
```
