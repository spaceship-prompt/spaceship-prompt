# .NET `dotnet`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**.NET**](https://dotnet.microsoft.com/) is a framework including a large class library for building various applications with languages like C#, F#, or Visual Basic.

The `dotnet` section displays the version of the .NET framework installed on the system.

This section is displayed only when the current directory:

* Is within a .NET project (upsearch finds a `project.json`, `global.json`, or `packet.dependecies` file)
* Contains a `.csproj`, `.fsproj`, or `.xproj` file
* Contains a `.sln` file

## Options

| Variable                  |              Default               | Meaning                       |
|:------------------------- |:----------------------------------:| ----------------------------- |
| `SPACESHIP_DOTNET_SHOW`   |               `true`               | Show section                  |
| `SPACESHIP_DOTNET_ASYNC`  |               `true`               | Render section asynchronously |
| `SPACESHIP_DOTNET_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix              |
| `SPACESHIP_DOTNET_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix              |
| `SPACESHIP_DOTNET_SYMBOL` |              `.NET·`               | Symbol before the section     |
| `SPACESHIP_DOTNET_COLOR`  |               `128`                | Section's color               |
