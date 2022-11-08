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
SPACESHIP_OCAML_ASYNC="${SPACESHIP_OCAML_ASYNC=true}"
SPACESHIP_OCAML_PREFIX="${SPACESHIP_OCAML_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_OCAML_SUFFIX="${SPACESHIP_OCAML_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_OCAML_SYMBOL="${SPACESHIP_OCAML_SYMBOL="🐫 "}"
SPACESHIP_OCAML_COLOR="${SPACESHIP_OCAML_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of OCaml
spaceship_ocaml() {
  [[ $SPACESHIP_OCAML_SHOW == false ]] && return

  # Show OCaml status only for OCaml/Reason-specific folders
  local is_ocaml_project="$(spaceship::upsearch esy.lock _opam dune dune-project jbuild jbuild-ignore .merlin)"
  [[ -n "$is_ocaml_project" || -n *.opam(#qN^/) || -n *.{ml,mli,re,rei}(#qN^/) ]] || return

  local ocaml_version

  if spaceship::exists esy && $(esy true 2>/dev/null); then
    ocaml_version=$(esy ocaml -vnum 2>/dev/null)
  elif spaceship::exists opam; then
    ocaml_version=$(opam switch show 2>/dev/null)
  elif spaceship::exists ocaml; then
    ocaml_version=$(ocaml -vnum)
  else
    return
  fi

  # Exit if the version is empty or system
  [[ -z "$ocaml_version" || "$ocaml_version" == "system" ]] && return

  # Add 'v' before OCaml version that starts with a number
  [[ "$ocaml_version" =~ ^[0-9].+$ ]] && ocaml_version="v$ocaml_version"

  spaceship::section \
    --color "$SPACESHIP_OCAML_COLOR" \
    --prefix "$SPACESHIP_OCAML_PREFIX" \
    --suffix "$SPACESHIP_OCAML_SUFFIX" \
    --symbol "$SPACESHIP_OCAML_SYMBOL" \
    "$ocaml_version"
}
