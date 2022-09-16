# Time `time`

!!! warning "This section is hidden by default"

The `time` section displays the timestamp of the prompt.

## Displaying the section

Set `SPACESHIP_TIME_SHOW` to `true` in your `.zshrc`, if you need to show timestamps:

```zsh title=".zshrc"
SPACESHIP_TIME_SHOW=true
```

## Date formatting

You can set custom formatting for the timestamps. To use a 12-hour format just toggle `SPACESHIP_TIME_12HOUR` to `true`:

```zsh title=".zshrc"
SPACESHIP_TIME_12HR=true
```

Additionally, you can set virtually any formatting supported by [ZSH date formats](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Date-and-time) for the timestamps using `SPACESHIP_TIME_FORMAT`:

```zsh title=".zshrc"
SPACESHIP_TIME_FORMAT='%D{%H:%M:%S.%.}'
```

## Options

| Variable                |              Default               | Meaning                                   |
|:----------------------- |:----------------------------------:| ----------------------------------------- |
| `SPACESHIP_TIME_SHOW`   |              `false`               | Show section (set to `true` for enabling) |
| `SPACESHIP_TIME_PREFIX` |               `at·`                | Section's prefix                          |
| `SPACESHIP_TIME_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                          |
| `SPACESHIP_TIME_COLOR`  |              `yellow`              | Section's color                           |
| `SPACESHIP_TIME_FORMAT` |                 -                  | Custom date formatting                    |
| `SPACESHIP_TIME_12HR`   |              `false`               | Format time using 12-hour clock (am/pm)   |
