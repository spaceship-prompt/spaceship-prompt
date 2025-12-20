# Julia `julia`

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Julia**](https://julialang.org) — високорівнева, динамічна мова програмування для числових обчислень.

Секція `julia` показує версію компілятора Julia.

Ця секція показується лише тоді, коли:

* Компілятор `julia` в наявності.
* Поточна тека містить файли `.jl`.
* За результатами пошуку знайдено файли `Project.toml`, `JuliaProject.toml` або `Manifest.toml`.

## Опції

| Змінна                   |          За замовчуванням          | Пояснення                               |
|:------------------------ |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_JULIA_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_JULIA_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_JULIA_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_JULIA_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_JULIA_SYMBOL` |                `ஃ·`                | Символ, що відображається перед секцією |
| `SPACESHIP_JULIA_COLOR`  |              `green`               | Колір секції                            |
