# Node.js `node`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Node.js**](https://nodejs.org) is a JavaScript runtime built on Chrome's V8 JavaScript engine.

The `node` section displays the current version of the Node.js binary. This section supports [nvm](https://github.com/nvm-sh/nvm), [nodenv](https://github.com/nodenv/nodenv), [fnm](https://github.com/Schniz/fnm) version managers or uses `node -v` if non of the above is installed.

This section is displayed only when the current directory is within a Node.js project, meaning:

* Upsearch finds a `package.json` file
* Upsearch finds a `node_modules` folder
* Upsearch finds a `.nvmrc` file
* Upsearch finds a `.node-version` file
* Contains any other file with `.js`, `.cjs` or `.mjs` extension

## Setting the default Node.js version

If you want to avoid showing the Node.js section for a specific Node.js version (for example system installed version), use the `SPACESHIP_NODE_DEFAULT_VERSION` environment variable. The section will be hidden if the current version of the Node.js is equal to the one specified in the variable.

```zsh title=".spaceshiprc.zsh"
SPACESHIP_NODE_DEFAULT_VERSION="18.0.0"
```

## Options

| Variable                         |              Default               | Meaning                                  |
| :------------------------------- | :--------------------------------: | ---------------------------------------- |
| `SPACESHIP_NODE_SHOW`            |               `true`               | Show section                             |
| `SPACESHIP_NODE_ASYNC`           |               `true`               | Render section asynchronously            |
| `SPACESHIP_NODE_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                         |
| `SPACESHIP_NODE_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                         |
| `SPACESHIP_NODE_SYMBOL`          |                `⬢·`                | Symbol displayed before the section      |
| `SPACESHIP_NODE_COLOR`           |              `green`               | Section's color                          |
| `SPACESHIP_NODE_DEFAULT_VERSION` |                ` `                 | Node.js version to be treated as default |
