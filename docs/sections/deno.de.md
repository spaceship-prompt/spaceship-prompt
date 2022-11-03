# Deno (`deno`)

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Deno**](https://deno.land) is a secure runtime for JavaScript and TypeScript.

The `deno` section displays the Deno version.

This section is displayed only when:

- Upsearch finds `deno.json` or `deno.jsonc` file
- Current directory contains `deps.ts`, `mod.ts`, `main.ts` or `cli.ts` files.

## Settings the default Deno version

If you set `SPACESHIP_DENO_DEFAULT_VERSION` to the default Deno version and your current version is the same as `SPACESHIP_DENO_DEFAULT_VERSION`, then Deno

```zsh title=".spaceshiprc.zsh"
SPACESHIP_DENO_DEFAULT_VERSION="1.25.3"
```

## Options

| Variable                         |              Default               | Meaning                               |
|:-------------------------------- |:----------------------------------:| ------------------------------------- |
| `SPACESHIP_DENO_SHOW`            |               `true`               | Show section                          |
| `SPACESHIP_DENO_ASYNC`           |               `true`               | Render section asynchronously         |
| `SPACESHIP_DENO_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                      |
| `SPACESHIP_DENO_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                      |
| `SPACESHIP_DENO_SYMBOL`          |                `🦕·`                | Symbol displayed before the section   |
| `SPACESHIP_DENO_DEFAULT_VERSION` |                 ``                 | Deno version to be treated as default |
| `SPACESHIP_DENO_COLOR`           |               `cyan`               | Section's color                       |
