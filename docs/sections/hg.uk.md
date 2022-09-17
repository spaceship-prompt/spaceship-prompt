# Mercurial `hg`

!!! important "За замовчуванням ця секція рендериться асинхронно"

The `hg` section consists of [`hg_branch`](#hg-branch-hg_branch) and [`hg_status`](#hg-status-hg_status) subsections. It is displayed only in Mercurial repositories.

## Опції

| Змінна                |              Default               | Meaning                                 |
|:--------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_HG_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_HG_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_HG_PREFIX` |               `on·`                | Префікс секції                          |
| `SPACESHIP_HG_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_HG_SYMBOL` |                `☿·`                | Символ, що відображається перед секцією |
| `SPACESHIP_HG_ORDER`  |      `(hg_branch hg_status)`       | Order of hg subsection rendering        |

## Mercurial гілка `hg_branch`

The `hg_branch` shows Mercurial bookmarks when available, otherwise shows Mercurial branch information.

### Опції

| Змінна                       |              Default               | Meaning         |
|:---------------------------- |:----------------------------------:| --------------- |
| `SPACESHIP_HG_BRANCH_SHOW`   |               `true`               | Show subsection |
| `SPACESHIP_HG_BRANCH_ASYNC`  |               `true`               | Show subsection |
| `SPACESHIP_HG_BRANCH_PREFIX` |       `$SPACESHIP_HG_SYMBOL`       | Префікс секції  |
| `SPACESHIP_HG_BRANCH_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції   |
| `SPACESHIP_HG_BRANCH_COLOR`  |             `magenta`              | Колір секції    |

## Статус Mercurial `hg_status`

The `hg_status` displays Mercurial status indicators. It is shown only within a dirty Mercurial repository.

### Опції

| Змінна                          | Default | Meaning                         |
|:------------------------------- |:-------:| ------------------------------- |
| `SPACESHIP_HG_STATUS_SHOW`      | `true`  | Show subsection                 |
| `SPACESHIP_HG_STATUS_ASYNC`     | `true`  | Show subsection                 |
| `SPACESHIP_HG_STATUS_PREFIX`    |   `[`   | Префікс секції                  |
| `SPACESHIP_HG_STATUS_SUFFIX`    |   `]`   | Суфікс секції                   |
| `SPACESHIP_HG_STATUS_COLOR`     |  `red`  | Колір секції                    |
| `SPACESHIP_HG_STATUS_UNTRACKED` |   `?`   | Indicator for untracked changes |
| `SPACESHIP_HG_STATUS_ADDED`     |   `+`   | Indicator for added changes     |
| `SPACESHIP_HG_STATUS_MODIFIED`  |   `!`   | Indicator for unstaged files    |
| `SPACESHIP_HG_STATUS_DELETED`   |   `✘`   | Індикатор видалених файлів      |
