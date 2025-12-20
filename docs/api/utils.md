# General utilities

Below you can find a list of general purpose utilities.

## `spaceship::exists`

``` title="Signature"
spaceship::exists <command>
```

This command validates that given program is available for execution. It checks for PATH binaries, functions, and builtins. It returns zero exit code if a `command` exists and non-zero code otherwise.

You can use this utility to check if some program is installed and perform actions conditionally. For example, you can either return an error and exit or continue script's execution. For example:

```zsh
# Check multiple commands for existing
if spaceship::exists nvm; then
  # extract nvm version
elif spaceship::exists node; then
  # extract node version
else
  return
fi

# Do nothing if docker is not installed
spaceship::exists docker || return
```

## `spaceship::defined`

``` title="Signature"
spaceship::defined <function>
```

The same as [`spaceship::exists`](#spaceshipexists), but for functions. It returns zero exit code if a `function` has been defined previously and non-zero if `function` hasn't.

You can use this utility to check if a user has previously defined a function or not. For example:

```zsh
# Check if section has been defined
if spaceship::defined spaceship_section; then
  spaceship_section
else
  # section is not found
fi
```

## `spaceship::is_git`

This utility returns zero exit code if a current working directory is a Git repository and non-zero if it's not. For example:

```zsh
# Return if current directory is not a git repository
spaceship::is_git || return
```

## `spaceship::is_hg`

The same as [`spaceship::is_git`](#spaceshipisgit), but for Mercurial repositories. This utility returns zero exit code if a current working directory is a Mercurial repository and non-zero if it's not.

```zsh
# Return if current directory is not a Mercurial repository
spaceship::is_hg || return
```

## `spaceship::is_section_async`

Checks if a section is asynchronous or not by checking `SPACESHIP_<SECTION>_ASYNC` option. This utility returns zero exit code if a section is asynchronous and non-zero if it's not.

If `SPACESHIP_PROMPT_ASYNC` is set to `false`, then all sections are considered to be synchronous.

``` title="Signature"
spaceship::is_section_async <section>
```

1. `section` _Required_ — a section to be checked.

Some sections are always synchronous, not matter what, to ensure correct work of the prompt. Those are: `user`, `dir`, `host`, `exec_time`, `async`, `line_sep`, `jobs`, `exit_code` and `char`.

## `spaceship::is_prompt_async`

Checks if the prompt works in asynchronous mode or not. This utility returns zero exit code if the prompt works in asynchronous mode and non-zero if it's not.

Check if `SPACESHIP_PROMPT_ASYNC` is set to `true` and [`zsh-async` is loaded](#spaceshipis_section_async).

## `spaceship::deprecated`

This utility checks if `option` variable is set and if it is, prints the `message`. The `message` supports escapes to set foreground color, background color and other visual effects.

``` title="Signature"
spaceship::deprecated <option> [message]
```

1. `option` _Required_ — the name of a deprecated variable. If this variable is set (contains any value), then `"%B$deprecated%b is deprecated.` will be printed. `%B` and `%b` is escapes to set the bold style for text.
2. `message` _Optional_ — a string for additional deprecation message. Can contain prompt expansions.

Read more about escapes in [Prompt Expansion](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html) section of Zsh documentation.

Here's an example of usage:

```zsh
# Check if SPACESHIP_BATTERY_ALWAYS_SHOW is set
spaceship::deprecated SPACESHIP_BATTERY_ALWAYS_SHOW "Use %BSPACESHIP_BATTERY_SHOW='always'%b instead."
#> SPACESHIP_BATTERY_ALWAYS_SHOW is deprecated. Use SPACESHIP_BATTERY_SHOW='always' instead.
```

## `spaceship::displaytime`

This utility converts `seconds` into a human-readable format. It splits `seconds` into days (`d`), hours (`h`), minutes (`m`) and seconds (`s`).

``` title="Signature"
spaceship::displaytime <seconds> [precision]
```

1. `seconds` _Required_ — seconds for conversion into the readable format.
1. `precision` _Optional_ — precision of the output. Default value is `1`.

The usage example looks like this:

```zsh
spaceship::displaytime 123456
#> 1d 10h 17m 36.0s

paceship::displaytime 123.45 2
#> 2m 3.45s
```

## `spaceship::union`

A utility for performing a union (intersection) of arrays. It lists the contents found in two or more arrays.

Spaceship uses this utility internally for resolution of sections that need to be sourced.

``` title="Signature"
spaceship::union <arr1[ arr2[ ...]]>
```

1. `arr...` — a list of arrays.

Here is an example:

```zsh
arr1=('a' 'b' 'c')
arr2=('b' 'c' 'd')
arr3=('c' 'd' 'e')
spaceship::union $arr1 $arr2 $arr3
#> a b c d e
```

## `spaceship::upsearch`

Performs an upward search for a specific file or directory. Returns the path of the first found file or directory. Goes upwards up to the repository or system root directory. Useful for understanding the context of a current directory.

``` title="Signature"
spaceship::upsearch [--silent] <paths...>
```

1. `paths...` _Required_ — a list of paths to search.
2. `--silent` or `-s` _Optional_ — if set, then the utility will return zero exit code, if at least one of `paths` is found and non-zero, if not.

This can be used for detecting project context or finding a specific file upwards.

```zsh
# Understanding the project context
spaceship::upsearch -s package.json node_modules && echo "Node project detected."

# Finding a specific file upwards
spaceship::upsearch package.json
#> /path/to/project/package.json
```

## `spaceship::extract`

!!! note
    This utility has an alias `spaceship::datafile`

This utility queries data files for a specific key. It returns the value of the key. Exits with non-zero code when the file type is unknown, data cannot be read, or the key is not found.

``` title="Signature"
spaceship::extract --<type> <file> [...keys]
```

1. `--type` _Required_ — a type of the data file. Can be `json`, `yaml`, `toml` or `xml`.
2. `file` _Required_ — a path to the data file.
3. `key` _Optional_ — a key to query within a data file.

You can use this utility to query data from a data file:

```zsh
spaceship::extract --json package.json "author.name"
#> "John Doe"
```

It needs the following tools for reading data files:

* JSON — [`jq`](https://stedolan.github.io/jq/), [`yq`](https://mikefarah.gitbook.io/yq/) or [`python-yq`](https://kislyuk.github.io/yq/), [`python`](https://www.python.org/), [`node`](https://nodejs.org/)
* YAML — [`yq`](https://mikefarah.gitbook.io/yq/) or [`python-yq`](https://kislyuk.github.io/yq/), [`python`](https://www.python.org/)
* TOML — `tomlq` (comes with [`python-yq`](https://kislyuk.github.io/yq/))
* XML — `xq` (comes with [`python-yq`](https://kislyuk.github.io/yq/))

!!! tip
    The most universal solution for reading data files is to use [`python-yq`](https://kislyuk.github.io/yq/).
