# .NET `dotnet`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**.NET**](https://dotnet.microsoft.com/) is a framework including a large class library for building various applications with languages like C#, F#, or Visual Basic.

The `dotnet` section displays the version of the .NET framework installed on the system.

Ця секція відображається лише тоді, коли:

* Is within a .NET project (upsearch finds a `project.json`, `global.json`, or `packet.dependecies` file)
* Contains a `.csproj`, `.fsproj`, or `.xproj` file
* Contains a `.sln` file

## Опції

| Змінна                    |          За замовчуванням          | Пояснення                   |
|:------------------------- |:----------------------------------:| --------------------------- |
| `SPACESHIP_DOTNET_SHOW`   |               `true`               | Show section                |
| `SPACESHIP_DOTNET_ASYNC`  |               `true`               | Рендерити секцію асинхронно |
| `SPACESHIP_DOTNET_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix            |
| `SPACESHIP_DOTNET_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції               |
| `SPACESHIP_DOTNET_SYMBOL` |              `.NET·`               | Symbol before the section   |
| `SPACESHIP_DOTNET_COLOR`  |               `128`                | Колір секції                |
