# Directory `dir`

The `dir` section displays the current working directory.

The directory is always shown and truncated to the value of `SPACESHIP_DIR_TRUNC` (3 levels by default).

## Inside the repositories

While you are in a repository, it shows only the root directory of the repository and folders inside it.

If you don't like this behavior, you can disable it by setting `SPACESHIP_DIR_TRUNC_REPO` to `false`:

```zsh title=".zshrc"
SPACESHIP_DIR_TRUNC_REPO=false
```

## Inside the write-protected directories

If the current directory is write-protected or if the current user doesn't have write permissions, a padlock (by default) is displayed as a suffix.

## Options

| Variable                     |              Default               | Meaning                                                                             |
|:---------------------------- |:----------------------------------:| ----------------------------------------------------------------------------------- |
| `SPACESHIP_DIR_SHOW`         |               `true`               | Show section                                                                        |
| `SPACESHIP_DIR_PREFIX`       |               `in·`                | Section's prefix                                                                    |
| `SPACESHIP_DIR_SUFFIX`       | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                                                                    |
| `SPACESHIP_DIR_TRUNC`        |                `3`                 | Number of folders of cwd to show in prompt, 0 to show all                           |
| `SPACESHIP_DIR_TRUNC_PREFIX` |                 -                  | Prefix before cwd when it's truncated. For example `…/` or `.../`, empty to disable |
| `SPACESHIP_DIR_TRUNC_REPO`   |               `true`               | While in `git` repo, show only root directory and folders inside it                 |
| `SPACESHIP_DIR_COLOR`        |               `cyan`               | Section's color                                                                     |
| `SPACESHIP_DIR_LOCK_SYMBOL`  |              ![·][1]              | The symbol displayed if directory is write-protected                                |
| `SPACESHIP_DIR_LOCK_COLOR`   |               `red`                | Color for the lock symbol                                                           |

<!-- References -->

[1]: https://user-images.githubusercontent.com/10276208/46248218-4af95d80-c434-11e8-8e25-595d792503f1.png
