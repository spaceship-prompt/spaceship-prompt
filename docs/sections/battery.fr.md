# Battery `battery`

!!! important "This section is rendered asynchronously by default"

The `battery` section shows the current battery level and its status.

By default, the `battery` section is shown only if the battery level is below `SPACESHIP_BATTERY_THRESHOLD` (10% by default).

## Controlling when to show the `battery` section

You may want to show the `battery` section all the time or only when it's fully charged or discharged. It's easy to control when to show the `battery` section by setting the `SPACESHIP_BATTERY_SHOW` option.

Here are possible values:

| `SPACESHIP_BATTERY_SHOW` | Below threshold | Above threshold | Fully charged |
|:------------------------:|:--------------- |:--------------- |:------------- |
|         `false`          | Hidden          | Hidden          | Hidden        |
|         `always`         | Shown           | Shown           | Shown         |
|          `true`          | Shown           | Hidden          | Hidden        |
|        `charged`         | Shown           | Hidden          | Shown         |

## Options

| Variable                               |              Default               | Meaning                                                       |
|:-------------------------------------- |:----------------------------------:| ------------------------------------------------------------- |
| `SPACESHIP_BATTERY_SHOW`               |               `true`               | Show section (`true`, `false`, `always` or `charged`)         |
| `SPACESHIP_BATTERY_ASYNC`              |               `true`               | Render section asynchronously                                 |
| `SPACESHIP_BATTERY_PREFIX`             |                 ``                 | Section's prefix                                              |
| `SPACESHIP_BATTERY_SUFFIX`             | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                                              |
| `SPACESHIP_BATTERY_SYMBOL_CHARGING`    |                `⇡`                 | Symbol displayed before the section if battery is charging    |
| `SPACESHIP_BATTERY_SYMBOL_DISCHARGING` |                `⇣`                 | Symbol displayed before the section if battery is discharging |
| `SPACESHIP_BATTERY_SYMBOL_FULL`        |                `•`                 | Symbol displayed before the section if battery is full        |
| `SPACESHIP_BATTERY_THRESHOLD`          |                 10                 | Battery level below which battery section will be shown       |

