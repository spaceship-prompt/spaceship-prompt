# Git `git`

!!! important "За замовчуванням ця секція рендериться асинхронно"

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

| Змінна                           | За замовчуванням | Пояснення                                                    |
|:-------------------------------- |:----------------:| ------------------------------------------------------------ |
| `SPACESHIP_GIT_STATUS_SHOW`      |      `true`      | Показати секцію                                              |
| `SPACESHIP_GIT_STATUS_ASYNC`     |      `true`      | Рендерити секцію асинхронно                                  |
| `SPACESHIP_GIT_STATUS_PREFIX`    |       `·[`       | Префіксперед підсекцією Git-статусу                          |
| `SPACESHIP_GIT_STATUS_SUFFIX`    |       `]`        | Suffix after Git status subsection                           |
| `SPACESHIP_GIT_STATUS_COLOR`     |      `red`       | Color of Git status subsection                               |
| `SPACESHIP_GIT_STATUS_UNTRACKED` |       `?`        | Indicator for untracked changes                              |
| `SPACESHIP_GIT_STATUS_ADDED`     |       `+`        | Indicator for added changes                                  |
| `SPACESHIP_GIT_STATUS_MODIFIED`  |       `!`        | Indicator for unstaged files                                 |
| `SPACESHIP_GIT_STATUS_RENAMED`   |       `»`        | Indicator for renamed files                                  |
| `SPACESHIP_GIT_STATUS_DELETED`   |       `✘`        | Індикатор видалених файлів                                   |
| `SPACESHIP_GIT_STATUS_STASHED`   |       `$`        | Indicator for stashed changes                                |
| `SPACESHIP_GIT_STATUS_UNMERGED`  |       `=`        | Indicator for unmerged changes                               |
| `SPACESHIP_GIT_STATUS_AHEAD`     |       `⇡`        | Indicator for unpushed changes (ahead of remote branch)      |
| `SPACESHIP_GIT_STATUS_BEHIND`    |       `⇣`        | Indicator for unpulled changes (behind of remote branch)     |
| `SPACESHIP_GIT_STATUS_DIVERGED`  |       `⇕`        | Indicator for diverged changes (diverged with remote branch) |
