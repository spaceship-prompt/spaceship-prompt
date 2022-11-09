#
# Perl
#
# Perl is a general purpose programming language, originally developed for
# text manipulation.
# Perl refers to Perl 5.x, where Perl 6+ officially changed the name to Raku.
#
# Link: https://www.perl.org/
# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_PERL_SHOW="${SPACESHIP_PERL_SHOW=true}"
SPACESHIP_PERL_ASYNC="${SPACESHIP_PHP_ASYNC=true}"
SPACESHIP_PERL_PREFIX="${SPACESHIP_PERL_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_PERL_SUFFIX="${SPACESHIP_PERL_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_PERL_SYMBOL="${SPACESHIP_PERL_SYMBOL="🐪 "}"
SPACESHIP_PERL_COLOR="${SPACESHIP_PERL_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of Perl
spaceship_perl() {
  [[ $SPACESHIP_PERL_SHOW == false ]] && return

  spaceship::exists perl || return

  # Show only if perl files or composer.json exist in current directory
  local is_perl_project="$(spaceship::upsearch META.{json,yml,yaml} .perl-version cpanfile)"
  [[ -n "$is_perl_project" || -n *.pl(#qN^/) || -n *.pm(#qN^/)  ]] || return

  local perl_version=$(perl -v 2>&1 | awk '/This/ {print $9}' | sed -r 's/[(v]+//g;s/[)]//g')

  spaceship::section \
    --color "$SPACESHIP_PERL_COLOR" \
    --prefix "$SPACESHIP_PERL_PREFIX" \
    --suffix "$SPACESHIP_PERL_SUFFIX" \
    --symbol "$SPACESHIP_PERL_SYMBOL" \
    "v$perl_version"

}
