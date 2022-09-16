# Elm `elm`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Elm**](https://elm-lang.org) is a functional programming language for building interactive and performant user interfaces.

The `elm` section displays the Elm version.

This section is displayed only when the current directory:

* Is within an Elm project (upsearch finds `elm.json`, `elm-package.json`, or `elm-stuff`)
* Contains any `.elm` file

## Options

| Variable               |              Default               | Meaning                             |
|:---------------------- |:----------------------------------:| ----------------------------------- |
| `SPACESHIP_ELM_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_ELM_ASYNC`  |               `true`               | Render section asynchronously       |
| `SPACESHIP_ELM_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_ELM_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_ELM_SYMBOL` |                `🌳·`                | Symbol displayed before the section |
| `SPACESHIP_ELM_COLOR`  |               `cyan`               | Section's color                     |
