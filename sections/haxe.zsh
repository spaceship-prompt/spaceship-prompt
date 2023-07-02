#
# Haxe
#
# Haxe is an open source high-level strictly-typed programming language with a fast optimizing cross-compiler.
# Link: https://haxe.org


SPACESHIP_HAXE_SHOW="${SPACESHIP_HAXE_SHOW=true}"
SPACESHIP_HAXE_PREFIX="${SPACESHIP_HAXE_PREFIX="with "}"
SPACESHIP_HAXE_SUFFIX="${SPACESHIP_HAXE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_HAXE_SYMBOL="${SPACESHIP_HAXE_SYMBOL="⌘ "}" # couldn't find unicode colored char for haxe
SPACESHIP_HAXE_COLOR="166" # haxe's orange color
SPACESHIP_HAXE_VERBOSE="${SPACESHIP_HAXE_VERBOSE=false}"



spaceship_haxe() {
  [[ $SPACESHIP_HAXE_SHOW == false ]] && return

  # Check if haxe binary exists
  spaceship::exists haxe || return

  #Detect haxe project
  local haxe_project_globs=('project.xml','Project.xml','application.xml','haxelib.json','hxformat.json','.haxerc')
  local is_haxe_project="$(spaceship::upsearch $haxe_project_globs)"
  [[ -n $is_haxe_project || -n *.(hxml|hx)(#qN^/) ]] || return

  # Extract haxe cersion
  local haxe_version="$(haxe --version 2>/dev/null)"

  # Check if haxe verdion is empty
  [[ $? -ne 0 || -z $haxe_version ]] && return

  [[ $SPACESHIP_HAXE_VERBOSE == false ]] && haxe_version=${haxe_version%-*}

  spaceship::section \
    --color  "$SPACESHIP_HAXE_COLOR" \
    --prefix "$SPACESHIP_HAXE_PREFIX" \
    --suffix "$SPACESHIP_HAXE_SUFFIX" \
    --symbol "$SPACESHIP_HAXE_SYMBOL" \
    "$haxe_version"
}