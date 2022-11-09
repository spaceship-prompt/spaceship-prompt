# Execution time `exec_time`

The `exec_time` section displays the execution time of the last command. Will be displayed if it exceeds the set threshold of time (2 seconds by default).

## Defining the threshold

If you are not satisfied with the default threshold of 2 seconds, you can define it using the `SPACESHIP_EXEC_TIME_ELAPSED` option.

```zsh title=".zshrc"
# This sets threshold to 5 seconds
SPACESHIP_EXEC_TIME_ELAPSED=5
```

## Defining precision

By default time precision is set to 1 digit after the decimal point. You can change it using the `SPACESHIP_EXEC_TIME_PRECISION` option.

```zsh title=".zshrc"
# This sents precision to 2 digits
SPACESHIP_EXEC_TIME_PRECISION=2
```

## Options

| Variable                        |              Default               | Meaning                                                          |
|:------------------------------- |:----------------------------------:| ---------------------------------------------------------------- |
| `SPACESHIP_EXEC_TIME_SHOW`      |               `true`               | Show section                                                     |
| `SPACESHIP_EXEC_TIME_PREFIX`    |              `took·`               | Section's prefix                                                 |
| `SPACESHIP_EXEC_TIME_SUFFIX`    | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                                                 |
| `SPACESHIP_EXEC_TIME_COLOR`     |              `yellow`              | Section's color                                                  |
| `SPACESHIP_EXEC_TIME_ELAPSED`   |                `2`                 | The minimum number of seconds for showing execution time section |
| `SPACESHIP_EXEC_TIME_PRECISION` |                `1`                 | Number of digits to use in the fractional part of the time value |
