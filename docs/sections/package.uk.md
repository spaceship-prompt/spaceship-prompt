# Версія пакету `package`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! note
    This is the version of the package you are working on, not the version of the package manager itself.

!!! attention
    This section uses external tools for retrieving package versions.

    We use `yq`, `jq`, `python` or `node` to parse package version in JSON/YAML/TOML/XML files. Install [jq](https://stedolan.github.io/jq/) and/or [yq](https://kislyuk.github.io/yq/) to get more info from this section.

The `package` section shows when the current directory is a package.

## Підтримувані менеджери пакетів

Наразі підтримуються ці пакетні менеджери:

* [`npm`][npm] — version form `package.json` file. Private packages are detected.
* [`lerna`][lerna] — version from `lerna.json` file.
* [`cargo`][cargo] — version from `Cargo.toml` file. `cargo pkgid` is used to detect the version, which depends on `Cargo.lock`. Run `cargo build` to generate `Cargo.lock` if version is not shown.
* [`composer`][composer] — version from `composer.json` file.
* [`julia`][julia] — version from `Project.toml` file.
* [`maven`][maven] — version from `mvn` command.
* [`gradle`][gradle] — version from `gradle` command.

## Опції

| Змінна                           |          За замовчуванням          | Пояснення                               |
|:-------------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_PACKAGE_SHOW`         |               `true`               | Показати секцію                         |
| `SPACESHIP_PACKAGE_ASYNC`        |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_PACKAGE_SHOW_PRIVATE` |              `false`               | Показувати, коли пакет є приватним      |
| `SPACESHIP_PACKAGE_PREFIX`       |               `is·`                | Префікс секції                          |
| `SPACESHIP_PACKAGE_SUFFIX`       | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_PACKAGE_SYMBOL`       |                `📦·`                | Символ, що відображається перед секцією |
| `SPACESHIP_PACKAGE_COLOR`        |               `red`                | Колір секції                            |

<!-- References -->
[npm]: https://www.npmjs.com
[lerna]: https://lerna.io
[cargo]: https://crates.io
[composer]: https://getcomposer.org
[julia]: https://julialang.org
[maven]: https://maven.apache.org
[gradle]: https://gradle.org
