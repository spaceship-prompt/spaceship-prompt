# Завдання `jobs`

The `jobs` section shows only when there are running jobs in the background.

## Встановлення порогу при якому відображається кількість завдань

The `SPACESHIP_JOBS_AMOUNT_THRESHOLD` environment variable defines the threshold after which the number of running jobs will be shown.

```zsh title=".zshrc"
# The job count will be displayed even there is a single background job
SPACESHIP_JOBS_AMOUNT_THRESHOLD=0
```

## Опції

| Змінна                            | За замовчуванням | Пояснення                                                                 |
|:--------------------------------- |:----------------:| ------------------------------------------------------------------------- |
| `SPACESHIP_JOBS_SHOW`             |      `true`      | Показати секцію                                                           |
| `SPACESHIP_JOBS_PREFIX`           |        -         | Префікс секції                                                            |
| `SPACESHIP_JOBS_SUFFIX`           |       `·`        | Суфікс секції                                                             |
| `SPACESHIP_JOBS_SYMBOL`           |       `✦`        | Символ, що відображається, коли завдання приховуються                     |
| `SPACESHIP_JOBS_COLOR`            |      `blue`      | Колір секції                                                              |
| `SPACESHIP_JOBS_AMOUNT_PREFIX`    |        -         | Prefix before the number of jobs (between jobs indicator and jobs amount) |
| `SPACESHIP_JOBS_AMOUNT_SUFFIX`    |        -         | Suffix after the number of jobs                                           |
| `SPACESHIP_JOBS_AMOUNT_THRESHOLD` |       `1`        | Кількість завдань, після яких кількість завдань буде показана             |
