# Git `git`

!!! important "This section is rendered asynchronously by default"

The `git` section consists of [`git_branch`](#git-branch-git_branch) and [`git_status`](#git-status-git_status) subsections.

## Options

| Variable               |             Default                | Meaning                                                                                                     |
| :--------------------- | :--------------------------------: | ----------------------------------------------------------------------------------------------------------- |
| `SPACESHIP_GIT_SHOW`   |               `true`               | Show section                                                                                                |
| `SPACESHIP_GIT_ASYNC`  |               `true`               | Render section asynchronously                                                                               |
| `SPACESHIP_GIT_PREFIX` |               `on·`                | Section's prefix                                                                                            |
| `SPACESHIP_GIT_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                                                                                            |
| `SPACESHIP_GIT_SYMBOL` | ![·][branch-image]                | Symbol displayed before the section (requires [powerline patched font](https://github.com/powerline/fonts)) |

## Git branch `git_branch`

The `git_branch` section displays the current branch of the Git repository.

### Options

| Variable                      |         Default         | Meaning                       |
| :---------------------------- | :---------------------: | ----------------------------- |
| `SPACESHIP_GIT_BRANCH_SHOW`   |         `true`          | Show section                  |
| `SPACESHIP_GIT_BRANCH_ASYNC`  |         `false`         | Render section asynchronously |
| `SPACESHIP_GIT_BRANCH_PREFIX` | `$SPACESHIP_GIT_SYMBOL` | Section's prefix              |
| `SPACESHIP_GIT_BRANCH_SUFFIX` |           ` `           | Section's suffix              |
| `SPACESHIP_GIT_BRANCH_COLOR`  |        `magenta`        | Section's color               |

## Git status `git_status`

The `git_status` subsection displays indicators only when you have a dirty Git repository.

### Options

| Variable                         | Default | Meaning                                                      |
| :------------------------------- | :-----: | ------------------------------------------------------------ |
| `SPACESHIP_GIT_STATUS_SHOW`      | `true`  | Show section                                                 |
| `SPACESHIP_GIT_STATUS_ASYNC`     | `true`  | Render section asynchronously                                |
| `SPACESHIP_GIT_STATUS_PREFIX`    |  `·[`   | Prefix before Git status subsection                          |
| `SPACESHIP_GIT_STATUS_SUFFIX`    |   `]`   | Suffix after Git status subsection                           |
| `SPACESHIP_GIT_STATUS_COLOR`     |  `red`  | Color of Git status subsection                               |
| `SPACESHIP_GIT_STATUS_UNTRACKED` |   `?`   | Indicator for untracked changes                              |
| `SPACESHIP_GIT_STATUS_ADDED`     |   `+`   | Indicator for added changes                                  |
| `SPACESHIP_GIT_STATUS_MODIFIED`  |   `!`   | Indicator for unstaged files                                 |
| `SPACESHIP_GIT_STATUS_RENAMED`   |   `»`   | Indicator for renamed files                                  |
| `SPACESHIP_GIT_STATUS_DELETED`   |   `✘`   | Indicator for deleted files                                  |
| `SPACESHIP_GIT_STATUS_STASHED`   |   `$`   | Indicator for stashed changes                                |
| `SPACESHIP_GIT_STATUS_UNMERGED`  |   `=`   | Indicator for unmerged changes                               |
| `SPACESHIP_GIT_STATUS_AHEAD`     |   `⇡`   | Indicator for unpushed changes (ahead of remote branch)      |
| `SPACESHIP_GIT_STATUS_BEHIND`    |   `⇣`   | Indicator for unpulled changes (behind of remote branch)     |
| `SPACESHIP_GIT_STATUS_DIVERGED`  |   `⇕`   | Indicator for diverged changes (diverged with remote branch) |

<!-- References -->
[branch-image]: https://user-images.githubusercontent.com/3459374/34947621-4f324a92-fa13-11e7-9b99-cdba2cdda6b9.png
