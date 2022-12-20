# .NET `dotnet`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info "Інформація"
    [**.NET**](https://dotnet.microsoft.com/) — це фреймворк, що містить велику бібліотеку класів для створення різноманітних застосунків мовами подібним до C#, F#, чи Visual Basic.

Секція `dotnet` показує версію .NET встановленого в системі.

Ця секція відображається лише тоді, коли поточна директорія:

* Ви всередині .NET-проєкту (пошук вгору знаходить файли `project.json`, `global.json`, or `packet.dependecies`)
* Містить файли `.csproj`, `.fsproj` або `.xproj`
* Містить файл `.sln`

## Параметри

| Змінна                    |          За замовчуванням          | Пояснення                   |
|:------------------------- |:----------------------------------:| --------------------------- |
| `SPACESHIP_DOTNET_SHOW`   |               `true`               | Показати секцію             |
| `SPACESHIP_DOTNET_ASYNC`  |               `true`               | Рендерити секцію асинхронно |
| `SPACESHIP_DOTNET_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції              |
| `SPACESHIP_DOTNET_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції               |
| `SPACESHIP_DOTNET_SYMBOL` |              `.NET·`               | Символ перед секцією        |
| `SPACESHIP_DOTNET_COLOR`  |               `128`                | Колір секції                |
