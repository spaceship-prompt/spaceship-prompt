# Styles

This page describes how to define a custom style.

Take a look at [Contribution guidelines](../CONTRIBUTING.md) if you wish to contribute.

## A typical style

A typical style file is a .zsh file which defines the values of various [options](./docs/Options.md) that need to be customised. It can also be written as a modification of another style.

```zsh
# example.zsh
# A demonstration Spaceship style
# Keep such files in $SPACESHIP_CUSTOM/styles

# Uncomment the following line if you want to remove effects of any previously loaded styles.
# Useful for starting from a clean slate for a base style.
# spaceship::load_style reset false

# You can also load another style as your base if this is modification.
# Just make sure you don't fall into an infinite recursion.
# Also pass the second argument as false to avoid redundancy in loading sections.
spaceship::load_style robbyrussel false

# Add your customisations to the following lines.

# Define the order of sections, you can also add your custom sections by adding the appropriate
# section definition as a .zsh file to $SPACESHIP_CUSTOM/sections and adding it to either
# SPACESHIP_PROMPT_ORDER or SPACESHIP_RPROMPT_ORDER.
SPACESHIP_RPROMPT_ORDER=(battery)

# Define your own options as follows
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT="%D{%H:%M}"

# Any option that is not defined here will be read from the previously loaded style.

# You can also reset the value of any option to its default value by unsetting it and running
# 'spaceship::load_section sectionname true' or 'spaceship::load_required_section true'
# unset SPACESHIP_HOST_SHOW
# spaceship:load_section host true
```

Also have a look at [robbyrussel.zsh](../styles/robbyrussel.zsh) for a more extensively defined style.

## Loading a style

To load a style simply run:

```zsh
spaceship::load_style example
```

To load at shell startup add the preceding line to `$SPACESHIP_CUSTOM/styles/custom.zsh`


The following utilities can help you in writing styles which depend on other styles..

## `spaceship::load_section <section> [<reload>=false]`

Look for and load a section of the given name.

### Arguments

1. `section` _Required_ — Name of the section to load. Looks in `$SPACESHIP_CUSTOM/sections/` and `$SPACESHIP_ROOT/sections/` for file `SECTION.zsh` and loads it.
2. `reload` _Optional_ — If `reload` is `false`, wouldn't reload if section already loaded. Setting true is useful for reloading default values of options.

## `spaceship::load_required_sections [reload]`

Load all sections in $SPACESHIP_PROMPT_ORDER and $SPACESHIP_RPROMPT_ORDER

### Arguments

1. `reload` _Optional_ — Same as `reload` option in `spaceship::load_section`.

## `spaceship::load_style <style> [load_sections=true]`

Look for and load a style of the given name.

### Arguments

1. `style`: Name of the style to load. Looks in `$SPACESHIP_CUSTOM/styles/` and `$SPACESHIP_ROOT/styles/` for file `style.zsh` and loads it. See [Styles](./Styles.md) for more information on how to write styles.
2. `load_sections`: If `false` then doesn't try to load required sections at the end. Useful if running inside another style to avoid redundancy. Note that sections wouldn't be loaded at all, hence avoid setting false at highest level such as in ~/.zshrc.

### Utility Styles

Currently a utility style has been provided for regular housekeeping jobs.

* `spaceship::load_style reset` - Reset all customisations and loads `custom_default` and `default`. Can be used to provide a clean slate for styles.