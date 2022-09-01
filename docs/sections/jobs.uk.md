# Jobs `jobs`

The `jobs` section shows only when there are running jobs in the background.

## Set the threshold after which the job count is shown

The `SPACESHIP_JOBS_AMOUNT_THRESHOLD` environment variable defines the threshold after which the number of running jobs will be shown.

```zsh title=".zshrc"
# The job count will be displayed even there is a single background job
SPACESHIP_JOBS_AMOUNT_THRESHOLD=0
```

## Options

| Variable                          | Default | Meaning                                                                   |
|:--------------------------------- |:-------:| ------------------------------------------------------------------------- |
| `SPACESHIP_JOBS_SHOW`             | `true`  | Show section                                                              |
| `SPACESHIP_JOBS_PREFIX`           |    -    | Section's prefix                                                          |
| `SPACESHIP_JOBS_SUFFIX`           |   `·`   | Section's suffix                                                          |
| `SPACESHIP_JOBS_SYMBOL`           |   `✦`   | Symbol displayed when jobs are hiding                                     |
| `SPACESHIP_JOBS_COLOR`            | `blue`  | Section's color                                                           |
| `SPACESHIP_JOBS_AMOUNT_PREFIX`    |    -    | Prefix before the number of jobs (between jobs indicator and jobs amount) |
| `SPACESHIP_JOBS_AMOUNT_SUFFIX`    |    -    | Suffix after the number of jobs                                           |
| `SPACESHIP_JOBS_AMOUNT_THRESHOLD` |   `1`   | Number of jobs after which job count will be shown                        |
