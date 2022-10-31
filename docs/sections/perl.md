# Perl `perl`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Perl**](https://www.perl.org/) is a general purpose programming language, originally developed for text manipulation.

The `perl` section displays the version of the Perl.

This section is displayed only when the current directory is within a Perl project, meaning:

* Upsearch finds a `META.json`, `META.yml`, `META.yaml`, `.perl-version`, or `cpanfile` file
* Current directory contains any `.pl` or `.pm` file

## Options

| Variable                |              Default               | Meaning                             |
| :---------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_PERL_SHOW`   |              `true`                | Show section                        |
| `SPACESHIP_PERL_ASYNC`  |              `true`                | Render section asynchronously       |
| `SPACESHIP_PERL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_PERL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_PERL_SYMBOL` |               `🐪·`                | Symbol displayed before the section |
| `SPACESHIP_PERL_COLOR`  |               `blue`               | Section's color                     |
