#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"

  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
}

setUp() {
  echo "" > "${ZDOTDIR:-$HOME}/.zshrc"
  ./scripts/install.sh >/dev/null
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_uninstall_preserve_zshrc_content() {
  local zshrc_content_to_preserve="TEST=TEST"
  echo $zshrc_content_to_preserve >> "${ZDOTDIR:-$HOME}/.zshrc"

  ./scripts/uninstall.sh -y >/dev/null

  zshrc_content=$(<"${ZDOTDIR:-$HOME}/.zshrc")

  assertContains "preserve non spaceship related install config" "$zshrc_content" "$zshrc_content_to_preserve"
}

test_uninstall_remove_spaceship_content_from_zshrc() {
  local spaceship_promt_order_env="SPACESHIP_PROMPT_ORDER=(
    time          # Time stampts section
  )"
  echo $spaceship_promt_order_env >> "${ZDOTDIR:-$HOME}/.zshrc"

  ./scripts/uninstall.sh -y >/dev/null

  zshrc_content=$(<"${ZDOTDIR:-$HOME}/.zshrc")

  assertNotContains "remove spaceship load comment" "$zshrc_content" "# Set Spaceship ZSH as a prompt"
  assertNotContains "remove auto load prompt init" "$zshrc_content" "autoload -U promptinit; promptinit"
  assertNotContains "remove SPACESHIP_PROMPT_ORDER env" "$zshrc_content" "$spaceship_promt_order_env"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source modules/shunit2/shunit2
