#!/bin/zsh +f

# Script to report spaceship user environment for issue report.
#
# https://github.com/denysdovhan/spaceship-prompt
#

if [[ ! -z $(which tput 2> /dev/null) ]]; then
  reset=$(tput sgr0)
  bold=$(tput bold)
fi

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

  if [[ "$kernel_name" == "Darwin" ]]; then
      IFS=$'\n' read -d "" -r sw_vers < <(awk -F'<|>' '/string/ {print $3}' \
                          "/System/Library/CoreServices/SystemVersion.plist")
      osx_version="${sw_vers[3]}"
  fi
}

get_os() {
      case "$kernel_name" in
        "Linux" | "GNU"* | *"BSD")
            if [[ -f "/etc/os-release" || -f "/usr/lib/os-release" || -f "/etc/openwrt_release" ]]; then
              files=("/etc/os-release" "/usr/lib/os-release" "/etc/openwrt_release")
              for file in "${files[@]}"; do
                  source "$file" && break
              done
              distro="${PRETTY_NAME:-${DISTRIB_DESCRIPTION}} ${UBUNTU_CODENAME}"
              [[ -z "${distro// }" ]] && distro="$(awk '/BLAG/ {print $1; exit}')" "${files[@]}"
              [[ -z "${distro// }" ]] && distro="$(awk -F'=' '{print $2; exit}')"  "${files[@]}"

            elif type -p lsb_release >/dev/null; then
              distro="$(lsb_release -sd)"

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
            fi

            distro="$distro"
            distro="${distro/NAME=}"
        ;;

        "Darwin")
            case "$osx_version" in
                "10.12"*) codename="macOS Sierra" ;;
                "10.13"*) codename="macOS High Sierra" ;;
                "10.14"*) codename="macOS Mojave" ;;
                *)        codename="macOS" ;;
            esac
            distro="$codename $osx_version"
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
  paint "Zsh" $ZSH_VERSION
  get_os
}

main "$@"
