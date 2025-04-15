# Docker `docker`

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Docker**](https://docker.com) є набором продуктів платформи як послуги (PaaS), які використовують віртуалізацію на рівні ОС, для розгортання програмного забезпечення з так званих пакунків – контейнерів.

Секція `docker` показує версію Docker та поточний [Docker-контекст у підсекції `docker_context`](#docker-context-docker_context).

Ця секція показується тільки в проєктах, що містять `Dockerfile`, `docker-compose.yml`, або інші файлі визначені в `COMPOSE_FILE`. Підтримується також змінна оточення `COMPOSE_PATH_SEPARATOR`. Для отримання додаткової інформації дивіться [змінні середовища Compose CLI](https://docs.docker.com/compose/reference/envvars/).

## Параметри

| Змінна                     |          За замовчуванням          | Пояснення                               |
|:-------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_DOCKER_SHOW`    |               `true`               | Показати секцію                         |
| `SPACESHIP_DOCKER_ASYNC`   |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_DOCKER_PREFIX`  |                `on`                | Префікс секції                          |
| `SPACESHIP_DOCKER_SUFFIX`  | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_DOCKER_SYMBOL`  |                `🐳·`                | Символ, що відображається перед секцією |
| `SPACESHIP_DOCKER_COLOR`   |               `cyan`               | Колір секції                            |
| `SPACESHIP_DOCKER_VERBOSE` |              `false`               | Показати повну версію Docker            |

## Контекст Docker `docker_context`

`docker_context` - це дочірня секція для `docker`. Ця секція не включається до командного рядка, але вона виконується всередині секції `docker`.

Ця секція буде показувати поточний контекст віддаленого Docker, використовуючи один з наступних методів:

1. `DOCKER_MACHINE_NAME` змінної середовища
2. `DOCKER_HOST` змінна середовища
3. команда `docker context`

## Показувати `docker_context` без `docker`

Ви можете замінити `docker` на `docker_context`, якщо не хочете бачити версію Docker.

```zsh title=".zshrc"
# Встановленя префікса та суфікса для секуції docker_context
SPACESHIP_DOCKER_CONTEXT_PREFIX="on "
SPACESHIP_DOCKER_CONTEXT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"

# Заміна docker на docker_context
spaceship remove docker
spaceship add docker_context
```

### Параметри

| Змінна                            | За замовчуванням | Пояснення                   |
|:--------------------------------- |:----------------:| --------------------------- |
| `SPACESHIP_DOCKER_CONTEXT_SHOW`   |      `true`      | Показати секцію             |
| `SPACESHIP_DOCKER_CONTEXT_ASYNC`  |      `true`      | Рендерити секцію асинхронно |
| `SPACESHIP_DOCKER_CONTEXT_PREFIX` |       `·(`       | Префікс підсекції           |
| `SPACESHIP_DOCKER_CONTEXT_SUFFIX` |       `)`        | Суфікс секції               |
