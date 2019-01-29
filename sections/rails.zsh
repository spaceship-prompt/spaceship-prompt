#
# Ruby on Rails
#
# A web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern.
# Link: https://rubyonrails.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_RAILS_SHOW="${SPACESHIP_RAILS_SHOW=false}"
SPACESHIP_RAILS_PREFIX="${SPACESHIP_RAILS_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RAILS_SUFFIX="${SPACESHIP_RAILS_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RAILS_SYMBOL="${SPACESHIP_RAILS_SYMBOL="🚂 "}"
SPACESHIP_RAILS_DEFAULT_VERSION="${SPACESHIP_RAILS_DEFAULT_VERSION=""}"
SPACESHIP_RAILS_COLOR="${SPACESHIP_RAILS_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of rails, exception system.
spaceship_rails() {
  [[ $SPACESHIP_RAILS_SHOW == false ]] && return

  # Show rails status only for rails projects
  [[ -f bin/rails ]] || return

  local 'rails_version'
  if spaceship::exists rails; then
    rails_version=$(cat Gemfile.lock | grep -E " +rails \([0-9]+" | sed 's/ *rails (\(.*\))/\1/')
  else
    return
  fi

  [[ $rails_version == $SPACESHIP_RAILS_DEFAULT_VERSION ]] && return

  spaceship::section \
    "$SPACESHIP_RAILS_COLOR" \
    "$SPACESHIP_RAILS_PREFIX" \
    "${SPACESHIP_RAILS_SYMBOL}${rails_version}" \
    "$SPACESHIP_RAILS_SUFFIX"
}
