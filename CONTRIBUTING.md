# Contributing

First, thank you for contributing. Any contribution is highly appreciated and welcome.

## Philosophy

There's a simple philosophy behind the Spaceship:

* **Show only what's needed.** The prompt should not be overloaded, it shows only what user needs at the moment (current directory, git branch, etc).
* **Work out of the box.** The prompt should work right after installation without any additional configuration. Install it and use it.
* **Be configurable.** It works without configuration, but if a configuration is needed, it provides an easy-to-use interface for customization.

Please, keep these simple rules in mind while you're contributing to Spaceship.

## Setup

1. **Fork** this repo (click the _fork_ button)
2. **Clone** your fork to your working machine (via `git clone`)
3. **Update submodules** in your fork (via `git submodule update --init --recursive`)
4. **Make your changes**. Check our [API](./docs/API.md) for more information (we suggest you to check out a new branch for changes).
5. **Test** your code (via `npm test`)
6. **Add and commit** your contributions
7. **Push** your changes to your remote fork
8. **Open a pull-request** to our primary repo

## Sections

Spaceship supports most of the popular programming languages, runtimes, version managers, etc. If it doesn't support something that you need, feel free to open a pull request, but answer these questions for yourself before:

<!-- TODO: Add link to rules -->

### Documentation

<!-- TODO: Update contributing guide for docs. Reference mkdocs-material -->

When updating documentation for your section, make sure the Markdown document is being properly rendered by GitHub. Specifically, the following common pitfalls have already been discovered:

* Empty inline code block ` ` will only be rendered if you put at least one non-breaking whitespace "&nbsp;" inside, like so: `` ` ` `` → ` `
* Leading and trailing whitespaces in inline code blocks will be stripped, to indicate that a whitespace is present, use the middot symbol `·`, like so: `` `🚀·` `` → `🚀·`

**Thanks for reading this contribution guide! Happy hacking!**
