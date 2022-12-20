#
# Dart
#
# Dart is a client-optimized language for fast apps on any platform
# Link: https://dart.dev/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
SPACESHIP_DART_SHOW="${SPACESHIP_DART_SHOW=true}"
SPACESHIP_DART_ASYNC="${SPACESHIP_DART_ASYNC=true}"
SPACESHIP_DART_PREFIX="${SPACESHIP_DART_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_DART_SUFFIX="${SPACESHIP_DART_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DART_SYMBOL="${SPACESHIP_DART_SYMBOL="🎯 "}"
SPACESHIP_DART_COLOR="${SPACESHIP_DART_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_dart() {
  [[ $SPACESHIP_DART_SHOW == false ]] && return
  spaceship::exists dart || return

  local is_dart_project="$(spaceship::upsearch pubspec.yaml pubspec.yml pubspec.lock dart_tool)"
  [[ -n "$is_dart_project" || -n *.dart(#qN^/) ]] || return

  # The Dart binary can be installed directly as 'dart-sdk' or as bundle via Flutter
  # The version can have the following patterns:
  # dart-sdk >       Dart SDK version: 2.19.0-edge.efb509c114dcaf54d0a011f717b48893d71ec9c3 (be) (Thu Sep 29 01:58:56 2022 +0000) on "macos_x64"
  # flutter bundle > Dart SDK version: 2.18.1 (stable) (Tue Sep 13 11:42:55 2022 +0200) on "macos_x64"
  local dart_version=$(dart --version | awk '{sub(/-.*/, "", $4); print $4}')

  spaceship::section \
    --color "$SPACESHIP_DART_COLOR" \
    --prefix "$SPACESHIP_DART_PREFIX" \
    --suffix "$SPACESHIP_DART_SUFFIX" \
    --symbol "${SPACESHIP_DART_SYMBOL}" \
    "v${dart_version}"
}
