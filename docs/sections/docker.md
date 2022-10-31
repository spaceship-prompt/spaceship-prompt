# Docker `docker`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Docker**](https://docker.com) is a set of the platform as a service (PaaS) products that use OS-level virtualization to deliver software in packages called containers.

The `docker` displays the version of Docker and the current [Docker context via `docker_context` subsection](#docker-context-docker_context).

This section is shown only in the projects containing a `Dockerfile`, `docker-compose.yml`, or another file (s) specified with `COMPOSE_FILE`. The environment variable `COMPOSE_PATH_SEPARATOR` is supported too. For more information see [Compose CLI environment variables](https://docs.docker.com/compose/reference/envvars/).

## Options

| Variable                   |              Default               | Meaning                             |
| :------------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_DOCKER_SHOW`    |               `true`               | Show section                        |
| `SPACESHIP_DOCKER_ASYNC`   |              `true`                | Render section asynchronously       |
| `SPACESHIP_DOCKER_PREFIX`  |               `on `                | Section's prefix                    |
| `SPACESHIP_DOCKER_SUFFIX`  | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_DOCKER_SYMBOL`  |               `🐳·`                | Symbol displayed before the section |
| `SPACESHIP_DOCKER_COLOR`   |               `cyan`               | Section's color                     |
| `SPACESHIP_DOCKER_VERBOSE` |              `false`               | Show complete Docker version        |

## Docker context `docker_context`

`docker_context` is a child section for `docker`. This section is not included in the prompt, but it's executed within the `docker` section.

This section will display the current remote Docker context using one of the following methods:

1. `DOCKER_MACHINE_NAME` environment variable
2. `DOCKER_HOST` environment variable
3. `docker context` command

## Display only `docker_context` without `docker`

You can replace `docker` with `docker_context` section if you don't want to see the Docker version.

```zsh title=".zshrc"
# Setting prefix and suffix for docker_context section
SPACESHIP_DOCKER_CONTEXT_PREFIX="on "
SPACESHIP_DOCKER_CONTEXT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"

# Replacing docker with docker_context
spaceship remove docker
spaceship add docker_context
```

### Options

| Variable                          | Default | Meaning                       |
| :-------------------------------- | :-----: | ----------------------------- |
| `SPACESHIP_DOCKER_CONTEXT_SHOW`   | `true`  | Show section                  |
| `SPACESHIP_DOCKER_CONTEXT_ASYNC`  | `true`  | Render section asynchronously |
| `SPACESHIP_DOCKER_CONTEXT_PREFIX` |  `·(`   | Section's prefix              |
| `SPACESHIP_DOCKER_CONTEXT_SUFFIX` |   `)`   | Section's suffix              |
