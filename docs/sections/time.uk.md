# Час `time`

!!! warning "Цю секцію приховано за замовчуванням"

The `time` section displays the timestamp of the prompt.

## Відображення секції

Set `SPACESHIP_TIME_SHOW` to `true` in your `.zshrc`, if you need to show timestamps:

```zsh title=".zshrc"
SPACESHIP_TIME_SHOW=true
```

## Форматування дати

You can set custom formatting for the timestamps. To use a 12-hour format just toggle `SPACESHIP_TIME_12HOUR` to `true`:

```zsh title=".zshrc"
SPACESHIP_TIME_12HR=true
```

Additionally, you can set virtually any formatting supported by [ZSH date formats](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Date-and-time) for the timestamps using `SPACESHIP_TIME_FORMAT`:

```zsh title=".zshrc"
SPACESHIP_TIME_FORMAT='%D{%H:%M:%S.%.}'
```

## Опції

| Змінна                  |          За замовчуванням          | Пояснення                                              |
|:----------------------- |:----------------------------------:| ------------------------------------------------------ |
| `SPACESHIP_TIME_SHOW`   |              `false`               | Show section (set to `true` for enabling)              |
| `SPACESHIP_TIME_PREFIX` |               `at·`                | Префікс секції                                         |
| `SPACESHIP_TIME_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                          |
| `SPACESHIP_TIME_COLOR`  |              `yellow`              | Колір секції                                           |
| `SPACESHIP_TIME_FORMAT` |                 -                  | Власне форматування дати                               |
| `SPACESHIP_TIME_12HR`   |              `false`               | Формат часу, використовуючи 12-годинний формат (am/pm) |
