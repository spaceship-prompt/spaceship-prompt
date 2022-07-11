# Sections

Sections are defined using `spaceship::section` function. This section takes the content of the section parameters for displaying, like prefix, suffix, color and symbol for the section. These values will be used for displaying the section.

The `spaceship::section` is used to pack the section data into a data tuple. This data tuple is stored in the cache. During the rendering process, the data tuple for each section is being rendered into a section via `spaceship::section::render` function.

## `spaceship::section`

!!! tip
    For creating a custom section, prefer using the [`spaceship::section::v4` function](#spaceshipsectionv4). The versioned function will ensure compatibility with new versions of Spaceship.

This is the main function for defining a section. This takes section parameters and its content and transforms it into a data tuple.

``` title="Signature"
spaceship::section [--color color] [--prefix prefix] [--suffix suffix] [--symbol symbol] <content>
```

It takes a single argument `content` which is the content of the section. Additionally, the function takes the following optional parameters:

* `--color` — color for displaying the `content`. Can be any of [basic colors](https://wiki.archlinux.org/index.php/zsh#Colors) or [color codes](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).
* `--prefix` — prefix before `content`. Usually, it's the value of `SPACESHIP_<SECTION>_PREFIX`.
* `--symbol` — the symbol of the section. Can be any valid value or result of command execution. Will be rendered before the content.
* `--suffix` — suffix after `content`. Usually, it's the value of `SPACESHIP_<SECTION>_SUFFIX`.

The order of the parameters is not important. All of them are default to empty strings.

!!! help
    The `content`, `--prefix`, `--suffix` and `--symbol` can contain escapes to set additional foreground color, background color and other visual effects.

    Read more about escapes in [13 Prompt Expansion](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html) section of Zsh documentation.

## `spaceship::section::v4`

This is an alias of `spaceship::section` function. It's the versioned function for creating a custom section.

The signature of this function is the same as for `spaceship::section` function.

Here is an example usage:

```zsh
local content="value"

spaceship::section::v4 \
  --color "$SPACESHIP_SECTION_COLOR" \
  --prefix "$SPACESHIP_SECTION_PREFIX" \
  --suffix "$SPACESHIP_SECTION_SUFFIX" \
  --symbol "$SPACESHIP_SECTION_SYMBOL" \
  "$content"
```

## `spaceship::section::v3`

!!! warning
    This function is introduced for compatibility with Spaceship v3 sections. It's recommended to use the [`spaceship::section::v4` function](#spaceshipsectionv4) instead.

This is a replacement for the `spaceship::section` function used in Spaceship v3. Use it for backward compatibility only.

``` title="Signature"
spaceship::section <color> [prefix] <content> [suffix]
```

The `spaceship::section:v3` relies on the following arguments order:

1. `color` _Required_ — color for displaying the `content`. Can be any of [basic colors](https://wiki.archlinux.org/index.php/zsh#Colors) or [color codes](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).
2. `prefix` _Optional_ — prefix before `content`. Usually, it's the value of `SPACESHIP_<SECTION>_PREFIX`.
3. `content` _Required_ — the content of the section. Can be any valid value or result of command execution.
4. `suffix` _Optional_ — suffix after `content`. Usually, it's the value of `SPACESHIP_<SECTION>_SUFFIX`.

Here is a simple example:

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

## `spaceship::section::render`

This function renders the section from the data tuple provided by [`spaceship::section`](#spaceshipsection).

``` title="Signature"
spaceship::render section <data>
```

If `SPACESHIP_PROMPT_PREFIXES_SHOW` is `false` or if the section is not the first in the prompt, then prefix will be omitted.

If `SPACESHIP_PROMPT_SUFFIXES_SHOW` is `false`, then suffix will be omitted.

The `data` is a result of the `spaceship::section` function. For example:

```zsh
local color="red" content="value"

spaceship::section::render "$(spaceship::section --color "$color" "$content")"
#> %{%B%F{red}%}value%{%b%f%}
```

!!! tip
    You can use for rendering subsections within complex sections. See the sources of [`git`](https://github.com/spaceship-prompt/spaceship-prompt/blob/master/sections/git.zsh) or [`docker`](https://github.com/spaceship-prompt/spaceship-prompt/blob/master/sections/docker.zsh) sections for an example.
