#
# Nix-shell
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_NIX_SHELL_SHOW="${SPACESHIP_NIX_SHELL_SHOW=true}"
SPACESHIP_NIX_SHELL_SUFFIX="${SPACESHIP_NIX_SHELL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# NOTE: needs https://github.com/chisui/zsh-nix-shell to show name and packages
# from nix-shell environment

# Heavily inspired by:
# https://gist.github.com/chisui/0d12bd51a5fd8e6bb52e6e6a43d31d5e#file-agnoster-nix-zsh-theme-L201

## nix-shell: currently running nix-shell
spaceship_nix_shell() {
    [[ $SPACESHIP_NIX_SHELL_SHOW == false ]] && return

    if [[ -n "$IN_NIX_SHELL" ]]; then
	if [[ -n $NIX_SHELL_PACKAGES ]]; then
	    local package_names=""
	    local packages=($NIX_SHELL_PACKAGES)
	    for package in $packages; do
		package_names+="${package##*.}"
	    done
	    spaceship::section \
		'yellow' \
		"with " \
		"$package_names" \
		"$SPACESHIP_NIX_SHELL_SUFFIX"
	else
	    local cleanName=${name#interactive-}
	    cleanName=${cleanName%-environment}
	    spaceship::section \
		'yellow' \
		"in " \
		"$cleanName" \
		"$SPACESHIP_NIX_SHELL_SUFFIX"
	fi
    fi
}
