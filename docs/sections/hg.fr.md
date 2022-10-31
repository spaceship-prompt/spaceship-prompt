# Mercurial `hg`

!!! important "This section is rendered asynchronously by default"

The `hg` section consists of [`hg_branch`](#hg-branch-hg_branch) and [`hg_status`](#hg-status-hg_status) subsections. It is displayed only in Mercurial repositories.

## Options

| Variable              |              Default               | Meaning                             |
|:--------------------- |:----------------------------------:| ----------------------------------- |
| `SPACESHIP_HG_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_HG_ASYNC`  |               `true`               | Render section asynchronously       |
| `SPACESHIP_HG_PREFIX` |               `on·`                | Section's prefix                    |
| `SPACESHIP_HG_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_HG_SYMBOL` |                `☿·`                | Symbol displayed before the section |
| `SPACESHIP_HG_ORDER`  |      `(hg_branch hg_status)`       | Order of hg subsection rendering    |

## Mercurial branch `hg_branch`

The `hg_branch` shows Mercurial bookmarks when available, otherwise shows Mercurial branch information.

### Options

| Variable                     |              Default               | Meaning          |
|:---------------------------- |:----------------------------------:| ---------------- |
| `SPACESHIP_HG_BRANCH_SHOW`   |               `true`               | Show subsection  |
| `SPACESHIP_HG_BRANCH_ASYNC`  |               `true`               | Show subsection  |
| `SPACESHIP_HG_BRANCH_PREFIX` |       `$SPACESHIP_HG_SYMBOL`       | Section's prefix |
| `SPACESHIP_HG_BRANCH_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix |
| `SPACESHIP_HG_BRANCH_COLOR`  |             `magenta`              | Section's color  |

## Mercurial status `hg_status`

The `hg_status` displays Mercurial status indicators. It is shown only within a dirty Mercurial repository.

### Options

| Variable                        | Default | Meaning                         |
|:------------------------------- |:-------:| ------------------------------- |
| `SPACESHIP_HG_STATUS_SHOW`      | `true`  | Show subsection                 |
| `SPACESHIP_HG_STATUS_ASYNC`     | `true`  | Show subsection                 |
| `SPACESHIP_HG_STATUS_PREFIX`    |   `[`   | Section's prefix                |
| `SPACESHIP_HG_STATUS_SUFFIX`    |   `]`   | Section's suffix                |
| `SPACESHIP_HG_STATUS_COLOR`     |  `red`  | Section's color                 |
| `SPACESHIP_HG_STATUS_UNTRACKED` |   `?`   | Indicator for untracked changes |
| `SPACESHIP_HG_STATUS_ADDED`     |   `+`   | Indicator for added changes     |
| `SPACESHIP_HG_STATUS_MODIFIED`  |   `!`   | Indicator for unstaged files    |
| `SPACESHIP_HG_STATUS_DELETED`   |   `✘`   | Indicator for deleted files     |
