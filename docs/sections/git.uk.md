# Git `git`

!!! important "Типово ця секція обробляється асинхронно"

Секція `git` складається з підсекцій [`git_branch`](#git-branch-git_branch) та [`git_status`](#git-status-git_status).

## Опції

| Змінна                 |          За замовчуванням          | Пояснення                                                                                               |
|:---------------------- |:----------------------------------:| ------------------------------------------------------------------------------------------------------- |
| `SPACESHIP_GIT_SHOW`   |               `true`               | Показати секцію                                                                                         |
| `SPACESHIP_GIT_ASYNC`  |               `true`               | Рендерити секцію асинхронно                                                                             |
| `SPACESHIP_GIT_PREFIX` |               `on·`                | Префікс секції                                                                                          |
| `SPACESHIP_GIT_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                                                                           |
| `SPACESHIP_GIT_SYMBOL` |                ``                 | Символ, що відображається перед секцією (вимагає [powerline шрифт](https://github.com/powerline/fonts)) |
| `SPACESHIP_GIT_ORDER`  |     `(git_branch git_status)`      | Послідовність підсекцій git                                                                             |

## Git гілка `git_branch`

Секція `git_branch` відображає поточну гілку Git-репозиторію.

### Опції

| Змінна                        |    За замовчуванням     | Пояснення                   |
|:----------------------------- |:-----------------------:| --------------------------- |
| `SPACESHIP_GIT_BRANCH_SHOW`   |         `true`          | Показати секцію             |
| `SPACESHIP_GIT_BRANCH_ASYNC`  |         `false`         | Рендерити секцію асинхронно |
| `SPACESHIP_GIT_BRANCH_PREFIX` | `$SPACESHIP_GIT_SYMBOL` | Префікс секції              |
| `SPACESHIP_GIT_BRANCH_SUFFIX` |           ``            | Суфікс секції               |
| `SPACESHIP_GIT_BRANCH_COLOR`  |        `magenta`        | Колір секції                |

## Git статус `git_status`

Підсекція `git_status` відображає індикатори тільки тоді, коли у вас є репозиторій Git.

### Опції

| Змінна                           | За замовчуванням | Пояснення                                                                             |
|:-------------------------------- |:----------------:| ------------------------------------------------------------------------------------- |
| `SPACESHIP_GIT_STATUS_SHOW`      |      `true`      | Показати секцію                                                                       |
| `SPACESHIP_GIT_STATUS_ASYNC`     |      `true`      | Рендерити секцію асинхронно                                                           |
| `SPACESHIP_GIT_STATUS_PREFIX`    |       `·[`       | Префіксперед підсекцією Git-статусу                                                   |
| `SPACESHIP_GIT_STATUS_SUFFIX`    |       `]`        | Суфікс після підсекції статусу Git                                                    |
| `SPACESHIP_GIT_STATUS_COLOR`     |      `red`       | Колір підсекції статусу Git                                                           |
| `SPACESHIP_GIT_STATUS_UNTRACKED` |       `?`        | Індикатор невідстежуваних змін                                                        |
| `SPACESHIP_GIT_STATUS_ADDED`     |       `+`        | Індикатор внесених змін                                                               |
| `SPACESHIP_GIT_STATUS_MODIFIED`  |       `!`        | Індикатор файлів поза індексом                                                        |
| `SPACESHIP_GIT_STATUS_RENAMED`   |       `»`        | Індикатор перейменованих файлів                                                       |
| `SPACESHIP_GIT_STATUS_DELETED`   |       `✘`        | Індикатор видалених файлів                                                            |
| `SPACESHIP_GIT_STATUS_STASHED`   |       `$`        | Індикатор змін, що були приховані                                                     |
| `SPACESHIP_GIT_STATUS_UNMERGED`  |       `=`        | Індикатор змін, що не були злиті з основною гілкою                                    |
| `SPACESHIP_GIT_STATUS_AHEAD`     |       `⇡`        | Індикатор ненадісланих змін (гілка містить зміни відсутні у віддаленій гілці)         |
| `SPACESHIP_GIT_STATUS_BEHIND`    |       `⇣`        | Індикатор неотриманих змін (гілка не містить зміни, які відбулись у віддаленій гілці) |
| `SPACESHIP_GIT_STATUS_DIVERGED`  |       `⇕`        | Індикатор розбіжних змін (розбіжних із віддаленою гілкою)                             |
