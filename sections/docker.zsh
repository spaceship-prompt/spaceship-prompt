#
# Docker
#
# Docker automates the repetitive tasks of setting up development environments
# Link: https://www.docker.com

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DOCKER_SHOW="${SPACESHIP_DOCKER_SHOW=true}"
SPACESHIP_DOCKER_ASYNC="${SPACESHIP_DOCKER_ASYNC=true}"
SPACESHIP_DOCKER_PREFIX="${SPACESHIP_DOCKER_PREFIX="on "}"
SPACESHIP_DOCKER_SUFFIX="${SPACESHIP_DOCKER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DOCKER_SYMBOL="${SPACESHIP_DOCKER_SYMBOL="🐳 "}"
SPACESHIP_DOCKER_COLOR="${SPACESHIP_DOCKER_COLOR="cyan"}"
SPACESHIP_DOCKER_VERBOSE="${SPACESHIP_DOCKER_VERBOSE=false}"

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/sections/docker_context.zsh"
spaceship::precompile "$SPACESHIP_ROOT/sections/docker_context.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current Docker version and connected machine
spaceship_docker() {
  [[ $SPACESHIP_DOCKER_SHOW == false ]] && return

  spaceship::exists docker || return

  # Better support for docker environment vars: https://docs.docker.com/compose/reference/envvars/
  if [[ -n "$COMPOSE_FILE" ]]; then
    local compose_path
    # Use COMPOSE_PATH_SEPARATOR or colon as default
    local separator=${COMPOSE_PATH_SEPARATOR:-":"}
    # COMPOSE_FILE may have several filenames separated by colon, upsearch all of them
    local filenames=("${(@ps/$separator/)COMPOSE_FILE}")
    local compose_path="$(spaceship::upsearch -s $filenames)"

    # Must return if COMPOSE_FILE is present but invalid
    [[ -n "$compose_path" ]] || return
  fi

  local docker_context="$(spaceship_docker_context)"
  local docker_context_section="$(spaceship::section::render $docker_context)"

  # Show Docker status only for Docker-specific folders or when connected to external host
  local docker_project_globs=('Dockerfile' '.devcontainer/Dockerfile' 'docker-compose.y*ml')
  local is_docker_project="$(spaceship::upsearch Dockerfile $docker_project_globs)"
  [[ -n "$is_docker_project" || -f /.dockerenv || -n "$docker_context" ]] || return

  # if docker daemon isn't running you'll get an error saying it can't connect
  # Note: Declaration and assignment is separated for correctly getting the exit code
  local docker_version=$(docker version -f "{{.Server.Version}}" 2>/dev/null)
  [[ $? -ne 0 || -z $docker_version ]] && return

  [[ $SPACESHIP_DOCKER_VERBOSE == false ]] && docker_version=${docker_version%-*}

  spaceship::section \
    --color "$SPACESHIP_DOCKER_COLOR" \
    --prefix "$SPACESHIP_DOCKER_PREFIX" \
    --suffix "$SPACESHIP_DOCKER_SUFFIX" \
    --symbol "$SPACESHIP_DOCKER_SYMBOL" \
    "v${docker_version}${docker_context_section}"
}
