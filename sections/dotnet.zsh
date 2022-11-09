#
# .NET
#
# .NET Framework is a software framework developed by Microsoft.
# It includes a large class library and provides language interoperability
# across several programming languages.
# Link: https://dotnet.microsoft.com

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DOTNET_SHOW="${SPACESHIP_DOTNET_SHOW=true}"
SPACESHIP_DOTNET_ASYNC="${SPACESHIP_DOTNET_ASYNC=true}"
SPACESHIP_DOTNET_PREFIX="${SPACESHIP_DOTNET_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_DOTNET_SUFFIX="${SPACESHIP_DOTNET_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DOTNET_SYMBOL="${SPACESHIP_DOTNET_SYMBOL=".NET "}"
SPACESHIP_DOTNET_COLOR="${SPACESHIP_DOTNET_COLOR="128"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of .NET SDK
spaceship_dotnet() {
  [[ $SPACESHIP_DOTNET_SHOW == false ]] && return

  local is_dotnet_project="$(spaceship::upsearch project.json global.json paket.dependencies)"
  [[ -n "$is_dotnet_project" || -n *.(cs|fs|x)proj(#qN^/) || -n *.sln(#qN^/) ]] || return

  spaceship::exists dotnet || return

  # dotnet-cli automatically handles SDK pinning (specified in a global.json file)
  # therefore, this already returns the expected version for the current directory
  local dotnet_version # separate declaration so we have access to the exit code
  dotnet_version=$(dotnet --version 2>/dev/null)

  # `dotnet --version` exits with a non-zero exit code
  # when the version defined in global.json is not installed.
  [[ $? -eq 0 ]] || return

  spaceship::section \
    --color "$SPACESHIP_DOTNET_COLOR" \
    --prefix "$SPACESHIP_DOTNET_PREFIX" \
    --suffix "$SPACESHIP_DOTNET_SUFFIX" \
    --symbol "$SPACESHIP_DOTNET_SYMBOL" \
    "$dotnet_version"
}
