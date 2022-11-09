# Xcode `xcode`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Xcode**](https://developer.apple.com/xcode/) is a development environment for iOS, macOS, watchOS, and tvOS.

The `xcode` section displays the version of the Xcode.

The local version has more priority than the global one.

## Options

| Variable                      |              Default               | Meaning                                      |
| :---------------------------- | :--------------------------------: | -------------------------------------------- |
| `SPACESHIP_XCODE_ASYNC`       |               `true`               | Render section asynchronously                |
| `SPACESHIP_XCODE_SHOW_LOCAL`  |               `true`               | Current local Xcode version based on [xcenv] |
| `SPACESHIP_XCODE_SHOW_GLOBAL` |              `false`               | Global Xcode version based on [xcenv]        |
| `SPACESHIP_XCODE_PREFIX`      | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                             |
| `SPACESHIP_XCODE_SUFFIX`      | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                             |
| `SPACESHIP_XCODE_SYMBOL`      |                `🛠·`                | Symbol displayed before the section         |
| `SPACESHIP_XCODE_COLOR`       |               `blue`               | Section's color                              |
