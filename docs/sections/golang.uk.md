# Go `golang`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Go**](https://go.dev) is a programming language that makes it easy to build simple, reliable, and efficient software.

Секція `golang` відображає версію Go.

Ця секція відображається лише тоді, коли поточний каталог знаходиться у Go-проєкті, тобто:

* Upsearch finds a `go.mod`, `Gopkg.toml`, `Gopkg.lock`, `glide.yaml` file or `Godeps` folder
* Містить будь-який інший файл з розширенням `.go`
* The current directory is in the Go workspace defined in `$GOPATH`

## Використання розробницьких версій Go

If you are using a development version of `Go`, the version uses git commit hash instead. For example:

* `devel:5efe9a8f11` for development version
* `v1.11.4` for the release version

## Опції

| Змінна                    |          За замовчуванням          | Пояснення                               |
|:------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_GOLANG_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_GOLANG_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_GOLANG_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_GOLANG_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_GOLANG_SYMBOL` |                `🐹·`                | Символ, що відображається перед секцією |
| `SPACESHIP_GOLANG_COLOR`  |               `cyan`               | Колір секції                            |
