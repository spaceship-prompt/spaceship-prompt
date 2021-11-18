#
# OCaml

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_OCAML_SHOW="${SPACESHIP_OCAML_SHOW=true}"
SPACESHIP_OCAML_PREFIX="${SPACESHIP_OCAML_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_OCAML_SUFFIX="${SPACESHIP_OCAML_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_OCAML_SYMBOL="${SPACESHIP_OCAML_SYMBOL="🐫  "}"
SPACESHIP_OCAML_COLOR="${SPACESHIP_OCAML_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of ocaml
spaceship_ocaml() {
  [[ $SPACESHIP_OCAML_SHOW == false ]] && return

  # Show versions only for ocaml-specific folders
  [[ -f dune || \
     -f dune-project || \
     -f .merlin || \
     -f esy.lock || \
     -n *.{opam,ml,mli,re,rei}(#qN^/)
  ]] || return

  local 'ocaml_version'

  if spaceship::exists opam; then
    ocaml_version=$(opam switch show 2>/dev/null)
  fi

  if [[ -z "$ocaml_version" ]] && spaceship::exists esy; then
    ocaml_version=$(esy ocaml -vnum 2>/dev/null)
  fi

  if [[ -z "$ocaml_version" ]] && spaceship::exists ocaml; then
    ocaml_version=$(ocaml -vnum)
  fi

  [[ -z $ocaml_version || "${ocaml_version}" == "system" ]] && return

  spaceship::section \
    "$SPACESHIP_OCAML_COLOR" \
    "$SPACESHIP_OCAML_PREFIX" \
    "${SPACESHIP_OCAML_SYMBOL}${ocaml_version}" \
    "$SPACESHIP_OCAML_SUFFIX"
}
