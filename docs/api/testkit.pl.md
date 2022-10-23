# Testing utilities

This set of utilities are aimed to help you to test your custom sections. They are useful to render prompts as string for checking the rendered output.

For example, here's an example of a testing with shunit2:

```zsh
# Required for shunit2 to run correctly
setopt shwordsplit
SHUNIT_PARENT=$0

# Setup shunit2 hook
oneTimeSetUp() {
  export TERM="xterm-256color"

  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(char)

  source "spaceship.zsh"
}

# Clean-up shunit2 hook
oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

# Test case
test_char() {
  SPACESHIP_CHAR_COLOR_SUCCESS=blue

  # Here we render the prompt as a string
  local actual="$(spaceship::testkit::render_prompt)"
  local expected="%{%B%F{$SPACESHIP_CHAR_COLOR_SUCCESS}%}➜ %{%b%f%}"

  assertEquals "render char" "$expected" "$actual"
}

source tests/shunit2/shunit2
```

## `spaceship::testkit::render_prompt`

Renders the value of `PROMPT` variable and prints it as a string.

``` title="Signature"
spaceship::testkit::render_prompt
```

## `spaceship::testkit::render_rprompt`

Renders the value of `RPROMPT` variable and prints it as a string.

``` title="Signature"
spaceship::testkit::render_rprompt
```

## `spaceship::testkit::render_ps2`

Renders the value of `PS2` variable and prints it as a string.

``` title="Signature"
spaceship::testkit::render_ps2
```
