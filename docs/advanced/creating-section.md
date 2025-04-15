# Creating a custom section

This guide aims to help you create your first custom section.

## Rules for sections

Here are recommendations to follow when creating a section to maintain Spaceship slick and clean.

### Section should not clutter the prompt

Having too much in prompt looks ugly. It's better to keep it to a minimum of necessary information.

* **Good:** `🚀 v1.2.3`
* **Bad:** `🚀 spasheship#c3BhY2VzaGlw`

### Section should be worth to be aware of

Is value changes quite often, so it needs to be shown in prompt? Would it be useful for other users? Maybe there's a reason to execute a command instead of cluttering prompt.

* **Good:** git status/branch, runtime version via version manager, etc
* **Bad:** version of language-specific framework, settled projects versions, etc

### Section should be fast

If your section performs any heavy checking, find a way to make it faster. Use async rendering for performing heavy tasks. Section should be:

* **Async:** if it executes external commands, perform complex calculations, reading large files
* **Sync:** if it checks command availability, checks the value of environment variable

### Follow naming convention for options

All options of prompt follow a specific pattern so that it is easy to remember: `SPACESHIP_SECTION_<OPTION>[_PROPERTY]`. The rule is simple: when naming new properties, keep unique parts of the name to the end.

* **Good:**
  ```
    SPACESHIP_GIT_STATUS_COLOR_BEHIND
    SPACESHIP_GIT_STATUS_COLOR_DIVERGED
  ```
* **Bad:**
  ```
    SPACESHIP_GIT_STATUS_BEHIND_COLOR
    SPACESHIP_GIT_STATUS_DIVERGED_COLOR
  ```

  Here, `GIT_STATUS` is *section*, `COLOR` is *option* and `BEHIND` or `DIVERGED` is *property*.

## Create a section

The simplest way to create a section is to use a template repo for Spaceship section.

[:fontawesome-brands-github: Use a section template](https://github.com/spaceship-prompt/spaceship-section){ .md-button }

This boilerplate repo contains a template for a section and its documentation, has configured release and testing workflow. Explore the repo to learn more.

Open a [`spaceship-section.plugin.zsh` file](https://github.com/spaceship-prompt/spaceship-section/blob/main/spaceship-section.plugin.zsh) for a custom section example.

## Typical section breakdown

Below is an example of a typical section for Spaceship. Pay attention to a few crucial moments:

- Define options for customization. Their names should start with `SPACESHIP_`.
- Every Spaceship section name should start with `spaceship_` (for example `spaceship_node`). This is a convention that is used to identify the section.
- Show section only where it's needed (in directories which contains specific files, when a specific command is available, etc).

Sections are defined by [`spaceship::section` API](../api/section.md). You can use [general purpose utilities](../api/utils.md) for performing common tasks in a section.

Typical section might look like this:

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
SPACESHIP_FOOBAR_ASYNC="${SPACESHIP_FOOBAR_ASYNC=true}"
SPACESHIP_FOOBAR_PREFIX="${SPACESHIP_FOOBAR_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_FOOBAR_SUFFIX="${SPACESHIP_FOOBAR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_FOOBAR_SYMBOL="${SPACESHIP_FOOBAR_SYMBOL="🍷 "}"
SPACESHIP_FOOBAR_COLOR="${SPACESHIP_FOOBAR_COLOR="white"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show foobar status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_foobar() {
  # If SPACESHIP_FOOBAR_SHOW is false, don't show foobar section
  [[ $SPACESHIP_FOOBAR_SHOW == false ]] && return

  # Check if foobar command is available for execution
  spaceship::exists foobar || return

  # Show foobar section only when there are foobar-specific files in current
  # working directory.

  # spaceship::upsearch utility helps finding files up in the directory tree.
  local is_foobar_context="$(spaceship::upsearch foobar.conf)"
  # Here glob qualifiers are used to check if files with specific extension are
  # present in directory. Read more about them here:
  # http://zsh.sourceforge.net/Doc/Release/Expansion.html
  [[ -n "$is_foobar_context" || -n *.foo(#qN^/) || -n *.bar(#qN^/) ]] || return

  local foobar_version="$(foobar --version)"

  # Check if tool version is correct
  [[ $tool_version == "system" ]] && return

  # Display foobar section
  # spaceship::section utility composes sections. Flags are optional
  spaceship::section::v4 \
    --color "$SPACESHIP_FOOBAR_COLOR" \
    --prefix "$SPACESHIP_FOOBAR_PREFIX" \
    --suffix "$SPACESHIP_FOOBAR_SUFFIX" \
    --symbol "$SPACESHIP_FOOBAR_SYMBOL" \
    "$foobar_status"
}
```

Take a look at [Contribution guidelines](//github.com/spaceship-prompt/spaceship-prompt/blob/master/CONTRIBUTING.md) for further information.

## Share your section with others

The next step is to share your section with the community.

Open a discussion topic on our Discussion forum:

[Add to Registry](https://github.com/spaceship-prompt/spaceship-prompt/blob/master/docs/registry/external.json){ .md-button }
[Share on forum](https://github.com/spaceship-prompt/spaceship-prompt/discussions/new?category=show-and-tell&title=Section%20for%20[tool]){ .md-button }
