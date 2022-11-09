# Час виконання `exec_time`

Секція `exec_time` відображає час виконання останньої команди. Відображається, якщо він перевищує встановлений поріг часу (2 секунди за замовчуванням).

## Встановлення порогу

Якщо ви не задоволені стандартним порогом 2 секунд, ви можете визначити його за допомогою опції `SPACESHIP_EXEC_TIME_ELAPSED`.

```zsh title=".zshrc"
# This sets threshold to 5 seconds
SPACESHIP_EXEC_TIME_ELAPSED=5
```

## Встановлення точності

За замовчуванням точність часу встановлюється на 1 цифру після коми. Ви можете змінити його за допомогою опції `SPACESHIP_EXEC_TIME_PRECISION`.

```zsh title=".zshrc"
# This sents precision to 2 digits
SPACESHIP_EXEC_TIME_PRECISION=2
```

## Опції

| Змінна                          |          За замовчуванням          | Пояснення                                                        |
|:------------------------------- |:----------------------------------:| ---------------------------------------------------------------- |
| `SPACESHIP_EXEC_TIME_SHOW`      |               `true`               | Показати секцію                                                  |
| `SPACESHIP_EXEC_TIME_PREFIX`    |              `took·`               | Префікс секції                                                   |
| `SPACESHIP_EXEC_TIME_SUFFIX`    | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                                    |
| `SPACESHIP_EXEC_TIME_COLOR`     |              `yellow`              | Колір секції                                                     |
| `SPACESHIP_EXEC_TIME_ELAPSED`   |                `2`                 | The minimum number of seconds for showing execution time section |
| `SPACESHIP_EXEC_TIME_PRECISION` |                `1`                 | Number of digits to use in the fractional part of the time value |
