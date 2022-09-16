# Go `golang`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Go**](https://go.dev) is a programming language that makes it easy to build simple, reliable, and efficient software.

The `golang` section displays the version of the Go.

This section is displayed only when the current directory is within a Go project, meaning:

* Upsearch finds a `go.mod`, `Gopkg.toml`, `Gopkg.lock`, `glide.yaml` file or `Godeps` folder
* Contains any other file with `.go` extension
* The current directory is in the Go workspace defined in `$GOPATH`

## Using development versions of Go

If you are using a development version of `Go`, the version uses git commit hash instead. For example:

* `devel:5efe9a8f11` for development version
* `v1.11.4` for the release version

## Опції

| Змінна                    |              Default               | Meaning                                 |
|:------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_GOLANG_SHOW`   |               `true`               | Show section                            |
| `SPACESHIP_GOLANG_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_GOLANG_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                        |
| `SPACESHIP_GOLANG_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_GOLANG_SYMBOL` |                `🐹·`                | Символ, що відображається перед секцією |
| `SPACESHIP_GOLANG_COLOR`  |               `cyan`               | Колір секції                            |
