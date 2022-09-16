# PHP `php`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**PHP**](https://www.php.net) is a widely-used general-purpose scripting language that is especially suited for web development and can be embedded into HTML.

The `php` section displays the version of the PHP.

This section is displayed only when the current directory is within a PHP project, meaning:

* Upsearch finds a `composer.json` file
* Current directory contains any `.php` file

## Опції

| Змінна                 |              Default               | Meaning                                 |
|:---------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_PHP_SHOW`   |               `true`               | Show section                            |
| `SPACESHIP_PHP_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_PHP_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                        |
| `SPACESHIP_PHP_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_PHP_SYMBOL` |                `🐘·`                | Символ, що відображається перед секцією |
| `SPACESHIP_PHP_COLOR`  |               `blue`               | Колір секції                            |
