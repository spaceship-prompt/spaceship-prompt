# Scala `scala`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Scala**](https://www.scala-lang.org/) is a strongly typed language supporting the functional and object oriented paradigms.

The `scala` section displays the version of the Scala compiler `scalac -version`.

This section is displayed only within Scala projects, meaning:

* Upsearch finds `.scalaenv` or `.sbtenv` files.
* Upsearch finds a `.metals` folder.
* Contains any other file with `*.sbt` or `*.scala` extension

## Options

| Variable                   |              Default               | Meaning                              |
| :------------------------- | :--------------------------------: | ------------------------------------ |
| `SPACESHIP_SCALA_SHOW`     |               `true`               | Show section                         |
| `SPACESHIP_SCALA_ASYNC`    |               `true`               | Render section asynchronously        |
| `SPACESHIP_SCALA_PREFIX`   | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                     |
| `SPACESHIP_SCALA_SUFFIX`   | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                     |
| `SPACESHIP_SCALA_SYMBOL`   |               `🆂 `                | Symbol displayed before the section  |
| `SPACESHIP_SCALA_COLOR`    |               `red`                | Section's color                      |
