#
# Go
#
# Go is an open source programming language that makes it easy
# to build efficient software.
# Link: https://golang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GOLANG_SHOW="${SPACESHIP_GOLANG_SHOW=true}"
SPACESHIP_GOLANG_ASYNC="${SPACESHIP_GOLANG_ASYNC=true}"
SPACESHIP_GOLANG_PREFIX="${SPACESHIP_GOLANG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_GOLANG_SUFFIX="${SPACESHIP_GOLANG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_GOLANG_SYMBOL="${SPACESHIP_GOLANG_SYMBOL="🐹 "}"
SPACESHIP_GOLANG_COLOR="${SPACESHIP_GOLANG_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_golang() {
  [[ $SPACESHIP_GOLANG_SHOW == false ]] && return

  # If there are Go-specific files in current directory, or current directory is under the GOPATH
  local is_go_project="$(spaceship::upsearch go.mod Godeps glide.yaml Gopkg.toml Gopkg.lock)"
  [[ -n "$is_go_project" || ( $GOPATH && "$PWD/" =~ "$GOPATH/" ) || -n *.go(#qN^/) ]] || return

  spaceship::exists go || return

  # Go version is either the commit hash and date like "devel +5efe9a8f11 Web Jan 9 07:21:16 2019 +0000"
  # at the time of the build or a release tag like "go1.11.4".
  # https://github.com/spaceship-prompt/spaceship-prompt/issues/610
  local go_version=$(go version | awk '{ if ($3 ~ /^devel/) {print $3 ":" substr($4, 2)} else {print "v" substr($3, 3)} }')

  spaceship::section \
    --color "$SPACESHIP_GOLANG_COLOR" \
    --prefix "$SPACESHIP_GOLANG_PREFIX" \
    --suffix "$SPACESHIP_GOLANG_SUFFIX" \
    --symbol "$SPACESHIP_GOLANG_SYMBOL" \
    "$go_version"
}
