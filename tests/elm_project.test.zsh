#!/usr/bin/env zsh

# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

oneTimeSetUp() {
  export TERM="xterm-256color"
  export PATH=$PWD/tests/stubs:$PATH
  export SPACESHIP_MOCK_ELM_VERSION="0.19.0"

  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(elm_project)

  source spaceship.zsh
}

setUp() {
  SPACESHIP_ELM_PROJECT_SHOW=true

  SPACESHIP_ELM_PROJECT_PACKAGE_SHOW=true
  SPACESHIP_ELM_PROJECT_PACKAGE_PREFIX='is '
  SPACESHIP_ELM_PROJECT_PACKAGE_SYMBOL='📦 '
  SPACESHIP_ELM_PROJECT_PACKAGE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
  SPACESHIP_ELM_PROJECT_PACKAGE_COLOR='blue'

  SPACESHIP_ELM_PROJECT_APPLICATION_SHOW=true
  SPACESHIP_ELM_PROJECT_APPLICATION_PREFIX='is '
  SPACESHIP_ELM_PROJECT_APPLICATION_SYMBOL='🖥️ '
  SPACESHIP_ELM_PROJECT_APPLICATION_TEXT='App'
  SPACESHIP_ELM_PROJECT_APPLICATION_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
  SPACESHIP_ELM_PROJECT_APPLICATION_COLOR='cyan'

  SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW='mismatch'
  SPACESHIP_ELM_PROJECT_ELM_VERSION_PREFIX=' ('
  SPACESHIP_ELM_PROJECT_ELM_VERSION_SUFFIX=')'
  SPACESHIP_ELM_PROJECT_ELM_VERSION_COLOR='yellow'

  cd $SHUNIT_TMPDIR
  cat << 'EOF' > elm.json
{
  "type": "application",
  "elm-version": "0.19.0"
}
EOF
}

oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

tearDown() {
  unset SPACESHIP_ELM_PROJECT_SHOW

  unset SPACESHIP_ELM_PROJECT_PACKAGE_SHOW
  unset SPACESHIP_ELM_PROJECT_PACKAGE_PREFIX
  unset SPACESHIP_ELM_PROJECT_PACKAGE_SYMBOL
  unset SPACESHIP_ELM_PROJECT_PACKAGE_SUFFIX
  unset SPACESHIP_ELM_PROJECT_PACKAGE_COLOR

  unset SPACESHIP_ELM_PROJECT_APPLICATION_SHOW
  unset SPACESHIP_ELM_PROJECT_APPLICATION_PREFIX
  unset SPACESHIP_ELM_PROJECT_APPLICATION_SYMBOL
  unset SPACESHIP_ELM_PROJECT_APPLICATION_TEXT
  unset SPACESHIP_ELM_PROJECT_APPLICATION_SUFFIX
  unset SPACESHIP_ELM_PROJECT_APPLICATION_COLOR

  unset SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW
  unset SPACESHIP_ELM_PROJECT_ELM_VERSION_PREFIX
  unset SPACESHIP_ELM_PROJECT_ELM_VERSION_SUFFIX
  unset SPACESHIP_ELM_PROJECT_ELM_VERSION_COLOR

  rm -f elm.json elm-package.json
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_elm_project_application_show() {
  cat << 'EOF' > elm.json
{
  "type": "application",
  "elm-version": "0.19.0"
}
EOF

  typeset -A cases
  cases[true,true,true]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.19.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,true,mismatch]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[true,true,false]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[true,mismatch,true]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.19.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,mismatch,mismatch]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[true,mismatch,false]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[true,false,true]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.19.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,false,mismatch]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[true,false,false]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,true,true]=''
  cases[mismatch,true,mismatch]=''
  cases[mismatch,true,false]=''
  cases[mismatch,mismatch,true]=''
  cases[mismatch,mismatch,mismatch]=''
  cases[mismatch,mismatch,false]=''
  cases[mismatch,false,true]=''
  cases[mismatch,false,mismatch]=''
  cases[mismatch,false,false]=''
  cases[false,true,true]=''
  cases[false,true,mismatch]=''
  cases[false,true,false]=''
  cases[false,mismatch,true]=''
  cases[false,mismatch,mismatch]=''
  cases[false,mismatch,false]=''
  cases[false,false,true]=''
  cases[false,false,mismatch]=''
  cases[false,false,false]=''

  for k v in "${(@kv)cases}"; do
    IFS=',' read -r -A show <<< "$k"
    SPACESHIP_ELM_PROJECT_APPLICATION_SHOW=${show[1]}
    SPACESHIP_ELM_PROJECT_PACKAGE_SHOW=${show[2]}
    SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW=${show[3]}
    local expected="$v"
    local actual="$(spaceship_prompt)"
    assertEquals "render elm_project app [$k]" "$expected" "$actual"
  done | sort -r # force output order to match above
}
  
test_elm_project_application_mismatch_show() {
  cat << 'EOF' > elm.json
{
  "type": "application",
  "elm-version": "0.20.0"
}
EOF

  typeset -A cases
  cases[true,true,true]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,true,mismatch]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,true,false]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[true,mismatch,true]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,mismatch,mismatch]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,mismatch,false]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[true,false,true]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,false,mismatch]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,false,false]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,true,true]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,true,mismatch]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,true,false]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,mismatch,true]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,mismatch,mismatch]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,mismatch,false]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,false,true]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,false,mismatch]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%B%F{yellow%} (0.20.0)%{%B%F{cyan%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,false,false]='%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%} %{%b%}'
  cases[false,true,true]=''
  cases[false,true,mismatch]=''
  cases[false,true,false]=''
  cases[false,mismatch,true]=''
  cases[false,mismatch,mismatch]=''
  cases[false,mismatch,false]=''
  cases[false,false,true]=''
  cases[false,false,mismatch]=''
  cases[false,false,false]=''

  for k v in "${(@kv)cases}"; do
    IFS=',' read -r -A show <<< "$k"
    SPACESHIP_ELM_PROJECT_APPLICATION_SHOW="${show[1]}"
    SPACESHIP_ELM_PROJECT_PACKAGE_SHOW="${show[2]}"
    SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW="${show[3]}"
    local expected="$v"
    local actual="$(spaceship_prompt)"
    assertEquals "render elm_project app mismatch [$k]" "$expected" "$actual"
  done | sort -r # force output order to match above
}
  
test_elm_project_package_show() {
  cat << 'EOF' > elm.json
{
  "type": "package",
  "version": "1.2.3",
  "elm-version": "0.19.0 <= v < 0.20.0"
}
EOF

  typeset -A cases
  cases[true,true,true]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.19.0 <= v < 0.20.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,true,mismatch]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[true,true,false]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[true,mismatch,true]=''
  cases[true,mismatch,mismatch]=''
  cases[true,mismatch,false]=''
  cases[true,false,true]=''
  cases[true,false,mismatch]=''
  cases[true,false,false]=''
  cases[mismatch,true,true]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.19.0 <= v < 0.20.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,true,mismatch]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,true,false]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,mismatch,true]=''
  cases[mismatch,mismatch,mismatch]=''
  cases[mismatch,mismatch,false]=''
  cases[mismatch,false,true]=''
  cases[mismatch,false,mismatch]=''
  cases[mismatch,false,false]=''
  cases[false,true,true]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.19.0 <= v < 0.20.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[false,true,mismatch]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[false,true,false]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[false,mismatch,true]=''
  cases[false,mismatch,mismatch]=''
  cases[false,mismatch,false]=''
  cases[false,false,true]=''
  cases[false,false,mismatch]=''
  cases[false,false,false]=''

  for k v in "${(@kv)cases}"; do
    IFS=',' read -r -A show <<< "$k"
    SPACESHIP_ELM_PROJECT_APPLICATION_SHOW="${show[1]}"
    SPACESHIP_ELM_PROJECT_PACKAGE_SHOW="${show[2]}"
    SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW="${show[3]}"
    local expected="$v"
    local actual="$(spaceship_prompt)"
    assertEquals "render elm_project package [$k]" "$expected" "$actual"
  done | sort -r # force output order to match above
}
  
test_elm_project_package_mismatch_show() {
  rm elm.json
  cat << 'EOF' > elm-package.json
{
  "elm-version": "0.18.0 <= v < 0.19.0",
  "version": "1.2.3"
}
EOF
  
  typeset -A cases
  cases[true,true,true]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,true,mismatch]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,true,false]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[true,mismatch,true]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,mismatch,mismatch]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[true,mismatch,false]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[true,false,true]=''
  cases[true,false,mismatch]=''
  cases[true,false,false]=''
  cases[mismatch,true,true]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,true,mismatch]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,true,false]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,mismatch,true]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,mismatch,mismatch]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,mismatch,false]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[mismatch,false,true]=''
  cases[mismatch,false,mismatch]=''
  cases[mismatch,false,false]=''
  cases[false,true,true]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[false,true,mismatch]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[false,true,false]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[false,mismatch,true]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[false,mismatch,mismatch]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%B%F{yellow%} (0.18.0 <= v < 0.19.0)%{%B%F{blue%}%{%b%f%}%{%B%} %{%b%}'
  cases[false,mismatch,false]='%{%B%}is %{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}'
  cases[false,false,true]=''
  cases[false,false,mismatch]=''
  cases[false,false,false]=''

  for k v in "${(@kv)cases}"; do
    IFS=',' read -r -A show <<< "$k"
    SPACESHIP_ELM_PROJECT_APPLICATION_SHOW="${show[1]}"
    SPACESHIP_ELM_PROJECT_PACKAGE_SHOW="${show[2]}"
    SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW="${show[3]}"
    local expected="$v"
    local actual="$(spaceship_prompt)"
    assertEquals "render elm_project package mismatch [$k]" "$expected" "$actual"
  done | sort -r # force output order to match above

}

test_elm_project_application_color() {
  SPACESHIP_ELM_PROJECT_APPLICATION_COLOR="red"

  local expected="%{%B%}is %{%b%}%{%B%F{red}%}🖥️ App%{%b%f%}%{%B%} %{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project application with custom color" "$expected" "$actual"

  cat << 'EOF' > elm.json
{
  "type": "application",
  "elm-version": "1.0.0",
}
EOF

  local expected="%{%B%}is %{%b%}%{%B%F{red}%}🖥️ App%{%B%F{yellow%} (1.0.0)%{%B%F{red%}%{%b%f%}%{%B%} %{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project application with custom color (mismatch)" "$expected" "$actual"
}

test_elm_project_application_symbol() {
  SPACESHIP_ELM_PROJECT_APPLICATION_SYMBOL="🌵 "

  local expected="%{%B%}is %{%b%}%{%B%F{cyan}%}🌵 App%{%b%f%}%{%B%} %{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project application with custom symbol" "$expected" "$actual"
}

test_elm_project_application_text() {
  SPACESHIP_ELM_PROJECT_APPLICATION_TEXT="😍"

  local expected="%{%B%}is %{%b%}%{%B%F{cyan}%}🖥️ 😍%{%b%f%}%{%B%} %{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project application with custom symbol" "$expected" "$actual"
}

test_elm_project_application_prefix() {
  SPACESHIP_ELM_PROJECT_APPLICATION_PREFIX='prefix'
  SPACESHIP_ELM_PROJECT_APPLICATION_SUFFIX=''

  local expected="%{%B%}prefix%{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%}%{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project application with prefix" "$expected" "$actual"
}

test_elm_project_application_suffix() {
  SPACESHIP_ELM_PROJECT_APPLICATION_PREFIX=''
  SPACESHIP_ELM_PROJECT_APPLICATION_SUFFIX='suffix'

  local expected="%{%B%}%{%b%}%{%B%F{cyan}%}🖥️ App%{%b%f%}%{%B%}suffix%{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project application with suffix" "$expected" "$actual"
}

test_elm_project_package_color() {
  SPACESHIP_ELM_PROJECT_PACKAGE_COLOR="red"

  cat << 'EOF' > elm.json
{
  "type": "package",
  "elm-version": "0.19.0 <= v < 0.20.0",
  "version": "1.2.3"
}
EOF

  local expected="%{%B%}is %{%b%}%{%B%F{red}%}📦 v1.2.3%{%b%f%}%{%B%} %{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project package with custom color" "$expected" "$actual"

  cat << 'EOF' > elm.json
{
  "type": "package",
  "elm-version": "1.0.0 <= v < 1.1.0",
  "version": "8.5.3"
}
EOF

  local expected="%{%B%}is %{%b%}%{%B%F{red}%}📦 v8.5.3%{%B%F{yellow%} (1.0.0 <= v < 1.1.0)%{%B%F{red%}%{%b%f%}%{%B%} %{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project package with custom color (mismatch)" "$expected" "$actual"
}

test_elm_project_package_symbol() {
  SPACESHIP_ELM_PROJECT_PACKAGE_SYMBOL="🌵 "

  cat << 'EOF' > elm.json
{
  "type": "package",
  "elm-version": "0.19.0 <= v < 0.20.0",
  "version": "1.2.3"
}
EOF

  local expected="%{%B%}is %{%b%}%{%B%F{blue}%}🌵 v1.2.3%{%b%f%}%{%B%} %{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project package with custom symbol" "$expected" "$actual"
}

test_elm_project_package_prefix() {
  SPACESHIP_ELM_PROJECT_PACKAGE_PREFIX='prefix'
  SPACESHIP_ELM_PROJECT_PACKAGE_SUFFIX=''

  cat << 'EOF' > elm.json
{
  "type": "package",
  "elm-version": "0.19.0 <= v < 0.20.0",
  "version": "1.2.3"
}
EOF

  local expected="%{%B%}prefix%{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%}%{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project package with prefix" "$expected" "$actual"
}

test_elm_project_package_suffix() {
  SPACESHIP_ELM_PROJECT_PACKAGE_PREFIX=''
  SPACESHIP_ELM_PROJECT_PACKAGE_SUFFIX='suffix'

  cat << 'EOF' > elm.json
{
  "type": "package",
  "elm-version": "0.19.0 <= v < 0.20.0",
  "version": "1.2.3"
}
EOF

  local expected="%{%B%}%{%b%}%{%B%F{blue}%}📦 v1.2.3%{%b%f%}%{%B%}suffix%{%b%}"
  local actual="$(spaceship_prompt)"

  assertEquals "render elm project package with suffix" "$expected" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source modules/shunit2/shunit2
