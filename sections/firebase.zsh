# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
SPACESHIP_FIREBASE_SHOW="${SPACESHIP_FIREBASE_SHOW=true}"
SPACESHIP_FIREBASE_PREFIX="${SPACESHIP_FIREBASE_PREFIX="FB project: "}"
SPACESHIP_FIREBASE_SYMBOL="${SPACESHIP_FIREBASE_SYMBOL="🔥 "}"
SPACESHIP_FIREBASE_COLOR="${SPACESHIP_FIREBASE_COLOR="#d75f00"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows active Firebase Project
spaceship_firebase() {

  # wheather to show this section
  [[ $SPACESHIP_FIREBASE_SHOW == false ]] && return

  # check if firebase-tools cli is installed
  spaceship::exists firebase || return

  # firebase-cli creates this config file with all the settings
  local file=~/.config/configstore/firebase-tools.json
  if [ ! -f "$file" ]; then
    return
  fi
  local currentDir=$(pwd)
  # big thanks to https://github.com/jozefcipa/zsh-firebase-prompt for the actual implementation
  current_project=$(
    cat $file |
      jq --arg currentDir $currentDir '
        [
            .activeProjects
            | to_entries[]
            | .key as $key
            | select($currentDir | startswith($key))
        ] | [
            sort_by(.key | length)
            | reverse[]
        ] | .[0].value'
  )

  if [ "$current_project" != "null" ]; then
    # remove the quotations
    current_project=$(echo $current_project | awk '{gsub(/[\"]/, "", $1)} {print $1" "}')

    spaceship::section \
      --color "$SPACESHIP_FIREBASE_COLOR" \
      --prefix "$SPACESHIP_FIREBASE_PREFIX" \
      "${SPACESHIP_FIREBASE_SYMBOL}${current_project}"
  fi
}
