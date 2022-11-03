# Rust `rust`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Rust**](https://www.rust-lang.org) is a systems programming language that is focused on safety, speed, and concurrency.

The `rust` section displays the version of Rust.

This section is displayed only when the current directory is within a Rust project, meaning:

* Upsearch finds `Cargo.toml` file
* The current directory contains any `.rs` file

## Displaying verbose version

By default, this section will strip all of the suffixes from the version. For example, `1.42.0-nightly.2020-06-09` will be displayed as `1.42.0`. To disable that behavior use a `SPACESHIP_RUST_VERBOSE_VERSION` environment variable.

```zsh title=".zshrc"
# Display verbose version
SPACESHIP_RUST_VERBOSE_VERSION=true
```

## Options

| Variable                         |              Default               | Meaning                                 |
| :------------------------------- | :--------------------------------: | --------------------------------------- |
| `SPACESHIP_RUST_SHOW`            |               `true`               | Show section                            |
| `SPACESHIP_RUST_ASYNC`           |               `true`               | Render section asynchronously           |
| `SPACESHIP_RUST_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                        |
| `SPACESHIP_RUST_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                        |
| `SPACESHIP_RUST_SYMBOL`          |               `🦀·`                | Symbol displayed before the section     |
| `SPACESHIP_RUST_COLOR`           |               `red`                | Section's color                         |
| `SPACESHIP_RUST_VERBOSE_VERSION` |              `false`               | Show what branch is being used, if any. |
