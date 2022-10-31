#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# UTILS
# ------------------------------------------------------------------------------

_spaceship::cli::print::key_value() {
  local key="$1" value="${@:2}"

  [[ -n "$value" ]] || return

  print -P "%B$key:%b $value"
}

_spaceship::cli::urlencore() {
  if spaceship::exists python3; then
    python3 -c 'import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))' "$1"
  elif spaceship::exists python2; then
    python2 -c 'import urllib, sys; print(urllib.quote(sys.argv[1]))' "$1"
  else
    python -c 'import urllib.parse, sys; print(urllib.parse.quote(sys.argv[1]))' "$1"
  fi
}

# ------------------------------------------------------------------------------
# COMMANDS
# ------------------------------------------------------------------------------

_spaceship::cli::help() {
  cat >&2 <<EOF
Usage: spaceship <command> [options]

Available commands:
  bug-report          Create a GitHub issue with information about your environment
  edit                Edit Spaceship config
  add                 Add a section to the prompt at specific position
  remove              Remove a section from prompt
  print               Print Spaceship prompt
  version             Print Spaceship version
  help                Print this help message
EOF
}

_spaceship::cli::version() {
  echo "$SPACESHIP_VERSION"
}

_spaceship::cli::edit() {
  if [[ ! -f "$SPACESHIP_CONFIG" ]]; then
    echo "No spaceship config found."
  fi

  "$EDITOR" "$SPACESHIP_CONFIG" && source "$SPACESHIP_CONFIG"
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

      # @formatter:off
      if [[ "$(< /proc/version)" == *"Microsoft"* ||
        "$kernel_version" == *"Microsoft"* ]]; then
        os="Windows 10"
      fi
      # @formatter:on

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

  # A cross-platform attempt to open an URL
  if spaceship::exists xdg-open; then
    xdg-open "$url"
  elif spaceship::exists open; then
    open "$url"
  elif spaceship::exists python; then
    python -m webbrowser "$url"
  fi

  echo
  echo "Take a look at your browser. It should open a GitHub issue with populated data from your configuration."
  echo "If your browser has failed to open, please click this link:"
  echo
  echo "$url"
}

_spaceship::cli::add() {
  # Parse CLI options
  zparseopts -E -D - \
    A:=after_ -after:=after_ \
    B:=before_ -before:=before_ \
    O:=order_ -order:=order_

  local sections=("$@") index
  local after_section="${after_[2]}" before_section="${before_[2]=line_sep}"

  local order_type="${order_[2]=prompt}"
  local order_option="SPACESHIP_${(U)order_type}_ORDER"
  local order=("${(P@)order_option}")
  local new_order=()

  if [[ -n "$before_section" ]]; then
    index="${order[(i)${before_section}]=0}"
    new_order=(
      "${(@)order[0,$((index-1))]}"
      "${sections[@]}"
      "${(@)order[${index},$]}"
    )
  fi

  if [[ -n "$after_section" ]]; then
    index="${order[(i)${after_section}]=0}"
    new_order=(
      "${(@)order[0,${index}]}"
      "${sections[@]}"
      "${(@)order[$((index+1)),$]}"
    )
  fi

  # Modifying order option
  eval "export $order_option=("${new_order[@]}")"
}

_spaceship::cli::remove() {
  # Parse CLI options
  zparseopts -E -D - O:=order_ -order:=order_

  local sections=("$@")
  local order_type="${order_[2]=prompt}"
  local order_option="SPACESHIP_${(U)order_type}_ORDER"

  # Removing all specified sections from order
  for section in "${sections[@]}"; do
    # Modifying order option
    local order=("${(P@)order_option}")
    local new_order=("${(@)order:#${section}}")
    eval "export $order_option=("${new_order[@]}")"
  done
}

_spaceship::cli::print() {
  zparseopts -E -D - P:=prompt_ -prompt:=prompt_

  local prompt_type="${prompt_[2]=prompt}"

  # Modifying orders
  case "$prompt_type" in
    prompt)
      spaceship::prompt
      ;;
    rprompt)
      spaceship::rprompt
      ;;
    ps2)
      spaceship::ps2
      ;;
    *)
      echo "Unknown prompt type: $prompt_type"
      echo "Available types: prompt, rprompt, ps2"
      return 1
      ;;
  esac
}

# ------------------------------------------------------------------------------
# MAIN
# ------------------------------------------------------------------------------

spaceship() {
  # Parse CLI options
  zparseopts -E -D \
    h=help -help=help \
    v=version -version=version

  local cmd="$1"

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

  # Omit the command from arguments
  shift

  # Call the subcommand function
  _spaceship::cli::$cmd "$@"
}

# ------------------------------------------------------------------------------
# COMPLETIONS
# ------------------------------------------------------------------------------

_spaceship() {
  local -a cmds

  cmds=(
    'bug-report:Create a GitHub issue with information about your environment'
    'add:Add a section to the prompt at specific position'
    'edit:Edit Spaceship config'
    'remove:Remove a section from prompt'
    'print:Print Spaceship prompt'
    'version:Print Spaceship version'
    'help:Print this help message'
  )

  if (( CURRENT == 2 )); then
    _describe 'command' cmds
  elif (( CURRENT > 2 )); then
    local -a sections
    for section in ${(kM)functions:#spaceship_*}; do
      sections+=("${section##spaceship_}")
    done

    case "${words[2]}" in
      add)
        local -a subcmds=("${sections[@]}")

        subcmds+=("--order: An order to include the section to")
        subcmds+=("-O: An order to include the section to")

        subcmds+=("--after: A section to insert the section after")
        subcmds+=("-A: A section to insert the section after")

        subcmds+=("--before: A section to insert the section before")
        subcmds+=("-B: A section to insert the section before")

        _describe 'command' subcmds
        ;;
      remove)
        local -a subcmds=("${sections[@]}")

        subcmds+=("--order: An order to include the section to")
        subcmds+=("-O: An order to include the section to")

        _describe 'command' subcmds
        ;;
      print)
        local -a subcmds=()

        subcmds+=("--prompt: A prompt to print")
        subcmds+=("-P: A prompt to print")

        _describe 'command' subcmds
        ;;
    esac
  fi

  return 0
}

if spaceship::exists compdef; then
  compdef _spaceship spaceship
fi
