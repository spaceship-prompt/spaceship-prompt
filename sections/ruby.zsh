#
# Ruby
#
# A dynamic, reflective, object-oriented, general-purpose programming language.
# Link: https://www.ruby-lang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_RUBY_SHOW="${SPACESHIP_RUBY_SHOW:=true}"
SPACESHIP_RUBY_PREFIX="${SPACESHIP_RUBY_PREFIX:="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_RUBY_SUFFIX="${SPACESHIP_RUBY_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_RUBY_SYMBOL="${SPACESHIP_RUBY_SYMBOL:="💎 "}"
SPACESHIP_RUBY_COLOR="${SPACESHIP_RUBY_COLOR:="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Ruby
spaceship_ruby() {
  [[ $SPACESHIP_RUBY_SHOW == false ]] && return

  # Show versions only for Ruby-specific folders
  [[ -f Gemfile || -f Rakefile || -n *.rb(#qN^/) ]] || return

  local ruby_version

  if _exists rvm-prompt; then
    ruby_version=$(rvm-prompt i v g)
  elif _exists chruby; then
    ruby_version=$(chruby | sed -n -e 's/ \* //p')
  elif _exists rbenv; then
    ruby_version=$(rbenv version-name)
  elif _exists asdf; then
    ruby_version=$(asdf current ruby | sed 's/ .*$//')
  else
    return
  fi

  [[ -z $ruby_version || "${ruby_version}" == "system" ]] && return

  # Add 'v' before ruby version that starts with a number
  [[ "${ruby_version}" =~ ^[0-9].+$ ]] && ruby_version="v${ruby_version}"

  _prompt_section \
    "$SPACESHIP_RUBY_COLOR" \
    "$SPACESHIP_RUBY_PREFIX" \
    "${SPACESHIP_RUBY_SYMBOL}${ruby_version}" \
    "$SPACESHIP_RUBY_SUFFIX"
}
