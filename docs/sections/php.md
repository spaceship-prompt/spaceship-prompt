# PHP `php`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**PHP**](https://www.php.net) is a widely-used general-purpose scripting language that is especially suited for web development and can be embedded into HTML.

The `php` section displays the version of the PHP.

This section is displayed only when the current directory is within a PHP project, meaning:

* Upsearch finds a `composer.json` file
* Current directory contains any `.php` file

## Options

| Variable               |              Default               | Meaning                             |
| :--------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_PHP_SHOW`   |              `true`                | Show section                        |
| `SPACESHIP_PHP_ASYNC`  |              `true`                | Render section asynchronously       |
| `SPACESHIP_PHP_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_PHP_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_PHP_SYMBOL` |               `🐘·`                | Symbol displayed before the section |
| `SPACESHIP_PHP_COLOR`  |               `blue`               | Section's color                     |
