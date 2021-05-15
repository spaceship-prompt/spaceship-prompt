#
# .NET
#
# .NET Framework is a software framework developed by Microsoft.
# It includes a large class library and provides language interoperability
# across several programming languages.
# Link: https://www.microsoft.com/net

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DOTNET_SHOW="${SPACESHIP_DOTNET_SHOW=true}"
SPACESHIP_DOTNET_PREFIX="${SPACESHIP_DOTNET_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_DOTNET_SUFFIX="${SPACESHIP_DOTNET_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
if [[ $SPACESHIP_PROMPT_SYMBOLS_SHOW == true ]]; then
	SPACESHIP_DOTNET_SYMBOL="${SPACESHIP_DOTNET_SYMBOL=".NET "}"
fi
SPACESHIP_DOTNET_COLOR="${SPACESHIP_DOTNET_COLOR="128"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of .NET SDK
spaceship_dotnet() {
  [[ $SPACESHIP_DOTNET_SHOW == false ]] && return

  [[ -f project.json || -f global.json || -f paket.dependencies || -n *.(cs|fs|x)proj(#qN^/) || -n *.sln(#qN^/) ]] || return

  spaceship::exists dotnet || return

  # dotnet-cli automatically handles SDK pinning (specified in a global.json file)
  # therefore, this already returns the expected version for the current directory
  local dotnet_version=$(dotnet --version 2>/dev/null)

  spaceship::section \
    "$SPACESHIP_DOTNET_COLOR" \
    "$SPACESHIP_DOTNET_PREFIX" \
    "${SPACESHIP_DOTNET_SYMBOL}${dotnet_version}" \
    "$SPACESHIP_DOTNET_SUFFIX"
}
