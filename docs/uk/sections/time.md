# Час `time`

!!! warning "Типово ця секція є прихованою"

Секція `time` показує час в командному рядку.

## Відображення секції

Встановить `SPACESHIP_TIME_SHOW` в `true` у вашому `.zshrc`, якщо вам потрібно показувати час:

```zsh title=".zshrc"
SPACESHIP_TIME_SHOW=true
```

## Форматування дати

Ви можете обрати власний формат для показу часу. Для використання 12-годинного формату просто перемкніть `SPACESHIP_TIME_12HOUR` на `true`:

```zsh title=".zshrc"
SPACESHIP_TIME_12HR=true
```

Додатково ви можете встановити практично будь-яке форматування, підтримуване у [форматах дати ZSH](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Date-and-time) для позначок часу з використанням `SPACESHIP_TIME_FORMAT`:

```zsh title=".zshrc"
SPACESHIP_TIME_FORMAT='%D{%H:%M:%S.%.}'
```

## Опції

| Змінна                  |          За замовчуванням          | Пояснення                                              |
|:----------------------- |:----------------------------------:| ------------------------------------------------------ |
| `SPACESHIP_TIME_SHOW`   |              `false`               | Показувати секцію (для показу встановіть `true`)       |
| `SPACESHIP_TIME_PREFIX` |               `at·`                | Префікс секції                                         |
| `SPACESHIP_TIME_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                          |
| `SPACESHIP_TIME_COLOR`  |              `yellow`              | Колір секції                                           |
| `SPACESHIP_TIME_FORMAT` |                 -                  | Власне форматування дати                               |
| `SPACESHIP_TIME_12HR`   |              `false`               | Формат часу, використовуючи 12-годинний формат (am/pm) |
