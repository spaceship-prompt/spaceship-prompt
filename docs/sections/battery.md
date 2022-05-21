---
hide: [toc]
---

# Battery `battery`

`battery` section shows the current battery level and its status.

By default, `battery` section is shown only if battery level is below `SPACESHIP_BATTERY_THRESHOLD` (10% by default).

## Controlling when to show `battery` section

You may want to show `battery` section all the time or only when it's fully charged or discharged. It's easy to control when to show `battery` section by setting `SPACESHIP_BATTERY_SHOW` option.

Here are possible values:

| `SPACESHIP_BATTERY_SHOW` | Below threshold | Above threshold | Fully charged |
| :----------------------: | :-------------- | :-------------- | :------------ |
|         `false`          | Hidden          | Hidden          | Hidden        |
|         `always`         | Shown           | Shown           | Shown         |
|          `true`          | Shown           | Hidden          | Hidden        |
|        `charged`         | Shown           | Hidden          | Shown         |

## Options

| Variable                               |              Default               | Meaning                                                              |
| :------------------------------------- | :--------------------------------: | -------------------------------------------------------------------- |
| `SPACESHIP_BATTERY_SHOW`               |               `true`               | Show battery section or not (`true`, `false`, `always` or `charged`) |
| `SPACESHIP_BATTERY_PREFIX`             |                ` `                 | Prefix before battery section                                        |
| `SPACESHIP_BATTERY_SUFFIX`             | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after battery section                                         |
| `SPACESHIP_BATTERY_SYMBOL_CHARGING`    |                `⇡`                 | Character to be shown if battery is charging                         |
| `SPACESHIP_BATTERY_SYMBOL_DISCHARGING` |                `⇣`                 | Character to be shown if battery is discharging                      |
| `SPACESHIP_BATTERY_SYMBOL_FULL`        |                `•`                 | Character to be shown if battery is full                             |
| `SPACESHIP_BATTERY_THRESHOLD`          |                 10                 | Battery level below which battery section will be shown              |

