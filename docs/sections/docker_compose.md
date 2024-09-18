# Docker Compose `docker_compose`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Docker Compose**](https://docs.docker.com/compose/) is a tool for defining and running multi-container Docker applications.

The `docker_compose` module shows the current status of running Docker container.

This section is shown only in the projects containing `docker-compose.yml`, `docker-compose.yaml`, `compose.yml` or `compose.yaml` files.

It shows indicators for each of the running containers marked by the first letter of the container name. Indicator will be displayed:

* `green` if the container is running
* `yellow` if the container is paused
* `red` if the container is stopped or errored

## Options

| Variable                                |              Default               | Meaning                             |
| :-------------------------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_DOCKER_COMPOSE_SHOW`         |               `true`               | Show section                        |
| `SPACESHIP_DOCKER_COMPOSE_ASYNC`        |              `true`                | Render section asynchronously       |
| `SPACESHIP_DOCKER_COMPOSE_PREFIX`       |               `runs `              | Section's prefix                    |
| `SPACESHIP_DOCKER_COMPOSE_SUFFIX`       | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_DOCKER_COMPOSE_SYMBOL`       |               `🐙 `                | Symbol displayed before the section |
| `SPACESHIP_DOCKER_COMPOSE_COLOR`        |               `cyan`               | Section's color                     |
| `SPACESHIP_DOCKER_COMPOSE_COLOR_UP`     |               `green`              | Color for running containers        |
| `SPACESHIP_DOCKER_COMPOSE_COLOR_DOWN`   |               `red`                | Color for stopped containers        |
| `SPACESHIP_DOCKER_COMPOSE_COLOR_PAUSED` |               `yellow`             | Color for paused containers         |
