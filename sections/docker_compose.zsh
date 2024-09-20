#
# Docker Compose
#
# Compose is a tool for defining and running multi-container Docker applications.
# Link: https://docs.docker.com/compose/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DOCKER_COMPOSE_SHOW="${SPACESHIP_DOCKER_COMPOSE_SHOW=true}"
SPACESHIP_DOCKER_COMPOSE_ASYNC="${SPACESHIP_DOCKER_COMPOSE_ASYNC=true}"
SPACESHIP_DOCKER_COMPOSE_PREFIX="${SPACESHIP_DOCKER_COMPOSE_PREFIX="runs "}"
SPACESHIP_DOCKER_COMPOSE_SUFFIX="${SPACESHIP_DOCKER_COMPOSE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DOCKER_COMPOSE_SYMBOL="${SPACESHIP_DOCKER_COMPOSE_SYMBOL="🐙 "}"
SPACESHIP_DOCKER_COMPOSE_COLOR="${SPACESHIP_DOCKER_COMPOSE_COLOR="cyan"}"
SPACESHIP_DOCKER_COMPOSE_COLOR_UP="${SPACESHIP_DOCKER_COMPOSE_COLOR_UP="green"}"
SPACESHIP_DOCKER_COMPOSE_COLOR_DOWN="${SPACESHIP_DOCKER_COMPOSE_COLOR_DOWN="red"}"
SPACESHIP_DOCKER_COMPOSE_COLOR_PAUSED="${SPACESHIP_DOCKER_COMPOSE_COLOR_PAUSED="yellow"}"

# ------------------------------------------------------------------------------
# Utils
# ------------------------------------------------------------------------------

spaceship_docker_compose::paint() {
  local color="$1" text="$2"
  echo -n "%{%F{$color}%}$text%{%f%}"
}

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_docker_compose() {
  [[ $SPACESHIP_DOCKER_COMPOSE_SHOW == false ]] && return

  spaceship::exists docker-compose || return
  local docker_compose_globs=('docker-compose.y*ml' 'compose.y*ml')
  spaceship::upsearch -s $docker_compose_globs || return

  local containers="$(docker-compose ps -a 2>/dev/null | tail -n+2)"
  [[ -n "$containers" ]] || return

  local statuses=""

  while IFS= read -r line; do
    local letter_position=$(echo $line | awk 'match($0,"_"){print RSTART}')
    local letter=$(echo ${line:$letter:1} | tr '[:lower:]' '[:upper:]')
    local color=""
    [[ -z "$letter" ]] && continue

    if [[ "$line" == *"Up"* ]] || [[ "$line" == *"running"* ]]; then
      color="$SPACESHIP_DOCKER_COMPOSE_COLOR_UP"
    elif [[ "$line" == *"Paused"* ]] || [[ "$line" == *"paused"* ]]; then
      color="$SPACESHIP_DOCKER_COMPOSE_COLOR_PAUSED"
    else
      color="$SPACESHIP_DOCKER_COMPOSE_COLOR_DOWN"
    fi

    statuses+="$(spaceship_docker_compose::paint $color $letter)"
  done <<< "$containers"

  spaceship::section \
    --color "$SPACESHIP_DOCKER_COMPOSE_COLOR" \
    --prefix "$SPACESHIP_DOCKER_COMPOSE_PREFIX" \
    --suffix "$SPACESHIP_DOCKER_COMPOSE_SUFFIX" \
    --symbol "$SPACESHIP_DOCKER_COMPOSE_SYMBOL" \
    "$statuses"
}

