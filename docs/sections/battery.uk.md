# Батарея `battery`

!!! important "За замовчуванням ця секція рендериться асинхронно"

The `battery` section shows the current battery level and its status.

By default, the `battery` section is shown only if the battery level is below `SPACESHIP_BATTERY_THRESHOLD` (10% by default).

## Controlling when to show the `battery` section

You may want to show the `battery` section all the time or only when it's fully charged or discharged. It's easy to control when to show the `battery` section by setting the `SPACESHIP_BATTERY_SHOW` option.

Ось можливі значення:

| `SPACESHIP_BATTERY_SHOW` | Нижче порогу | Вище порогу | Повністю заряджена |
|:------------------------:|:------------ |:----------- |:------------------ |
|         `false`          | Приховано    | Приховано   | Приховано          |
|         `always`         | Показано     | Показано    | Показано           |
|          `true`          | Показано     | Приховано   | Приховано          |
|        `charged`         | Показано     | Приховано   | Показано           |

## Опції

| Змінна                                 |          За замовчуванням          | Пояснення                                                     |
|:-------------------------------------- |:----------------------------------:| ------------------------------------------------------------- |
| `SPACESHIP_BATTERY_SHOW`               |               `true`               | Показувати секцію (`true`, `false`, `always` або `charged`)   |
| `SPACESHIP_BATTERY_ASYNC`              |               `true`               | Рендерити секцію асинхронно                                   |
| `SPACESHIP_BATTERY_PREFIX`             |                 ``                 | Префікс підсекції                                             |
| `SPACESHIP_BATTERY_SUFFIX`             | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                                 |
| `SPACESHIP_BATTERY_SYMBOL_CHARGING`    |                `⇡`                 | Symbol displayed before the section if battery is charging    |
| `SPACESHIP_BATTERY_SYMBOL_DISCHARGING` |                `⇣`                 | Symbol displayed before the section if battery is discharging |
| `SPACESHIP_BATTERY_SYMBOL_FULL`        |                `•`                 | Symbol displayed before the section if battery is full        |
| `SPACESHIP_BATTERY_THRESHOLD`          |                 10                 | Battery level below which battery section will be shown       |

