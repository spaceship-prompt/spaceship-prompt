# swiftenv `swiftenv`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**swiftenv**](https://swiftenv.fuller.li/) allows you to easily install, and switch between multiple versions of Swift.

The `swiftenv` section displays the version of Swift.

The local version has more priority than the global one.

## Options

| Variable                         |              Default               | Meaning                                         |
| :------------------------------- | :--------------------------------: | ----------------------------------------------- |
| `SPACESHIP_SWIFTENV_ASYNC`       |               `true`               | Render section asynchronously                   |
| `SPACESHIP_SWIFTENV_SHOW_LOCAL`  |               `true`               | Current local Swift version based on [swiftenv] |
| `SPACESHIP_SWIFTENV_SHOW_GLOBAL` |              `false`               | Global Swift version based on [swiftenv]        |
| `SPACESHIP_SWIFTENV_PREFIX`      | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                                |
| `SPACESHIP_SWIFTENV_SUFFIX`      | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                                |
| `SPACESHIP_SWIFTENV_SYMBOL`      |               `🐦·`                | Symbol displayed before the section             |
| `SPACESHIP_SWIFTENV_COLOR`       |              `yellow`              | Section's color                                 |
