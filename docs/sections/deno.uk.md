# Deno (`deno`)

!!! important "За замовчуванням ця секція рендериться асинхронно"

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

## Опції

| Змінна                           |          За замовчуванням          | Пояснення                               |
|:-------------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_DENO_SHOW`            |               `true`               | Показати секцію                         |
| `SPACESHIP_DENO_ASYNC`           |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_DENO_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_DENO_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_DENO_SYMBOL`          |                `🦕·`                | Символ, що відображається перед секцією |
| `SPACESHIP_DENO_DEFAULT_VERSION` |                 ``                 | Deno version to be treated as default   |
| `SPACESHIP_DENO_COLOR`           |               `cyan`               | Колір секції                            |
