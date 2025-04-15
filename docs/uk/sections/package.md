# Версія пакету `package`

!!! important "Типово ця секція обробляється асинхронно"

!!! note
    Це версія пакета, з яким ви працюєте, а не версія менеджера пакетів. Багато людей використовують натомість термін `project` замість `package`, але в цьому контексті це теж саме.

!!! attention
    У цій секції використовуються зовнішні інструменти для визначення версій пакетів.

    `yq`, `jq`, `python` або `node` використовуються для аналізу версії пакетів у файлах JSON/YAML/TOML/XML. Встановіть [jq](https://stedolan.github.io/jq/) та/або [yq](https://kislyuk.github.io/yq/), щоб отримати більше інформації в цій секції.

Секція `package` показується, якщо поточна тека містить пакет.

## Підтримувані менеджери пакетів

Наразі підтримуються ці пакетні менеджери:

* [`npm`][npm] — версія отримується з файлу `package.json`. Також показується версія приватних (неопублікованих в репозиторії npm пакетів).
* [`lerna`][lerna] — версія отримується з файлу `lerna.json`.
* [`cargo`][cargo] — версія отримується з файлу `Cargo.toml`. `cargo pkgid` використовується для визначення версії, яка залежить від `Cargo.lock`. Запустіть `cargo build`, щоб створити `Cargo.lock`, якщо версія не показується.
* [`composer`][composer] — версія отримується з файлу `composer.json`.
* [`julia`][julia] — версія отримується з файлу `Project.toml`.
* [`Maven`][maven] — версія отримується з команди `mvn`.
* [`gradle`][gradle] — версія отримується з команди `gradle`.
* [`python`][python] — версія отримується з `pyproject.toml`, або в форматі [`setuptools`][setuptools], або — [`poetry`][poetry].
* [`dart`][dart] — версія отримується з файлу `pubspec.yaml`.

## Опції

| Змінна                           |          За замовчуванням          | Пояснення                               |
|:-------------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_PACKAGE_SHOW`         |               `true`               | Показати секцію                         |
| `SPACESHIP_PACKAGE_ASYNC`        |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_PACKAGE_SHOW_PRIVATE` |              `false`               | Показувати, коли пакет є приватним      |
| `SPACESHIP_PACKAGE_PREFIX`       |               `is·`                | Префікс секції                          |
| `SPACESHIP_PACKAGE_SUFFIX`       | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_PACKAGE_SYMBOL`       |                `📦·`                | Символ, що відображається перед секцією |
| `SPACESHIP_PACKAGE_COLOR`        |               `red`                | Колір секції                            |

<!-- References -->
[npm]: https://www.npmjs.com
[lerna]: https://lerna.io
[cargo]: https://crates.io
[composer]: https://getcomposer.org
[julia]: https://julialang.org
[maven]: https://maven.apache.org
[gradle]: https://gradle.org
[python]: https://python.org
[setuptools]: https://setuptools.pypa.io/en/latest/userguide/pyproject_config.html
[poetry]: https://python-poetry.org/docs/pyproject/
[dart]: https://dart.dev
