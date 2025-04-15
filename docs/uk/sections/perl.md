# Perl `perl`

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Perl**](https://www.perl.org/) — це мова програмування загального призначення, спочатку розроблена для роботи з текстом.

Секція `perl` показує версію Perl.

Ця секція показується лише тоді, коли поточна тека є текою проєкту Perl, тобто:

* Пошук знаходить файли`META.json`, `META.yml`, `META.yaml`, `.perl-version` чи `cpanfile`
* Поточна тека містить файли `.pl` чи `.pm`

## Параметри

| Змінна                  |               Типово               | Опис                                     |
|:----------------------- |:----------------------------------:| ---------------------------------------- |
| `SPACESHIP_PERL_SHOW`   |               `true`               | Показати секцію                          |
| `SPACESHIP_PERL_ASYNC`  |               `true`               | Обробляти секцію асинхронно              |
| `SPACESHIP_PERL_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                           |
| `SPACESHIP_PERL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                            |
| `SPACESHIP_PERL_SYMBOL` |                `🐪·`                | Символ, що показується на початку секції |
| `SPACESHIP_PERL_COLOR`  |               `blue`               | Колір секції                             |
