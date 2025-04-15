# Scala `scala`

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Scala**](https://www.scala-lang.org/) — це строго типізована мова, яка підтримує функціональну та об’єктноорієнтовану парадигми.

Секція `scala` показує версію компілятора Scala, `scalac -version`.

Ця секція показується лише в проєктах Scala, а саме, коли:

* Пошук знаходить файли `.scalaenv` або `.sbtenv`.
* Пошук знаходить теку `.metals`.
* Містить будь-які інші файли з розширенням `*.sbt` або `*.scala`

## Параметри

| Змінна                   |               Типово               | Опис                                     |
|:------------------------ |:----------------------------------:| ---------------------------------------- |
| `SPACESHIP_SCALA_SHOW`   |               `true`               | Показати секцію                          |
| `SPACESHIP_SCALA_ASYNC`  |               `true`               | Обробляти секцію асинхронно              |
| `SPACESHIP_SCALA_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                           |
| `SPACESHIP_SCALA_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                            |
| `SPACESHIP_SCALA_SYMBOL` |                `🆂`                 | Символ, що показується на початку секції |
| `SPACESHIP_SCALA_COLOR`  |               `red`                | Колір секції                             |
