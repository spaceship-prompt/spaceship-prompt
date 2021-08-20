#!/usr/bin/env zsh

_spaceship::cli::print::key_value() {
  local key="$1" value="${@:2}"

  [[ -n "$value" ]] || return

  print -P "%B$key:%b $value"
}

_spaceship::cli::urlencore() {
  python -c 'import urllib, sys; print urllib.quote(sys.argv[1])' "$1"
}

_spaceship::cli::help() {
    cat >&2 <<EOF
Usage: spaceship <command> [options]

Available commands:
  bug-report          Create a GitHub issue with information about your environment
  version             Print Spaceship version
  help                Print this help message
EOF
}

_spaceship::cli::version() {
  echo "$SPACESHIP_VERSION"
}

_spaceship::cli::bug-report() {
  local spaceship_version="$(command git -C $SPACESHIP_ROOT describe --tags)"
  local zsh_version="$ZSH_VERSION"
  local terminal="${TERM_PROGRAM:-"$TERM"}"

  local kernel_name="$(uname -s 2>/dev/null)"
  local kernel_version="$(uname -r 2>/dev/null)"
  local os

  # Get the OS name
  case "$kernel_name" in
    "Linux" | "GNU"* | *"BSD")
      if [[ -f "/etc/os-release" || -f "/usr/lib/os-release" || -f "/etc/openwrt_release" ]]; then
        files=("/etc/os-release" "/usr/lib/os-release" "/etc/openwrt_release")
        for file in "${files[@]}"; do
            source "$file" && break
        done
        os="${PRETTY_NAME:-${DISTRIB_DESCRIPTION}} ${UBUNTU_CODENAME}"
        [[ -z "${os// }" ]] && os="$(awk '/BLAG/ {print $1; exit}')" "${files[@]}"
        [[ -z "${os// }" ]] && os="$(awk -F'=' '{print $2; exit}')"  "${files[@]}"

      elif type -p lsb_release >/dev/null; then
        os="$(lsb_release -sd)"

      else
        for release_file in /etc/*-release; do
          os+="$(< "$release_file")"
        done

        if [[ -z "$os" ]]; then
          os="$kernel_name $kernel_version"
          os="${os/DragonFly/DragonFlyBSD}"
        fi
      fi

      if [[ "$(< /proc/version)" == *"Microsoft"* ||
        "$kernel_version" == *"Microsoft"* ]]; then
        os="Windows 10"
      fi

      os="${os/NAME=}"
    ;;

    "Darwin")
      os="$(sw_vers -productName) $(sw_vers -productVersion)"
    ;;

    "CYGWIN"* | "MSYS"* | "MINGW"*)
      os="$(wmic os get Caption)"
      os="${os/Caption}"
      os="${os/Microsoft }"
    ;;
  esac

  # Check for popular frameworks
  typeset -la frameworks_list

  (( $+ANTIBODY_HOME )) && frameworks_list+=("Antibody")
  (( $+ADOTDIR )) && frameworks_list+=("Antigen")
  (( $+functions[omz] )) && frameworks_list+=("Oh My Zsh")
  (( $+ZPREZTODIR )) && frameworks_list+=("Prezto")
  (( $+ZPLUG_ROOT )) && frameworks_list+=("Zplug")
  (( $+ZGEN_DIR )) && frameworks_list+=("Zgen")
  (( $#frameworks_list == 0 )) && frameworks_list+=("None")

  local frameworks="${(j:, :)frameworks_list}"

  declare -A environment=(
    [spaceship-version]="$spaceship_version"
    [zsh-version]="$zsh_version"
    [os-system]="$os"
    [zsh-framework]="$frameworks"
    [terminal]="$terminal"
  )
  local issue_params=""

  # Print the environment variables and encode url params
  for key value in "${(@kv)environment}"; do
    _spaceship::cli::print::key_value "$key" "$value"
    issue_params+="&$key=$(_spaceship::cli::urlencore "$value")"
  done

  # Form a prefilled issue on GitHub
  local template_url="https://github.com/spaceship-prompt/spaceship-prompt/issues/new?template=bug_report.yml"
  local url="$template_url$issue_params"

  # Make a short URL
  local gitio_response="$(curl --include --silent https://git.io/ --form url="$url")"

  # Extract the short URL
  local short_url="$(
    echo "$gitio_response" \
    | grep "Location: http" \
    | cut -c11- \
    | awk '{print substr($0, 1, length($0) - 1)}' \
  )"

  # A cross-platform attempt to open an URL
  if spaceship::exists xdg-open; then
    xdg-open "$short_url"
  elif spaceship::exists open; then
    open "$short_url"
  elif spaceship::exists python; then
    python -m webbrowser "$short_url"
  fi

  echo
  echo "Take a look at your browser. It should open a GitHub issue with populated data from your configuration."
  echo "If your browser has failed to open, please click this link:"
  echo
  echo "$short_url"
}

# TODO: Add command completions
spaceship() {
  local cmd="$1"

  # Parse CLI options
  zparseopts -D \
    h=help -help=help \
    v=version -version=version

  if [[ -n $help ]]; then
    _spaceship::cli::help "${(@)@:2}"
    return 0
  fi

  if [[ -n "$version" ]]; then
    _spaceship::cli::version "${(@)@:2}"
    return 0
  fi

  # Subcommand functions start with _ so that they don't
  # appear as completion entries when looking for `omz`
  (( $+functions[_spaceship::cli::$cmd] )) || {
    _spaceship::cli::help
    return 1
  }

  _spaceship::cli::$cmd "$@"
}
