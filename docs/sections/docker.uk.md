# Docker `docker`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Docker**](https://docker.com) is a set of the platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers.

The `docker` displays the version of Docker and the current [Docker context via `docker_context` subsection](#docker-context-docker_context).

This section is shown only in the projects containing a `Dockerfile`, `docker-compose.yml`, or another file (s) specified with `COMPOSE_FILE`. The environment variable `COMPOSE_PATH_SEPARATOR` is supported too. For more information see [Compose CLI environment variables](https://docs.docker.com/compose/reference/envvars/).

## Опції

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

`docker_context` - це дочірня секція для `docker`. This section is not included in the prompt, but it's executed within the `docker` section.

This section will display the current remote Docker context using one of the following methods:

1. `DOCKER_MACHINE_NAME` змінної середовища
2. `DOCKER_HOST` змінна середовища
3. команда `docker context`

## Показувати `docker_context` без `docker`

You can replace `docker` with `docker_context` section if you don't want to see the Docker version.

```zsh title=".zshrc"
# Setting prefix and suffix for docker_context section
SPACESHIP_DOCKER_CONTEXT_PREFIX="on "
SPACESHIP_DOCKER_CONTEXT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"

# Replacing docker with docker_context
spaceship remove docker
spaceship add docker_context
```

### Опції

| Змінна                            | За замовчуванням | Пояснення                   |
|:--------------------------------- |:----------------:| --------------------------- |
| `SPACESHIP_DOCKER_CONTEXT_SHOW`   |      `true`      | Показати секцію             |
| `SPACESHIP_DOCKER_CONTEXT_ASYNC`  |      `true`      | Рендерити секцію асинхронно |
| `SPACESHIP_DOCKER_CONTEXT_PREFIX` |       `·(`       | Префікс підсекції           |
| `SPACESHIP_DOCKER_CONTEXT_SUFFIX` |       `)`        | Суфікс секції               |
