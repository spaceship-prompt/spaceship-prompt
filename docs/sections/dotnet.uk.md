# .NET `dotnet`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**.NET**](https://dotnet.microsoft.com/) is a framework including a large class library for building various applications with languages like C#, F#, or Visual Basic.

The `dotnet` section displays the version of the .NET framework installed on the system.

Ця секція відображається лише тоді, коли поточна директорія:

* Ви всередині .NET-проєкту (пошук вгору знаходить файли `project.json`, `global.json`, or `packet.dependecies`)
* Містить файли `.csproj`, `.fsproj` або `.xproj`
* Містить файл `.sln`

## Опції

| Змінна                    |          За замовчуванням          | Пояснення                   |
|:------------------------- |:----------------------------------:| --------------------------- |
| `SPACESHIP_DOTNET_SHOW`   |               `true`               | Показати секцію             |
| `SPACESHIP_DOTNET_ASYNC`  |               `true`               | Рендерити секцію асинхронно |
| `SPACESHIP_DOTNET_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції              |
| `SPACESHIP_DOTNET_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції               |
| `SPACESHIP_DOTNET_SYMBOL` |              `.NET·`               | Символ перед секцією        |
| `SPACESHIP_DOTNET_COLOR`  |               `128`                | Колір секції                |
