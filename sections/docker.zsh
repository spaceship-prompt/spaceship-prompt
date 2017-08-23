# DOCKER
SPACESHIP_DOCKER_SHOW="${SPACESHIP_DOCKER_SHOW:=true}"
SPACESHIP_DOCKER_PREFIX="${SPACESHIP_DOCKER_PREFIX:="on "}"
SPACESHIP_DOCKER_SUFFIX="${SPACESHIP_DOCKER_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DOCKER_SYMBOL="${SPACESHIP_DOCKER_SYMBOL:="🐳 "}"
SPACESHIP_DOCKER_COLOR="${SPACESHIP_DOCKER_COLOR:="cyan"}"

# DOCKER
# Show current Docker version and connected machine
spaceship_docker() {
  [[ $SPACESHIP_DOCKER_SHOW == false ]] && return

  _exists docker || return

  # Show Docker status only for Docker-specific folders
  [[ -f Dockerfile || -f docker-compose.yml ]] || return

  # if docker daemon isn't running you'll get an error saying it can't connect
  docker info 2>&1 | grep -q "Cannot connect" && return

  local docker_version=$(docker version -f "{{.Server.Version}}")

  if [[ -n $DOCKER_MACHINE_NAME ]]; then
    docker_version+=" via ($DOCKER_MACHINE_NAME)"
  fi

  _prompt_section \
    "$SPACESHIP_DOCKER_COLOR" \
    "$SPACESHIP_DOCKER_PREFIX" \
    "${SPACESHIP_DOCKER_SYMBOL}v${docker_version}" \
    "$SPACESHIP_DOCKER_SUFFIX"
}
