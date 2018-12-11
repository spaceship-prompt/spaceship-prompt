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

  [[ -n $content ]] || return

  echo "$bold$title:$reset $content"
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

# ------------------------------------------------------------------------------
# DETECT INFORMATION
# ------------------------------------------------------------------------------

get_os() {
      case "$kernel_name" in
        "Linux" | "GNU"* | *"BSD")
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
                fi
            fi

            if [[ "$(< /proc/version)" == *"Microsoft"* ||
              "$kernel_version" == *"Microsoft"* ]]; then
              distro="Windows 10"

            elif [[ "$(< /proc/version)" == *"chrome-bot"* || -f "/dev/cros_ec" ]]; then
              distro="Chrome OS"
            fi

            distro="$distro"
            distro="${distro/NAME=}"
        ;;

        "Darwin")
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

        "CYGWIN"* | "MSYS"* | "MINGW"*)
            distro="$(wmic os get Caption)"
            distro="${distro/Caption}"
            distro="${distro/Microsoft }"
        ;;
    esac

    paint "Operating System" $distro
}

main() {
  cache_uname
  paint "Spaceship" $(command git -C $SPACESHIP_ROOT describe --tags)
  paint "Shell" $ZSH_VERSION
  get_os
}

main "$@"
