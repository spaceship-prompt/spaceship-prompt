#
# Docker context
#
# Show current remote Docker context

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DOCKER_CONTEXT_SHOW="${SPACESHIP_DOCKER_CONTEXT_SHOW=true}"
SPACESHIP_DOCKER_CONTEXT_PREFIX="${SPACESHIP_DOCKER_CONTEXT_PREFIX=" ("}"
SPACESHIP_DOCKER_CONTEXT_SUFFIX="${SPACESHIP_DOCKER_CONTEXT_SUFFIX=")"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_docker_context() {
  [[ $SPACESHIP_DOCKER_CONTEXT_SHOW == false ]] && return

  local docker_remote_context

  # Docker has three different ways to work on remote Docker hosts:
  #  1. docker-machine
  #  2. DOCKER_HOST environment variable
  #  3. docker context (since Docker 19.03)
  if [[ -n $DOCKER_MACHINE_NAME ]]; then
    docker_remote_context="$DOCKER_MACHINE_NAME"
  elif [[ -n $DOCKER_HOST ]]; then
    # Remove protocol (tcp://) and port number from displayed Docker host
    docker_remote_context="$(basename $DOCKER_HOST | cut -d':' -f1)"
  else
    # Docker contexts can be set using either the DOCKER_CONTEXT environment variable
    # or the `docker context use` command. `docker context ls` will show the selected
    # context in both cases. But we are not interested in the local "default" context.
    docker_remote_context=$(docker context ls --format '{{if .Current}}{{if and (ne .Name "default") (ne .Name "desktop-linux")}}{{.Name}}{{end}}{{end}}' 2>/dev/null)
    [[ $? -ne 0 ]] && return

    docker_remote_context=$(echo $docker_remote_context | tr -d '\n')
  fi

  [[ -z $docker_remote_context ]] && return

  spaceship::section \
    "$SPACESHIP_DOCKER_COLOR" \
    "$SPACESHIP_DOCKER_CONTEXT_PREFIX${docker_remote_context}$SPACESHIP_DOCKER_CONTEXT_SUFFIX"
}
