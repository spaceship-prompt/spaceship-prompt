---
hide: [toc]
---

# Async `async`

By default, Spaceship works asynchronously. It displays the prompt immediately, while checking the environment, then it updates the prompt with new information.

`async` section is used as a placeholder for sections that are not yet rendered. This section is being displayed only when there are still sections to be rendered.

Optionally, you can enable displaying the amount of sections that are being processed via `SPACESHIP_ASYNC_SHOW_COUNT` environment variable:

```sh title=".zshrc"
SPACESHIP_ASYNC_SHOW_COUNT=true
```

## Options

| Variable                     |  Default   | Meaning                             |
| :--------------------------- | :--------: | ----------------------------------- |
| `SPACESHIP_ASYNC_SHOW`       |  `true`    | Display section                     |
| `SPACESHIP_ASYNC_SHOW_COUNT` |  `false`   | Display job count                   |
| `SPACESHIP_ASYNC_PREFIX`     |     -      | Section's prefix                    |
| `SPACESHIP_ASYNC_SUFFIX`     |     -      | Section's suffix                    |
| `SPACESHIP_ASYNC_SYMBOL`     |    `…`     | Symbol displayed before the section |
| `SPACESHIP_ASYNC_COLOR`      |  `gray`    | Section's color                     |

