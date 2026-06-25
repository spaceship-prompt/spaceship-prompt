# Git `git`

!!! important "This section is rendered asynchronously by default"

The `git` section consists of [`git_branch`](#git-branch-git_branch), [`git_status`](#git-status-git_status), [`git_state`](#git-state-git_state) and [`git_commit`](#git-commit-git_commit) subsections.

## Options

| Variable               |              Default               | Meaning                                                                                                     |
| :--------------------- | :--------------------------------: | ----------------------------------------------------------------------------------------------------------- |
| `SPACESHIP_GIT_SHOW`   |               `true`               | Show section                                                                                                |
| `SPACESHIP_GIT_ASYNC`  |               `true`               | Render section asynchronously                                                                               |
| `SPACESHIP_GIT_PREFIX` |               `on·`                | Section's prefix                                                                                            |
| `SPACESHIP_GIT_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                                                                                            |
| `SPACESHIP_GIT_SYMBOL` |                ``                 | Symbol displayed before the section (requires [powerline patched font](https://github.com/powerline/fonts)) |
| `SPACESHIP_GIT_ORDER`  |     `(git_branch git_status)`      | Order of git subsection rendering                                                                           |

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

## Git state `git_state`

The `git_state` subsection displays the active git operation state (if any), such as rebase, merge, revert, cherry-pick, or bisect.

### Options

| Variable                            | Default | Meaning                                |
| :---------------------------------- | :-----: | -------------------------------------- |
| `SPACESHIP_GIT_STATE_SHOW`          | `true`  | Show section                           |
| `SPACESHIP_GIT_STATE_ASYNC`         | `false` | Render section asynchronously          |
| `SPACESHIP_GIT_STATE_PREFIX`        |  ` [`   | Prefix before git state subsection     |
| `SPACESHIP_GIT_STATE_SUFFIX`        |   `]`   | Suffix after git state subsection      |
| `SPACESHIP_GIT_STATE_COLOR`         |  `red`  | Color of git state subsection          |
| `SPACESHIP_GIT_STATE_REBASE_REBASING` | `rebase` | Text shown during rebase             |
| `SPACESHIP_GIT_STATE_REBASE_APPLYING` |  `am`  | Text shown during git am              |
| `SPACESHIP_GIT_STATE_MERGING`       | `merge` | Text shown during merge               |
| `SPACESHIP_GIT_STATE_REVERTING`     | `revert` | Text shown during revert             |
| `SPACESHIP_GIT_STATE_CHERRY_PICKING` | `cherry-pick` | Text shown during cherry-pick    |
| `SPACESHIP_GIT_STATE_BISECTING`     | `bisect` | Text shown during bisect             |

## Git commit `git_commit`

The `git_commit` section displays the current commit hash of the Git repository.

### Options

| Variable                      | Default  | Meaning                             |
| :---------------------------- | :------: | ----------------------------------- |
| `SPACESHIP_GIT_COMMIT_SHOW`   | `false`  | Show section                        |
| `SPACESHIP_GIT_COMMIT_ASYNC`  |  `true`  | Render section asynchronously       |
| `SPACESHIP_GIT_COMMIT_PREFIX` |   ` `    | Section's prefix                    |
| `SPACESHIP_GIT_COMMIT_SUFFIX` |    ``    | Section's suffix                    |
| `SPACESHIP_GIT_COMMIT_SYMBOL` |   `#`    | Symbol displayed before the section |
| `SPACESHIP_GIT_COMMIT_COLOR`  | `yellow` | Section's color                     |
