#
# Ruby
#
# A dynamic, reflective, object-oriented, general-purpose programming language.
# Link: https://www.ruby-lang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_RUBY_SHOW="${SPACESHIP_RUBY_SHOW=true}"
SPACESHIP_RUBY_ASYNC="${SPACESHIP_RUBY_ASYNC=true}"
SPACESHIP_RUBY_PREFIX="${SPACESHIP_RUBY_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RUBY_SUFFIX="${SPACESHIP_RUBY_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RUBY_SYMBOL="${SPACESHIP_RUBY_SYMBOL="💎 "}"
SPACESHIP_RUBY_COLOR="${SPACESHIP_RUBY_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Ruby
spaceship_ruby() {
  [[ $SPACESHIP_RUBY_SHOW == false ]] && return

  # Show versions only for Ruby-specific folders
  local is_ruby_project="$(spaceship::upsearch Gemfile Rakefile)"
  [[ -n "$is_ruby_project" || -n *.rb(#qN^/) ]] || return

  local ruby_version

  if spaceship::exists rvm-prompt; then
    ruby_version=$(rvm-prompt i v g)
  elif spaceship::exists chruby; then
    ruby_version=$(chruby | sed -n -e 's/ \* //p')
  elif spaceship::exists rbenv; then
    ruby_version=$(rbenv version-name)
  elif spaceship::exists asdf; then
    # split output on space and return second element
    ruby_version=${$(asdf current ruby)[2]}
  else
    return
  fi

  [[ -z $ruby_version || "${ruby_version}" == "system" ]] && return

  # Add 'v' before ruby version that starts with a number
  [[ "${ruby_version}" =~ ^[0-9].+$ ]] && ruby_version="v${ruby_version}"

  spaceship::section \
    --color "$SPACESHIP_RUBY_COLOR" \
    --prefix "$SPACESHIP_RUBY_PREFIX" \
    --suffix "$SPACESHIP_RUBY_SUFFIX" \
    --symbol "$SPACESHIP_RUBY_SYMBOL" \
    "$ruby_version"
}
