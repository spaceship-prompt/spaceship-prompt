# Rust `rust`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Rust**](https://www.rust-lang.org) is a systems programming language that is focused on safety, speed, and concurrency.

Секція `rust` відображає версію Rust.

Ця секція відображається лише тоді, коли поточний каталог знаходиться у Rust-проєкті, тобто:

* Пошук вгору знаходить файл `Cargo.toml`
* Поточна папка містить будь-який файл `.rs`

## Відображення детальної версії

By default, this section will strip all of the suffixes from the version. For example, `1.42.0-nightly.2020-06-09` will be displayed as `1.42.0`. To disable that behavior use a `SPACESHIP_RUST_VERBOSE_VERSION` environment variable.

```zsh title=".zshrc"
# Display verbose version
SPACESHIP_RUST_VERBOSE_VERSION=true
```

## Опції

| Змінна                           |          За замовчуванням          | Пояснення                               |
|:-------------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_RUST_SHOW`            |               `true`               | Показати секцію                         |
| `SPACESHIP_RUST_ASYNC`           |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_RUST_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_RUST_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_RUST_SYMBOL`          |                `🦀·`                | Символ, що відображається перед секцією |
| `SPACESHIP_RUST_COLOR`           |               `red`                | Колір секції                            |
| `SPACESHIP_RUST_VERBOSE_VERSION` |              `false`               | Show what branch is being used, if any. |
