# Haskell `haskell`

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Haskell**](https://www.haskell.org) — це функціональна мова програмування загального призначення з нестрогою семантикою.

Секція `haskell` показує версію компілятора Haskell.

Ця секція показується лише в проєктах Haskell, а саме, коли:

* Пошук вгору знаходить файл `stack.yaml`.
* Поточна тека містить файли `.hs` або `.cabal`.

## Опції

| Змінна                     |          За замовчуванням          | Пояснення                               |
|:-------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_HASKELL_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_HASKELL_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_HASKELL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_HASKELL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_HASKELL_SYMBOL` |                `λ·`                | Символ, що відображається перед секцією |
| `SPACESHIP_HASKELL_COLOR`  |               `red`                | Колір секції                            |
