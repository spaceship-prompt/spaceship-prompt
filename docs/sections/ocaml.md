# OCaml (`deno`)

!!! important "This section is rendered asynchronously by default"

!!! info
    [**OCaml**](https://ocaml.org/) is an industrial strength programming language supporting functional, imperative and object-oriented styles

The `ocaml` section displays the OCaml version.

This section is displayed only when:

- Upsearch finds `_opam` or `esy.lock` directories
- Upsearch finds `dune` or `dune-project` files
- Upsearch finds `jbuild` or `jbuild-ignore` files
- Upsearch finds `.merlin` file
- Current directory contains any files with `.opam` extension
- Current directory contains any files with `.ml`, `.mli`, `.re` or `.rei` extension

## Options

| Variable                          |              Default               | Meaning                               |
| :-------------------------------- | :--------------------------------: | ------------------------------------- |
| `SPACESHIP_OCAML_SHOW`            |               `true`               | Show section                          |
| `SPACESHIP_OCAML_ASYNC`           |               `true`               | Render section asynchronously         |
| `SPACESHIP_OCAML_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                      |
| `SPACESHIP_OCAML_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                      |
| `SPACESHIP_OCAML_SYMBOL`          |               `🐫 `                | Symbol displayed before the section   |
| `SPACESHIP_OCAML_COLOR`           |               `yellow`             | Section's color                       |
