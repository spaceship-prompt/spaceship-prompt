#!/usr/bin/env zsh

get_os() {
    # $kernel_name is set in a function called cache_uname and is
    # just the output of "uname -s".
    case "$kernel_name" in
        "Darwin"):   "$darwin_name" ;;
        "SunOS"):    "Solaris" ;;
        "Haiku"):    "Haiku" ;;
        "MINIX"):    "MINIX" ;;
        "AIX"):      "AIX" ;;
        "IRIX"*):    "IRIX" ;;
        "FreeMiNT"): "FreeMiNT" ;;
        "Linux" | "GNU"*):  "Linux" ;;
        *"BSD" | "DragonFly" | "Bitrig"):"BSD" ;;
        "CYGWIN"* | "MSYS"* | "MINGW"*):"Windows" ;;
        *):"$kernel_name" ;;
    esac
    os="$_"
    print "${os}"
}

get_shell() {
    shell="${SHELL##*/} "

    case "${shell_name:=${SHELL##*/}}" in
        "zsh") shell+="${ZSH_VERSION}" ;;
        "bash") shell+="${BASH_VERSION/-*}" ;;
        "sh" | "ash" | "dash") ;;

        "mksh" | "ksh")
            shell+="$("$SHELL" -c "printf %s \"\$KSH_VERSION\"")"
            shell="${shell/ * KSH}"
            shell="${shell/version}"
        ;;

        "tcsh")
            shell+="$("$SHELL" -c "printf %s \$tcsh")"
        ;;

        *)
            shell+="$("$SHELL" --version 2>&1)"
            shell="${shell/ "${shell_name}"}"
        ;;
    esac

    # Remove unwanted info.
    shell="${shell/, version}"
    shell="${shell/xonsh\//xonsh }"
    shell="${shell/options*}"
    shell="${shell/\(*\)}"

    print "${shell}"
}

cache_uname() {
    # Cache the output of uname so we don't
    # have to spawn it multiple times.
    IFS=" " read -r uname <<< "$(uname -srm)"

    kernel_name="${uname[0]}"
    kernel_version="${uname[1]}"
    kernel_machine="${uname[2]}"

    if [[ "$kernel_name" == "Darwin" ]]; then
        IFS=$'\n' read -d "" -r sw_vers < <(awk -F'<|>' '/string/ {print $3}' \
                            "/System/Library/CoreServices/SystemVersion.plist")
        darwin_name="${sw_vers[2]}"
        osx_version="${sw_vers[3]}"
        osx_build="${sw_vers[0]}"
    fi
}

main() {
  cache_uname
  get_os
  get_shell
}

main "$@"
