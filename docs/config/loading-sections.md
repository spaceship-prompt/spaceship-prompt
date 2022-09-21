# Loading custom sections

Though Spaceship has multiple sections for various use-cases, sometimes you may need to install a custom one: for a specific tool or something that you use personally.

You can create your own section using [sections API](/api/section) or use existing one from [the Registry](/registry):

[Browse Registry](/registry){ .md-button  }
[Create a custom section](/advanced/creating-section){ .md-button }

## How to install a section

It better to follow the installation instructions provided by the section author.

Most of the time, it's enough to just clone the repository locally (for example to `~/.config/spaceship`) and source the section somewhere in [Spaceship config](/config/intro/#create-a-config-file) or directly in `~/.zshrc`.

## How to add a section to the prompt

Spaceship CLI provides a command to add a section to the prompt:

```zsh
spaceship add <section>
```

For example, for `ember` section you can use:

```zsh
spaceship add ember
```

You need to add this line somewhere in `~/.zshrc`.
