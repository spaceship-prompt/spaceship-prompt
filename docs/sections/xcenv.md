# xcenv `xcenv`

!!! important "This section is rendered asynchronously by default"

!!! info
    Use [**xcenv**](https://xcenv.org/) to document and manage the Xcode version for your project and system..

The `xcenv` section displays the version of Xcode.

The local version has more priority than the global one.

## Options

| Variable                      |              Default               | Meaning                                      |
| :---------------------------- | :--------------------------------: | -------------------------------------------- |
| `SPACESHIP_XCENV_ASYNC`       |               `true`               | Render section asynchronously                |
| `SPACESHIP_XCENV_SHOW_LOCAL`  |               `true`               | Current local Xcode version based on [xcenv] |
| `SPACESHIP_XCENV_SHOW_GLOBAL` |              `false`               | Global Xcode version based on [xcenv]        |
| `SPACESHIP_XCENV_PREFIX`      | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                             |
| `SPACESHIP_XCENV_SUFFIX`      | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                             |
| `SPACESHIP_XCENV_SYMBOL`      |                `🛠·`                | Symbol displayed before the section         |
| `SPACESHIP_XCENV_COLOR`       |               `blue`               | Section's color                              |
