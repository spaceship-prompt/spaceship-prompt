#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# LOAD USER CONFIG
# Try to load configuration file from pre-defined locations
# ------------------------------------------------------------------------------

if [[ -z "$SPACESHIP_CONFIG_PATH" ]]; then
  SPACESHIP_CONFIG_PATH=(
    "$HOME/.spaceshiprc"
    "$HOME/.spaceshiprc.zsh"
    "${XDG_CONFIG_HOME:="$HOME/.config"}/spaceship.zsh"
    "${XDG_CONFIG_HOME:="$HOME/.config"}/spaceship/spaceship.zsh"
    "${XDG_CONFIG_DIRS:="/etc/xdg"}/spaceship.zsh"
  )
fi

export SPACESHIP_CONFIG

# Find the first existing file if config is not overriden
if [[ -z "$SPACESHIP_CONFIG" ]]; then
  for config in $SPACESHIP_CONFIG_PATH; do
    if [[ -f "$config" ]]; then
      SPACESHIP_CONFIG="$config"
      break
    fi
  done
fi

# Load file if it exists
if [[ -f "$SPACESHIP_CONFIG" ]]; then
  source "$SPACESHIP_CONFIG"
  spaceship::precompile "$SPACESHIP_CONFIG"
fi

typeset -gA _SPACESHIP_CONFIG_BASELINE
typeset -ga _SPACESHIP_CONFIG_FILES
typeset -g _SPACESHIP_CONFIG_BASELINE_READY=false
typeset -g _SPACESHIP_PER_DIRECTORY_CONFIG_BASELINE
typeset -g _SPACESHIP_PER_DIRECTORY_CONFIG_FILE_BASELINE

# Returns whether a parameter should be managed by per-directory config.
spaceship::config::is_managed() {
  setopt LOCAL_OPTIONS EXTENDED_GLOB

  local name="$1"

  [[ "$name" == SPACESHIP_[A-Z0-9_]## ]] || return 1

  case "$name" in
    SPACESHIP_ROOT|SPACESHIP_VERSION|SPACESHIP_CONFIG|SPACESHIP_CONFIG_PATH)
      return 1
      ;;
    SPACESHIP_CACHE|SPACESHIP_JOBS)
      return 1
      ;;
    # These options control the per-directory loader itself. Keep them global-only
    # so a local config cannot disable the loader or change the lookup filename
    # for later directory changes.
    SPACESHIP_PER_DIRECTORY_CONFIG|SPACESHIP_PER_DIRECTORY_CONFIG_FILE)
      return 1
      ;;
  esac

  [[ "${parameters[$name]}" != *readonly* ]]
}

# Captures the global Spaceship config state before local overrides are applied.
spaceship::config::capture_baseline() {
  local name declaration

  _SPACESHIP_CONFIG_BASELINE=()

  for name in ${(ok)parameters[(I)SPACESHIP_*]}; do
    spaceship::config::is_managed "$name" || continue

    declaration="$(typeset -p "$name" 2>/dev/null)" || continue
    if [[ "$declaration" != typeset\ -g* ]]; then
      declaration="${declaration/#typeset /typeset -g }"
    fi
    _SPACESHIP_CONFIG_BASELINE[$name]="$declaration"
  done

  _SPACESHIP_PER_DIRECTORY_CONFIG_BASELINE="$SPACESHIP_PER_DIRECTORY_CONFIG"
  _SPACESHIP_PER_DIRECTORY_CONFIG_FILE_BASELINE="$SPACESHIP_PER_DIRECTORY_CONFIG_FILE"
  _SPACESHIP_CONFIG_BASELINE_READY=true
}

# Restores loader controls that local configs are not allowed to persistently
# override. A per-directory config may be sourced as regular Zsh code, but it
# must not mutate the loader's enable flag or lookup filename for future dirs.
spaceship::config::restore_controls() {
  [[ "$_SPACESHIP_CONFIG_BASELINE_READY" == true ]] || return 0

  SPACESHIP_PER_DIRECTORY_CONFIG="$_SPACESHIP_PER_DIRECTORY_CONFIG_BASELINE"
  SPACESHIP_PER_DIRECTORY_CONFIG_FILE="$_SPACESHIP_PER_DIRECTORY_CONFIG_FILE_BASELINE"
}

# Restores the baseline config and removes local-only SPACESHIP_* options.
spaceship::config::restore_baseline() {
  [[ "$_SPACESHIP_CONFIG_BASELINE_READY" == true ]] || return 0

  local name

  for name in ${(ok)parameters[(I)SPACESHIP_*]}; do
    spaceship::config::is_managed "$name" || continue
    (( ${+_SPACESHIP_CONFIG_BASELINE[$name]} )) && continue

    unset "$name" 2>/dev/null
  done

  for name in ${(ok)_SPACESHIP_CONFIG_BASELINE}; do
    eval "${_SPACESHIP_CONFIG_BASELINE[$name]}"
  done

  spaceship::config::restore_controls
}

# Finds trusted-by-opt-in per-directory config files from parent to child.
spaceship::config::find_per_directory_files() {
  local file_name="${SPACESHIP_PER_DIRECTORY_CONFIG_FILE:-.spaceshiprc}"
  local dir="${PWD:A}" previous_dir=""
  local dirs=() candidate global_config=""

  _SPACESHIP_CONFIG_FILES=()

  [[ -n "$file_name" ]] || return 0

  while [[ -n "$dir" && "$dir" != "$previous_dir" ]]; do
    dirs=("$dir" "${dirs[@]}")
    [[ "$dir" == "/" ]] && break

    previous_dir="$dir"
    dir="${dir:h}"
  done

  [[ -n "$SPACESHIP_CONFIG" ]] && global_config="${SPACESHIP_CONFIG:A}"

  for dir in "${dirs[@]}"; do
    candidate="$dir/$file_name"

    [[ -f "$candidate" && -r "$candidate" ]] || continue
    [[ -n "$global_config" && "${candidate:A}" == "$global_config" ]] && continue

    _SPACESHIP_CONFIG_FILES+=("$candidate")
  done
}

# Applies native per-directory config for the current working directory.
spaceship::config::apply_per_directory() {
  # Use the global loader controls before deciding whether local config applies.
  # A previously sourced local config must not affect this decision.
  spaceship::config::restore_controls

  [[ "$SPACESHIP_PER_DIRECTORY_CONFIG" == true ]] || return 0
  [[ "$_SPACESHIP_CONFIG_BASELINE_READY" == true ]] || return 0

  spaceship::config::restore_baseline

  local prompt_order_before="${(pj:|:)SPACESHIP_PROMPT_ORDER}"
  local rprompt_order_before="${(pj:|:)SPACESHIP_RPROMPT_ORDER}"
  local config

  spaceship::config::find_per_directory_files

  for config in "${_SPACESHIP_CONFIG_FILES[@]}"; do
    source "$config"
  done

  # Local configs may assign these names while they run, but the assignments are
  # intentionally scoped out of the persistent shell state.
  spaceship::config::restore_controls

  if [[ "$prompt_order_before" != "${(pj:|:)SPACESHIP_PROMPT_ORDER}" ]] \
  || [[ "$rprompt_order_before" != "${(pj:|:)SPACESHIP_RPROMPT_ORDER}" ]]; then
    spaceship::defined "spaceship::core::load_sections" && spaceship::core::load_sections
  fi
}

# Synchronizes per-directory config after the user's shell startup files finish.
spaceship::config::sync_per_directory() {
  [[ "$_SPACESHIP_CONFIG_BASELINE_READY" == true ]] && return 0

  spaceship::config::capture_baseline
  spaceship::config::apply_per_directory
}
