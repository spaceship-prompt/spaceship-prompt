# Creating a custom section

This guide aims to help you create your first custom section.

## Create a section

The simplest way to create a section is to use a template repo for Spaceship section.

[Use a section template](https://github.com/spaceship-prompt/spaceship-section){ .md-button }

This boilerplate repo contains a template for a section and its documentation, has configured release and testing workflow. Explore the repo to learn more.

Open a [`spaceship-section.plugin.zsh` file](https://github.com/spaceship-prompt/spaceship-section/blob/main/spaceship-section.plugin.zsh) for a custom section example.

Every Spaceship section name should start with `spaceship_` (for example `spaceship_node`). This is a convention that is used to identify the section.

Sections are defined by `spaceship::section` API. You can use general purpose utilities for performing common tasks in a section.

## Share your section with others

## Rules for sections

## Typical section

Below is an example of a typical section for Spaceship. Pay attention to a few crucial moments:

- Define options for customization. Their names should start with `SPACESHIP_`.
- Section's name should start with `spaceship_`.
- Show section only where it's needed (in directories which contains specific files, when a specific command is available, etc).

Take a look at [Contribution guidelines](//github.com/spaceship-prompt/spaceship-prompt/blob/master/CONTRIBUTING.md) for further information.
