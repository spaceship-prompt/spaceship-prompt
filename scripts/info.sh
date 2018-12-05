#!/usr/bin/env zsh

# Script to report spaceship user environment for issue report.
#
# https://github.com/denysdovhan/spaceship-prompt
#
# Most of the code is from
#   Neofetch: A command-line system information tool
#   https://github.com/dylanaraps/neofetch
#
#   The MIT License (MIT)
#   Copyright (c) 2016-2018 Dylan Araps
#
# Tweaks made to focus on Zsh setup

# ------------------------------------------------------------------------------
# Colors
# Set color variables for colorful output
# ------------------------------------------------------------------------------

# If we have tput, let's set colors
if [[ ! -z $(which tput 2> /dev/null) ]]; then
  reset=$(tput sgr0)
  bold=$(tput bold)
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  blue=$(tput setaf 4)
  magenta=$(tput setaf 5)
  cyan=$(tput setaf 6)
fi

# ------------------------------------------------------------------------------
# HELPERS
# Useful functions for common tasks
# ------------------------------------------------------------------------------

# Paint text in specific color with reset
# USAGE:
#   paint <title> [text...]
paint() {
  local title=$1 content=${@:2}
  echo "$bold$title:$reset $content"
}

trim() {
    set -f
    # shellcheck disable=2048,2086
    set -- $*
    printf '%s\n' "${*//[[:space:]]/}"
    set +f
}

trim_quotes() {
    trim_output="${1//\'}"
    trim_output="${trim_output//\"}"
    printf "%s" "$trim_output"
}

cache_uname() {
  kernel_name="$(uname -s 2>/dev/null)"
  kernal_version="$(uname -r 2>/dev/null)"
  kernel_machine="$(uname -m 2>/dev/null)"

  if [[ "$kernel_name" == "Darwin" ]]; then
      IFS=$'\n' read -d "" -r sw_vers < <(awk -F'<|>' '/string/ {print $3}' \
                          "/System/Library/CoreServices/SystemVersion.plist")
      darwin_name="${sw_vers[2]}"
      osx_version="${sw_vers[3]}"
      osx_build="${sw_vers[0]}"
  fi
}

get_ppid() {
    # Get parent process ID of PID.
    case "$os" in
        "Windows")
            ppid="$(ps -p "${1:-$PPID}" | awk '{printf $2}')"
            ppid="${ppid/PPID}"
        ;;

        "Linux")
            ppid="$(grep -i -F "PPid:" "/proc/${1:-$PPID}/status")"
            ppid="$(trim "${ppid/PPid:}")"
        ;;

        *)
            ppid="$(ps -p "${1:-$PPID}" -o ppid=)"
        ;;
    esac

    printf "%s" "$ppid"
}

get_process_name() {
    # Get PID name.
    case "$os" in
        "Windows")
            name="$(ps -p "${1:-$PPID}" | awk '{printf $8}')"
            name="${name/COMMAND}"
            name="${name/*\/}"
        ;;

        "Linux")
            name="$(< "/proc/${1:-$PPID}/comm")"
        ;;

        *)
            name="$(ps -p "${1:-$PPID}" -o comm=)"
        ;;
    esac

    printf "%s" "$name"
}

# ------------------------------------------------------------------------------
# DETECT INFORMATION
# ------------------------------------------------------------------------------

get_os() {
    # $kernel_name is set in a function called cache_uname and is
    # just the output of "uname -s".
    case "$kernel_name" in
        "Darwin")
            os="$darwin_name" ;;
        "Linux" | "GNU"*)
            os="Linux" ;;
        "CYGWIN"* | "MSYS"* | "MINGW"*)
            os="Windows" ;;
        "SunOS")
            os="Solaris" ;;
        "Haiku")
            os="Haiku" ;;
        "MINIX")
            os="MINIX" ;;
        "AIX")
            os="AIX" ;;
        "IRIX"*)
            os="IRIX" ;;
        "FreeMiNT")
            os="FreeMiNT" ;;
        *"BSD" | "DragonFly" | "Bitrig")
            os="BSD" ;;
    esac
}

get_distro() {
      case "$os" in
        "Linux" | "BSD" | "MINIX")
            if [[ -f "/etc/os-release" || -f "/usr/lib/os-release" || -f "/etc/openwrt_release" ]]; then
              files=("/etc/os-release" "/usr/lib/os-release" "/etc/openwrt_release")
              # Source the os-release file
              for file in "${files[@]}"; do
                  source "$file" && break
              done
              distro="${PRETTY_NAME:-${DISTRIB_DESCRIPTION}} ${UBUNTU_CODENAME}"
              # Workarounds for distros that go against the os-release standard.
              [[ -z "${distro// }" ]] && distro="$(awk '/BLAG/ {print $1; exit}')" "${files[@]}"
              [[ -z "${distro// }" ]] && distro="$(awk -F'=' '{print $2; exit}')"  "${files[@]}"

            # Chrome OS doesn't conform to the /etc/*-release standard.
            # While the file is a series of variables they can't be sourced
            # by the shell since the values aren't quoted.
            elif [[ -f /etc/lsb-release && "$(< /etc/lsb-release)" == *CHROMEOS* ]]; then
              distro="$(awk -F '=' '/NAME|VERSION/ {printf $2 " "}' /etc/lsb-release)"

            elif type -p lsb_release >/dev/null; then
              distro="$(lsb_release -sd)"

            elif [[ -d "/system/app/" && -d "/system/priv-app" ]]; then
              distro="Android $(getprop ro.build.version.release)"

            else
                for release_file in /etc/*-release; do
                    distro+="$(< "$release_file")"
                done

                if [[ -z "$distro" ]]; then
                  distro="$kernel_name $kernel_version"
                  distro="${distro/DragonFly/DragonFlyBSD}"

                  # Workarounds for FreeBSD based distros.
                  [[ -f "/etc/pcbsd-lang" ]] && distro="PCBSD"
                  [[ -f "/etc/trueos-lang" ]] && distro="TrueOS"

                  # /etc/pacbsd-release is an empty file
                  [[ -f "/etc/pacbsd-release" ]] && distro="PacBSD"
                fi
            fi

            if [[ "$(< /proc/version)" == *"Microsoft"* ||
              "$kernel_version" == *"Microsoft"* ]]; then
              distro="Windows 10"

            elif [[ "$(< /proc/version)" == *"chrome-bot"* || -f "/dev/cros_ec" ]]; then
              distro="Chrome OS"
            fi

            distro="$(trim_quotes "$distro")"
            distro="${distro/NAME=}"
        ;;

        "Mac OS X")
            case "$osx_version" in
                "10.4"*)  codename="Mac OS X Tiger" ;;
                "10.5"*)  codename="Mac OS X Leopard" ;;
                "10.6"*)  codename="Mac OS X Snow Leopard" ;;
                "10.7"*)  codename="Mac OS X Lion" ;;
                "10.8"*)  codename="OS X Mountain Lion" ;;
                "10.9"*)  codename="OS X Mavericks" ;;
                "10.10"*) codename="OS X Yosemite" ;;
                "10.11"*) codename="OS X El Capitan" ;;
                "10.12"*) codename="macOS Sierra" ;;
                "10.13"*) codename="macOS High Sierra" ;;
                "10.14"*) codename="macOS Mojave" ;;
                *)        codename="macOS" ;;
            esac
            distro="$codename $osx_version $osx_build"
        ;;

        "Windows")
            distro="$(wmic os get Caption)"
            distro="${distro/Caption}"
            distro="${distro/Microsoft }"
        ;;

        "Solaris")
            distro="$(awk 'NR==1{print $1 " " $2 " " $3;}' /etc/release)"
            distro="${distro/\(*}"
        ;;

        "Haiku")
            read -r name version _ < <(uname -sv)
            distro="$name $version"
        ;;

        "AIX")
            distro="AIX $(oslevel)"
        ;;

        "IRIX")
            distro="IRIX ${kernel_version}"
        ;;

        "FreeMiNT")
            distro="FreeMiNT"
        ;;

        "iPhone OS")
            distro="iOS $osx_version"
        ;;
    esac

    [[ -n $distro ]] && paint "Operating System" $distro || return
}

get_shell() {
   [[ -n $ZSH_VERSION ]] && paint "Shell" $ZSH_VERSION || return
}

get_zsh_framework() {
  ### List of most popular Zsh frameworks

  # Oh My Zsh 80K https://github.com/robbyrussell/oh-my-zsh
  # Prezto 10K https://github.com/sorin-ionescu/prezto
  # Antigen 4.6K https://github.com/zsh-users/antigen
  # zplug 2.8K https://github.com/zplug/zplug
  # zimfw 1.2K https://github.com/zimfw/zimfw
  # zgen 1K https://github.com/tarjoilija/zgen
  # Antibody 800 https://github.com/getantibody/antibody
  # None

  case "$shell" in
    "zsh"*)
      if [[ -n $ZSH ]]; then
        framework="Oh My Zsh"
      elif [[ -n $ZPREZTODIR ]]; then
        framework="Prezto"
        # todo: Get prezto commit head
      elif [[ -n $ADOTDIR ]]; then
        framework="Antigen"
      elif [[ -n $ZPLUG_ROOT ]]; then
        framework="zplug"
      elif [[ -n $ZIM_HOME ]]; then
        framework="Zim"
      elif [[ -n $ZGEN_DIR ]]; then
        framework="zgen"
      elif [[ -n $ANTIBODY_HOME ]]; then
        framework="Antibody"
      else
        framework="None/Others"
      fi

      paint "Zsh Framework" $framework
    ;;
    *)
      echo "$red Incompatible Shell$reset"
    esac
}

get_spaceship() {
  [[ -n $SPACESHIP_VERSION ]] && paint "Spaceship" $SPACESHIP_VERSION || return
}

get_term() {
    # If function was run, stop here.
    ((term_run == 1)) && return

    # Workaround for macOS systems that
    # don't support the block below.
    case "$TERM_PROGRAM" in
        "iTerm.app")    term="iTerm2" ;;
        "Terminal.app") term="Apple Terminal" ;;
        "Hyper")        term="HyperTerm" ;;
        *)              term="${TERM_PROGRAM/\.app}" ;;
    esac

    # Most likely TosWin2 on FreeMiNT - quick check
    [[ "$TERM" == "tw52" || "$TERM" == "tw100" ]] && \
        term="TosWin2"

    [[ "$SSH_CONNECTION" ]] && \
        term="$SSH_TTY"

    # Check $PPID for terminal emulator.
    while [[ -z "$term" ]]; do
        parent="$(get_ppid "$parent")"
        [[ -z "$parent" ]] && break
        name="$(get_process_name "$parent")"

        case "${name// }" in
            "${SHELL/*\/}"|*"sh"|"screen"|"su"*) ;;

            "login"*|*"Login"*|"init"|"(init)")
                term="$(tty)"
            ;;

            "ruby"|"1"|"tmux"*|"systemd"|"sshd"*|"python"*|"USER"*"PID"*|"kdeinit"*|"launchd"*)
                break
            ;;

            "gnome-terminal-") term="gnome-terminal" ;;
            "urxvtd")          term="urxvt" ;;
            *"nvim")           term="Neovim Terminal" ;;
            *"NeoVimServer"*)  term="VimR Terminal" ;;
            *)                 term="${name##*/}" ;;
        esac
    done

    # Log that the function was run.
    term_run=1

    [[ -n $term ]] && paint "Terminal" $term || return
}

main() {
  cache_uname
  get_spaceship
  get_shell
  get_zsh_framework
  get_os
  get_distro
  get_term
}

main "$@"
