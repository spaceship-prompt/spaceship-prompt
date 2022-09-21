# Mercurial `hg`

!!! important "За замовчуванням ця секція рендериться асинхронно"

Секція `hg` складається з підсекцій [`hg_branch`](#hg-branch-hg_branch) та [`hg_status`](#hg-status-hg_status). Він відображається лише в Mercurial-репозитаріях.

## Опції

| Змінна                |          За замовчуванням          | Пояснення                               |
|:--------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_HG_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_HG_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_HG_PREFIX` |               `on·`                | Префікс секції                          |
| `SPACESHIP_HG_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_HG_SYMBOL` |                `☿·`                | Символ, що відображається перед секцією |
| `SPACESHIP_HG_ORDER`  |      `(hg_branch hg_status)`       | Послідовність підсекцій hg              |

## Mercurial гілка `hg_branch`

Гілка `hg_branch` показує Mercurial-закладки, в іншому випадку буде показана інформація про гілку Mercurial.

### Опції

| Змінна                       |          За замовчуванням          | Пояснення          |
|:---------------------------- |:----------------------------------:| ------------------ |
| `SPACESHIP_HG_BRANCH_SHOW`   |               `true`               | Показати підсекцію |
| `SPACESHIP_HG_BRANCH_ASYNC`  |               `true`               | Показати підсекцію |
| `SPACESHIP_HG_BRANCH_PREFIX` |       `$SPACESHIP_HG_SYMBOL`       | Префікс секції     |
| `SPACESHIP_HG_BRANCH_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції      |
| `SPACESHIP_HG_BRANCH_COLOR`  |             `magenta`              | Колір секції       |

## Статус Mercurial `hg_status`

У `hg_status` відображаються індикатори статусу Mercurial. Його показують лише в брудному Mercurial-репозиторії.

### Опції

| Змінна                          | За замовчуванням | Пояснення                       |
|:------------------------------- |:----------------:| ------------------------------- |
| `SPACESHIP_HG_STATUS_SHOW`      |      `true`      | Показати підсекцію              |
| `SPACESHIP_HG_STATUS_ASYNC`     |      `true`      | Показати підсекцію              |
| `SPACESHIP_HG_STATUS_PREFIX`    |       `[`        | Префікс секції                  |
| `SPACESHIP_HG_STATUS_SUFFIX`    |       `]`        | Суфікс секції                   |
| `SPACESHIP_HG_STATUS_COLOR`     |      `red`       | Колір секції                    |
| `SPACESHIP_HG_STATUS_UNTRACKED` |       `?`        | Indicator for untracked changes |
| `SPACESHIP_HG_STATUS_ADDED`     |       `+`        | Indicator for added changes     |
| `SPACESHIP_HG_STATUS_MODIFIED`  |       `!`        | Indicator for unstaged files    |
| `SPACESHIP_HG_STATUS_DELETED`   |       `✘`        | Індикатор видалених файлів      |
