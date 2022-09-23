# Package version `package`

!!! important "This section is rendered asynchronously by default"

!!! note
    This is the version of the package you are working on, not the version of the package manager itself.

!!! attention
    This section uses external tools for retrieving package versions.

    We use `yq`, `jq`, `python` or `node` to parse package version in JSON/YAML/TOML/XML files. Install [jq](https://stedolan.github.io/jq/) and/or [yq](https://kislyuk.github.io/yq/) to get more info from this section.

The `package` section shows when the current directory is a package.

## Supported package managers

Currently, these package managers are supported:

* [`npm`][npm] — version form `package.json` file. Private packages are detected.
* [`lerna`][lerna] — version from `lerna.json` file.
* [`cargo`][cargo] — version from `Cargo.toml` file. `cargo pkgid` is used to detect the version, which depends on `Cargo.lock`. Run `cargo build` to generate `Cargo.lock` if version is not shown.
* [`composer`][composer] — version from `composer.json` file.
* [`julia`][julia] — version from `Project.toml` file.
* [`maven`][maven] — version from `mvn` command.
* [`gradle`][gradle] — version from `gradle` command.

## Options

| Variable                         |              Default               | Meaning                             |
|:-------------------------------- |:----------------------------------:| ----------------------------------- |
| `SPACESHIP_PACKAGE_SHOW`         |               `true`               | Show section                        |
| `SPACESHIP_PACKAGE_ASYNC`        |               `true`               | Render section asynchronously       |
| `SPACESHIP_PACKAGE_SHOW_PRIVATE` |              `false`               | Show when a package is private      |
| `SPACESHIP_PACKAGE_PREFIX`       |               `is·`                | Section's prefix                    |
| `SPACESHIP_PACKAGE_SUFFIX`       | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_PACKAGE_SYMBOL`       |                `📦·`                | Symbol displayed before the section |
| `SPACESHIP_PACKAGE_COLOR`        |               `red`                | Section's color                     |

<!-- References -->
[npm]: https://www.npmjs.com
[lerna]: https://lerna.io
[cargo]: https://crates.io
[composer]: https://getcomposer.org
[julia]: https://julialang.org
[maven]: https://maven.apache.org
[gradle]: https://gradle.org
