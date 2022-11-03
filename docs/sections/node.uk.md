# Node.js `node`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Node.js**](https://nodejs.org) is a JavaScript runtime built on Chrome's V8 JavaScript engine.

The `node` section displays the current version of the Node.js binary. This section supports [nvm](https://github.com/nvm-sh/nvm), [nodenv](https://github.com/nodenv/nodenv), [fnm](https://github.com/Schniz/fnm) version managers or uses `node -v` if non of the above is installed.

This section is displayed only when the current directory is within a Node.js project, meaning:

* Пошук вгору знаходить файл `package.json`
* Пошук вгору знаходить папку `node_modules`
* Upsearch finds a `.nvmrc` file
* Upsearch finds a `.node-version` file
* Contains any other file with `.js`, `.cjs` or `.mjs` extension

## Встановлення версії Node.js за замовчуванням

If you want to avoid showing the Node.js section for a specific Node.js version (for example system installed version), use the `SPACESHIP_NODE_DEFAULT_VERSION` environment variable. The section will be hidden if the current version of the Node.js is equal to the one specified in the variable.

```zsh title=".spaceshiprc.zsh"
SPACESHIP_NODE_DEFAULT_VERSION="18.0.0"
```

## Опції

| Змінна                           |          За замовчуванням          | Пояснення                                     |
|:-------------------------------- |:----------------------------------:| --------------------------------------------- |
| `SPACESHIP_NODE_SHOW`            |               `true`               | Показати секцію                               |
| `SPACESHIP_NODE_ASYNC`           |               `true`               | Рендерити секцію асинхронно                   |
| `SPACESHIP_NODE_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                                |
| `SPACESHIP_NODE_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                 |
| `SPACESHIP_NODE_SYMBOL`          |                `⬢·`                | Символ, що відображається перед секцією       |
| `SPACESHIP_NODE_COLOR`           |              `green`               | Колір секції                                  |
| `SPACESHIP_NODE_DEFAULT_VERSION` |                 ``                 | Версія Node.js, яку слід розглядати як типову |
