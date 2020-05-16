#
# OCaml
#
# OCaml is an industrial strength programming language supporting functional,
# imperative and object-oriented styles
# Link: https://ocaml.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_OCAML_SHOW="${SPACESHIP_OCAML_SHOW=true}"
SPACESHIP_OCAML_PREFIX="${SPACESHIP_OCAML_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_OCAML_SUFFIX="${SPACESHIP_OCAML_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_OCAML_SYMBOL="${SPACESHIP_OCAML_SYMBOL="🐪 "}"
SPACESHIP_OCAML_COLOR="${SPACESHIP_OCAML_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of OCaml
spaceship_ocaml() {
  [[ $SPACESHIP_OCAML_SHOW == false ]] && return

  # Show OCaml status only for OCaml/Reason-specific folders
  [[ -n {dune,dune-project}(#qN^/) || -d esy.lock || -d _opam || -n *.{opam,ml,mli,re,rei}(#qN^/) ]] || return

  local 'ocaml_version'

  if spaceship::exists esy && $(esy true 2>/dev/null); then
    ocaml_version=$(esy ocaml --version 2>/dev/null | cut -d' ' -f5)
  elif spaceship::exists ocaml; then
    ocaml_version=$(ocaml --version 2>/dev/null | cut -d' ' -f5)
  else
    return
  fi

  spaceship::section \
    "$SPACESHIP_OCAML_COLOR" \
    "$SPACESHIP_OCAML_PREFIX" \
    "${SPACESHIP_OCAML_SYMBOL}${ocaml_version}" \
    "$SPACESHIP_OCAML_SUFFIX"
}
