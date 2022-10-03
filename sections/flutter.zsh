
# Flutter

# Flutter is an open source framework for building multi-platform applications
# Link: https://flutter.dev/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
SPACESHIP_FLUTTER_SHOW="${SPACESHIP_FLUTTER_SHOW=true}"
SPACESHIP_FLUTTER_ASYNC="${SPACESHIP_FLUTTER_ASYNC=true}"
SPACESHIP_FLUTTER_PREFIX="${SPACESHIP_FLUTTER_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_FLUTTER_SUFFIX="${SPACESHIP_FLUTTER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_FLUTTER_SYMBOL="${SPACESHIP_FLUTTER_SYMBOL="💙 "}"
SPACESHIP_FLUTTER_COLOR="${SPACESHIP_FLUTTER_COLOR="blue"}"
SPACESHIP_FLUTTER_CHANNEL_SHOW="${SPACESHIP_FLUTTER_CHANNEL_SHOW=true}"
SPACESHIP_FLUTTER_CHANNEL_PREFIX="${SPACESHIP_FLUTTER_CHANNEL_PREFIX=""}"
SPACESHIP_FLUTTER_CHANNEL_SUFFIX="${SPACESHIP_FLUTTER_CHANNEL_SUFFIX=""}"
SPACESHIP_FLUTTER_CHANNEL_SYMBOL="${SPACESHIP_FLUTTER_CHANNEL_SYMBOL=" #"}"

# ------------------------------------------------------------------------------
# Section(s)
# ------------------------------------------------------------------------------
spaceship_flutter() {
  [[ $SPACESHIP_FLUTTER_SHOW == false ]] && return
  spaceship::exists flutter || return

  local pubspec_file=$(spaceship::upsearch pubspec.yaml pubspec.yml) || return
  local is_flutter_project="$(spaceship::datafile --yaml $pubspec_file "dependencies.flutter")"

  [[ -n "$is_flutter_project" &&  "$is_flutter_project" != "null" ]] || return

  local flutter_version_output=$(flutter --version | head -n 1)
  local flutter_version=$(echo "$flutter_version_output" | awk '{print $2}')
  local flutter_channel=$(echo "$flutter_version_output" | awk '{print $5}')
  local flutter_channel_section="$(__spaceship_flutter_channel $flutter_channel)"


  spaceship::section \
    --color "$SPACESHIP_FLUTTER_COLOR" \
    --prefix "$SPACESHIP_FLUTTER_PREFIX" \
    --suffix "$SPACESHIP_FLUTTER_SUFFIX" \
    --symbol "${SPACESHIP_FLUTTER_SYMBOL}" \
    "v${flutter_version}${flutter_channel_section}"

}

# internal section for channel
#   param: channel
__spaceship_flutter_channel() {
  [[ $SPACESHIP_FLUTTER_CHANNEL_SHOW == false ]] && return

  local flutter_channel=${1:?"unknown"}
  echo -n "$SPACESHIP_FLUTTER_CHANNEL_SYMBOL$SPACESHIP_FLUTTER_CHANNEL_PREFIX${flutter_channel}$SPACESHIP_FLUTTER_CHANNEL_SUFFIX"
}
