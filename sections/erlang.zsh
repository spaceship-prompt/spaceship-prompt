#
# Erlang
#
# Erlang is a general-purpose, concurrent, functional programming language
# and a garbage-collected runtime system.
# Link: https://www.erlang.org/doc/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ERLANG_SHOW="${SPACESHIP_ERLANG_SHOW=true}"
SPACESHIP_ERLANG_ASYNC="${SPACESHIP_ERLANG_ASYNC=true}"
SPACESHIP_ERLANG_PREFIX="${SPACESHIP_ERLANG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_ERLANG_SUFFIX="${SPACESHIP_ERLANG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ERLANG_SYMBOL="${SPACESHIP_ERLANG_SYMBOL="e "}"
SPACESHIP_ERLANG_COLOR="${SPACESHIP_ERLANG_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_erlang() {
  [[ $SPACESHIP_ERLANG_SHOW == false ]] && return

  # Check if erl command is available for execution
  spaceship::exists erl || return

  # Show only within projects
  spaceship::upsearch -s rebar.config erlang.mk || return

  # Extract version from erlang
  local erl_version="$(erl -noshell -eval 'io:fwrite("~s\n", [erlang:system_info(otp_release)]).' -s erlang halt)"

  spaceship::section \
    --color "$SPACESHIP_ERLANG_COLOR" \
    --prefix "$SPACESHIP_ERLANG_PREFIX" \
    --suffix "$SPACESHIP_ERLANG_SUFFIX" \
    --symbol "$SPACESHIP_ERLANG_SYMBOL" \
    "v$erl_version"
}
