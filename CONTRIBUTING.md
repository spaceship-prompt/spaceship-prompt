# Contributing

First of all, thank you for contributing. Any contribution is highly appreciated and welcome.

## Philosophy

There's a simple philosophy behind the Spaceship:

* **Show only what's needed.** The prompt should not be overloaded, it shows only what user needs at the moment (current directory, git branch, etc).
* **Work out of the box.** The prompt should work right after installation without any additional configuration. Install it and use it.
* **Be configurable.** It works without configuration, but if a configuration is needed, it provides an easy-to-use interface for customization.

Please, keep this simple rules in mind while you're contributing to Spaceship.

## Setup

1. **Fork** this repo (click the *fork* button)
2. **Clone** your fork to your working machine (via `git clone `)
3. **Add and commit** your contributions
4. **Push** your changes to your remote fork
5. **Open a pull-request** to our primary repo

## Sections

Spaceship supports most of the popular programming languages, runtimes, version managers, etc. If it doesn't support something that you need, feel free to open a pull request, but answer these questions for yourself before:

### Will it clutter the prompt?

Having too much in prompt looks ugly. your much space or be shown too often.

* **Good:** `🚀 v1.2.3`
* **Bad:** `🚀 spasheship#c3BhY2VzaGlw`

### Is it worth to be aware of it?

Is value changes quite often so it needs to be shown in prompt? Would it be useful for other users? Maybe there's a reason to execute a command instead of cluttering prompt.

* **Good:** git status/branch, runtime version via version manager, etc
* **Bad:** version of language-specific framework, settled projects versions, etc

### Will it slow down the prompt?

Every additional section will slow down the prompt a little bit. If your section performs any heavy checkings, find a way to make it faster or consider using an alias instead of creating a new section.

* **Good:** check if command exists, check the value of environment variable
* **Bad:** network requests, reading large files, etc

## Section Example

Below is an example of a typical section for Spaceship. Please, read more about Spaceship's API on [API page](./docs/API.md) of the documentation.

```zsh
#
# Foobar
#
# Foobar is a supa-dupa cool tool for making you development easier.
# Link: https://www.foobar.xyz

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_FOOBAR_SHOW="${SPACESHIP_FOOBAR_SHOW=true}"
SPACESHIP_FOOBAR_PREFIX="${SPACESHIP_FOOBAR_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_FOOBAR_SUFFIX="${SPACESHIP_FOOBAR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_FOOBAR_SYMBOL="${SPACESHIP_FOOBAR_SYMBOL="🍷 "}"
SPACESHIP_FOOBAR_COLOR="${SPACESHIP_FOOBAR_COLOR="white"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show foobar status
spaceship_foobar() {
  # If SPACESHIP_FOOBAR_SHOW is false, don't show foobar section
  [[ $SPACESHIP_FOOBAR_SHOW == false ]] && return

  # Show foobar section only when there are foobar-specific files
  # in current working direcotory
  [[ -f foobar.conf || -n *.foo(#qN^/) || -n *.bar(#qN^/) ]] || return

  # Check if foobar command is available for execution
  spaceship::exists foobar || return

  # Retrieve foobar status and save it to variable
  local foobar_status=$(foobar status)

  # Display foobar section
  spaceship::section \
    "$SPACESHIP_FOOBAR_COLOR" \
    "$SPACESHIP_FOOBAR_PREFIX" \
    "$SPACESHIP_FOOBAR_SYMBOL$foobar_status" \
    "$SPACESHIP_FOOBAR_SUFFIX"
}
```

**Thanks for reading this contribution guide! Happy hacking!**
