# Async `async`

The `async` section is used as a placeholder for sections that are not yet rendered. This section is displayed only when there are still sections to be rendered.

By default, Spaceship works asynchronously. It displays the prompt immediately while checking the environment, then it updates the prompt with new information.

Optionally, you can enable displaying the number of sections that are being processed via the `SPACESHIP_ASYNC_SHOW_COUNT` environment variable:

```sh title=".zshrc"
SPACESHIP_ASYNC_SHOW_COUNT=true
```

## Options

| Variable                     |  Default   | Meaning                             |
| :--------------------------- | :--------: | ----------------------------------- |
| `SPACESHIP_ASYNC_SHOW`       |  `true`    | Show section                     |
| `SPACESHIP_ASYNC_SHOW_COUNT` |  `false`   | Show job count                   |
| `SPACESHIP_ASYNC_PREFIX`     |     -      | Section's prefix                    |
| `SPACESHIP_ASYNC_SUFFIX`     |     -      | Section's suffix                    |
| `SPACESHIP_ASYNC_SYMBOL`     |    `…`     | Symbol displayed before the section |
| `SPACESHIP_ASYNC_COLOR`      |  `gray`    | Section's color                     |

