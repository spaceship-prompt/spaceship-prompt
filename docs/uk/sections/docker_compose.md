# Docker Compose `docker_compose`

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Docker Compose**](https://docs.docker.com/compose/) — інструмент для опису та запуску багатоконтейнерних застосунків.

Модуль `docker_compose` показує поточний статус запущеного контейнера Docker.

Ця секція показується тільки в проєктах, що містять файли `docker-compose.yml`, `docker-compose.yaml`, `compose.yml` або `compose.yaml`.

Секція показує індикатор для кожного запущеного контейнера, що складається з першої літери назви контейнера. Індикатор буде показаний:

* `green` – якщо контейнер запущено
* `yellow` – якщо контейнер призупинено
* `red` – якщо контейнер зупинено або в ньому виникла помилка

## Параметри

| Змінна                                  |               Типово               | Опис                                     |
|:--------------------------------------- |:----------------------------------:| ---------------------------------------- |
| `SPACESHIP_DOCKER_COMPOSE_SHOW`         |               `true`               | Показати секцію                          |
| `SPACESHIP_DOCKER_COMPOSE_ASYNC`        |               `true`               | Обробляти секцію асинхронно              |
| `SPACESHIP_DOCKER_COMPOSE_PREFIX`       |               `runs`               | Section's prefix                         |
| `SPACESHIP_DOCKER_COMPOSE_SUFFIX`       | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                            |
| `SPACESHIP_DOCKER_COMPOSE_SYMBOL`       |                `🐙`                 | Символ, що показується на початку секції |
| `SPACESHIP_DOCKER_COMPOSE_COLOR`        |               `cyan`               | Колір секції                             |
| `SPACESHIP_DOCKER_COMPOSE_COLOR_UP`     |              `green`               | Колір для запущених контейнерів          |
| `SPACESHIP_DOCKER_COMPOSE_COLOR_DOWN`   |               `red`                | Колір для зупинених контейнерів          |
| `SPACESHIP_DOCKER_COMPOSE_COLOR_PAUSED` |              `yellow`              | Колір для призупинених контейнерів       |
