# Dart `dart`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Dart**](https://dart.dev/) is a client-optimized language for fast apps on any platform

The `dart` section displays the current version of Dart.

This section is displayed only when the current directory is within a Dart project, meaning:

* Upsearch finds a `pubspec.yaml`, `pubspec.yml`, `pubspec.lock` file or `dart_tool` folder
* Contains any other file with `.dart` extension

## Опції

| Змінна                  |          За замовчуванням          | Пояснення                               |
|:----------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_DART_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_DART_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_DART_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_DART_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_DART_SYMBOL` |                `🎯·`                | Символ, що відображається перед секцією |
| `SPACESHIP_DART_COLOR`  |               `blue`               | Колір секції                            |
