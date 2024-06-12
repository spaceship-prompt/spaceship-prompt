# Git `git`

!!! important "This section is rendered asynchronously by default"

The `git` section consists of [`git_branch`](#git-branch-git_branch), [`git_tag`](#git-tag-git_tag), [`git_status`](#git-status-git_status), [`git_diff`](#git-diff-git_diff), [`git_hash`](#git-hash-git_hash) and
[`git_commit_msg`](#git-commit_msg-git_commit_msg),subsections.

## Options

| Variable               | Default                                                            | Meaning                                                                                                     |
|:-----------------------|:------------------------------------------------------------------:|-------------------------------------------------------------------------------------------------------------|
| `SPACESHIP_GIT_SHOW`   | `true`                                                             | Show section                                                                                                |
| `SPACESHIP_GIT_ASYNC`  | `true`                                                             | Render section asynchronously                                                                               |
| `SPACESHIP_GIT_PREFIX` | `on·`                                                              | Section's prefix                                                                                            |
| `SPACESHIP_GIT_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX`                                 | Section's suffix                                                                                            |
| `SPACESHIP_GIT_SYMBOL` | ``                                                                | Symbol displayed before the section (requires [powerline patched font](https://github.com/powerline/fonts)) |
| `SPACESHIP_GIT_ORDER`  | `(git_branch git_tag git_status git_diff git_hash git_commit_msg)` | Order of git subsection rendering                                                                           |
|                        |                                                                    |                                                                                                             |

## Git branch `git_branch`

The `git_branch` section displays the current branch of the Git repository.

### Options

| Variable                      | Default                 | Meaning                       |
|:------------------------------|:-----------------------:|-------------------------------|
| `SPACESHIP_GIT_BRANCH_SHOW`   | `true`                  | Show section                  |
| `SPACESHIP_GIT_BRANCH_ASYNC`  | `true`                  | Render section asynchronously |
| `SPACESHIP_GIT_BRANCH_PREFIX` | `$SPACESHIP_GIT_SYMBOL` | Section's prefix              |
| `SPACESHIP_GIT_BRANCH_SUFFIX` | ` `                     | Section's suffix              |
| `SPACESHIP_GIT_BRANCH_COLOR`  | `magenta`               | Section's color               |

## Git branch `git_tag`

The `git_tag` section displays the current branch tag of the Git repository.

### Options

| Variable                   | Default | Meaning                       |
|:---------------------------|:-------:|-------------------------------|
| `SPACESHIP_GIT_TAG_SHOW`   | `true`  | Show section                  |
| `SPACESHIP_GIT_TAG_ASYNC`  | `true`  | Render section asynchronously |
| `SPACESHIP_GIT_TAG_PREFIX` | ` @`    | Section's prefix              |
| `SPACESHIP_GIT_TAG_SUFFIX` | ` `     | Section's suffix              |
| `SPACESHIP_GIT_TAG_COLOR`  | `blue`  | Section's color               |

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

## Git branch `git_diff`

The `git_diff` section displays the count of diff (added and removed) for the current branch with the upstream Git repository.

### Options

| Variable                        | Default | Meaning                       |
|:--------------------------------|:-------:|-------------------------------|
| `SPACESHIP_GIT_DIFFSTAT_SHOW`   | `true`  | Show section                  |
| `SPACESHIP_GIT_DIFFSTAT_ASYNC`  | `true` | Render section asynchronously |
| `SPACESHIP_GIT_DIFFSTAT_PREFIX` |         | Section's prefix              |
| `SPACESHIP_GIT_DIFFSTAT_SUFFIX` | ` `     | Section's suffix              |

## Git branch `git_hash`

The `git_hash` section displays the current branch commit hash of the Git repository.

### Options

| Variable                        | Default   | Meaning                       |
|:--------------------------------|:---------:|-------------------------------|
| `SPACESHIP_GIT_GIT_HASH_SHOW`   | `true`    | Show section                  |
| `SPACESHIP_GIT_GIT_HASH_ASYNC`  | `true`    | Render section asynchronously |
| `SPACESHIP_GIT_GIT_HASH_PREFIX` | ` ※ `     | Section's prefix              |
| `SPACESHIP_GIT_GIT_HASH_SUFFIX` | ` `       | Section's suffix              |
| `SPACESHIP_GIT_GIT_HASH_COLOR`  | `magenta` | Section's collor              |
|                                 |           |                               |

## Git branch `git_commit_msg`

The `git_commit_msg` section displays the current branch commit message of the Git repository.

### Options

| Variable                              | Default | Meaning                       |
|:--------------------------------------|:-------:|-------------------------------|
| `SPACESHIP_GIT_GIT_COMMIT_MSG_SHOW`   | `true`  | Show section                  |
| `SPACESHIP_GIT_GIT_COMMIT_MSG_ASYNC`  | `true`  | Render section asynchronously |
| `SPACESHIP_GIT_GIT_COMMIT_MSG_PREFIX` | ` 📓️ `   | Section's prefix              |
| `SPACESHIP_GIT_GIT_COMMIT_MSG_SUFFIX` | ` `     | Section's suffix              |
| `SPACESHIP_GIT_GIT_COMMIT_MSG_COLOR`  | `black` | Section's collor              |
