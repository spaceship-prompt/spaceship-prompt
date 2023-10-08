# Contributing

First, thank you for contributing 💖

Any contribution of any skill level is highly appreciated and welcome.

## Philosophy

There's a simple philosophy behind the Spaceship:

* **Show only what's needed.** The prompt should not be overloaded, it shows only what user needs at the moment (current directory, git branch, etc).
* **Work out of the box.** The prompt should work right after installation without any additional configuration. Install it and use it.
* **Be configurable.** It works without configuration, but if a configuration is needed, it provides an easy-to-use interface for customization.
* **Maintain performance.** Any change should be made with performance in mind. We aim to keep the prompt fast and robust. If you spot any point where performance could be improved, we will gladly accept your contribution.

## Architecture

The project begins in [`spaceship.zsh`](https://github.com/spaceship-prompt/spaceship-prompt/blob/master/spaceship.zsh) file. It sources files from the `lib` folders, registers Zsh hooks and kicks off the section loading.

We use [`zsh-async`](https://github.com/mafredri/zsh-async) for asynchronous rendering of sections. We always keep a copy of this library as a fallback in case a user doesn't have `zsh-async` installed.

## Section Checklist

The simplest way to create a section is to follow this guide:

[**➡️ Creating a custom section**](https://spaceship-prompt.sh/advanced/creating-section)

Spaceship aims to show only necessary information to the user, so we carefully consider the inclusion of new sections. Commonly we accept sections that are showing the contextual information, like runtime version, current directory, git status, compiler version, etc.

Sections for the version of frameworks, libraries, versions of CLI tools, etc can be included, but with considerations. It's better to make such section as an external one, so it can be installed optionally.

When adding a new section to Spaceship, here's a checklist you should follow:

- [ ] Add a section to `sections` folder.
- [ ] Include a section to prompt order options in `spaceship.zsh` file.
- [ ] Add tests for section in `tests` folder. You can use [crystal](https://github.com/spaceship-prompt/spaceship-prompt/blob/master/tests/crystal.test.zsh) or [deno](https://github.com/spaceship-prompt/spaceship-prompt/blob/master/tests/deno.test.zsh) tests as examples.
- [ ] Add documentation for a section in `docs/sections` folder.
  - [ ] Include a reference for section in `mkdocs.yml` file.
  - [ ] Include a reference for section in `config/prompt.md` file.
- [ ] Add a section to the registry in `docs/registry/internal.json`

> **Note:** Do not add translation files for a section manually. Those should and will be added via Crowdin automatically.

## Setup

1. **Fork** this repo (click the _fork_ button)
1. **Clone** your fork to your working machine (via `git clone`) and **cd** into directory.
1. **Update submodules** in your fork (via `git submodule update --init --recursive`)
1. **Make your changes**. Check our [API](https://spaceship-prompt.sh/api) for more information (we suggest you to check out a new branch for changes).
1. **Test** your code (via `make tests`)
1. **Add and commit** your contributions
1. **Push** your changes to your remote fork by doing (**git push**)
1. **Open a pull-request** to our primary repo and target `master` branch.
1. **Wait for review**, get your PR reviewed and merged.

## Testing

We use [`shunit2`](https://github.com/kward/shunit2) as a testing framework. In order to run all the tests, execute:

```zsh
make tests
```

## Documentation

The documentation website is built using [mkdocs-material](https://squidfunk.github.io/mkdocs-material).

Start a local development server for the website using the following commands:

```zsh
# Install website dependencies
pip3 install -r requirements.txt

# Start a server
make docs
```

### Translations

We use Crowdin to translate the documentation. Please do not edit the translations directly. If you want to contribute to the translations, please visit our translation page:

[➡**️ Spaceship Crowdin**](https://translate.spaceship-prompt.sh/)

## For maintainers

A few notes for current and future maintainers of Spaceship:

- The version, changelog and release notes are generated automatically based on commit history.
- This repository adheres to [semver](https://semver.org/), using [conventional commits](https://www.conventionalcommits.org/) via [semantic-release](https://github.com/semantic-release/semantic-release).
- Issues and PRs must be replied in first 24 hours. At least a simple message that we've noticed that issue was reported.
- Every issue and a PR should have a label.
- Issues containing questions should be moved to discussions.

_Thanks for reading this contribution guide! Happy hacking!_
