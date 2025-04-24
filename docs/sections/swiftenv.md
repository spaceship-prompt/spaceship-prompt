# Swift `swift`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Swift**](https://swift.org) is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. and the open-source community.

The `swift` section displays the version of Swift.

The local version has more priority than the global one.

## Options

| Variable                      |              Default               | Meaning                                         |
| :---------------------------- | :--------------------------------: | ----------------------------------------------- |
| `SPACESHIP_SWIFT_ASYNC`       |               `true`               | Render section asynchronously                   |
| `SPACESHIP_SWIFT_SHOW_LOCAL`  |               `true`               | Current local Swift version based on [swiftenv] |
| `SPACESHIP_SWIFT_SHOW_GLOBAL` |              `false`               | Global Swift version based on [swiftenv]        |
| `SPACESHIP_SWIFT_PREFIX`      | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                                |
| `SPACESHIP_SWIFT_SUFFIX`      | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                                |
| `SPACESHIP_SWIFT_SYMBOL`      |               `🐦·`                | Symbol displayed before the section             |
| `SPACESHIP_SWIFT_COLOR`       |              `yellow`              | Section's color                                 |
