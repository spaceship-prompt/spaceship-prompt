# Налаштування командного рядка

Ця сторінка описує опції командного рядка Spaceship.

## Термінологія

Командний рядок складається з **секцій**. Всі секції поєднуються в [**послідовність командного рядка**](#prompt-order).

Під час процесу відображення командний рядок проходить по послідовності та викликає кожну секцію. Якщо ви хочете додати власну секцію – додайте її в послідовність. Ви можете додавати чи вилучати секціїї з послідовності командного рядка в будь-який час.

Типова секція складається з **префіксу**, **символу**, **змісту** та **суфіксу**. Символ та зміст виділяються **кольором**. Ось приклад для секції `package`:

```
is 📦 3.16.5
```

У наведеному вище, `is` є префіксом, `📦` символом, `3.16.5` змістом, а `` (пробіл) суфіксом.

Кожна складова секції може бути налаштована за допомогою відповідних **опцій**. Опції це звичайні змінні середовища з такою сигнатурою: `SPACESHIP_<SECTION>_<OPTION>`:

```zsh
# SPACESHIP_<SECTION>_<OPTION>
  SPACESHIP_PACKAGE_PREFIX="via·"
  SPACESHIP_PACKAGE_SUFFIX=" "
  SPACESHIP_PACKAGE_COLOR="green"
```

У прикладі вище `PACKAGE` це **секція**, а `PREFIX`, `SUFFIX` та `COLOR` це **опції** для префіксу, суфіксу та кольору відповідно.

!!! інформація
    Допускається використання [базових кольорів](https://wiki.archlinux.org/index.php/zsh#Colors) або [кольорових кодів](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).

## Послідовність командного рядка

**Послідовність командного рядка** визначає порядок, в якому секції виконуються і відображаються. Порядок секцій у командному рядку контролюється опцією `SPACESHIP_PROMPT_ORDER`.

За замовчуванням, порядок секцій наступний:

```zsh
SPACESHIP_PROMPT_ORDER=(
  time          # Секція часу
  user          # Секція імені користувача
  dir           # Секція поточної директорії
  host          # Секція імені хоста
  git           # Секція Git (git_branch + git_status)
  hg            # Секція Mercurial (hg_branch  + hg_status)
  package       # Секція пакунку
  node          # Секція Node.js
  ruby          # Секція Ruby
  python        # Секція Python
  elm           # Секція Elm
  elixir        # Секція Elixir
  xcode         # Секція Xcode
  swift         # Секція Swift
  golang        # Секція Go
  php           # Секція PHP
  rust          # Секція Rust
  haskell       # Секція Haskell Stack
  java          # Секція Java
  julia         # Секція Julia
  docker        # Секція Docker
  aws           # Секція Amazon Web Services
  gcloud        # Секція Google Cloud Platform
  venv          # Секція virtualenv
  conda         # Секція conda virtualenv
  dotnet        # Секція .NET
  kubectl       # Секція Kubectl context
  terraform     # Секція Terraform workspace
  ibmcloud      # Секція IBM Cloud
  exec_time     # Час виконання
  async         # Індикатор асинхронних задач
  line_sep      # Символ нового рядка
  battery       # Рівень та статус батареї
  jobs          # Індикатор фонових задач
  exit_code     # Код виходу
  char          # Символ командного рядка
)
```

You can add or remove sections using `spaceship add` and `spaceship remove` commands, like this:

```zsh
# Removes git out of the prompt
spaceship remove git

# Adds git back to the prompt
spaceship add git
```

### Right prompt order

You can also add items to the right prompt by specifying them in the `SPACESHIP_RPROMPT_ORDER` option. By default, `SPACESHIP_RPROMPT_ORDER` is an empty array.

## Configuring sections

You can customize every section of the prompt with section's options. Check out each section's documentation for more information.

Besides built-in sections, you can add external section to your prompt or build a custom one.

[Browse built-in sections](/sections ""){.md-button} [Browse all sections](/registry ""){.md-button}

## Prompt-level options

This group of options defines a behavior of prompt and standard parameters for sections displaying.

| Змінна                               | Default | Meaning                                          |
|:------------------------------------ |:-------:| ------------------------------------------------ |
| `SPACESHIP_PROMPT_ASYNC`             | `true`  | Render prompt asynchronously or not              |
| `SPACESHIP_PROMPT_ADD_NEWLINE`       | `true`  | Adds a newline character before each prompt line |
| `SPACESHIP_PROMPT_SEPARATE_LINE`     | `true`  | Make the prompt span across two lines            |
| `SPACESHIP_PROMPT_FIRST_PREFIX_SHOW` | `false` | Shows a prefix of the first section in prompt    |
| `SPACESHIP_PROMPT_PREFIXES_SHOW`     | `true`  | Show prefixes before prompt sections or not      |
| `SPACESHIP_PROMPT_SUFFIXES_SHOW`     | `true`  | Show suffixes before prompt sections or not      |
| `SPACESHIP_PROMPT_DEFAULT_PREFIX`    | `via·`  | Default prefix for prompt sections               |
| `SPACESHIP_PROMPT_DEFAULT_SUFFIX`    |   ``    | Default suffix for prompt section                |

Here is a breakdown of these options:

### Asynchronous rendering

The `SPACESHIP_PROMPT_ASYNC` option defines whether the prompt is rendered asynchronously or not. By default, the prompt is rendered asynchronously.

The synchronous sections are displayed immediately. The asynchronous sections are processed in the background and are displayed when the information is ready to be displayed.

The [`async` section](/sections/async) is used as a placeholder for not yet available asynchronous sections.

### Prompt spacing

Spaceship adds and empty line between each prompt. You can disable this behavior by setting `SPACESHIP_PROMPT_ADD_NEWLINE` to `false`.

The prompt is also separated by a line break if `SPACESHIP_PROMPT_SEPARATE_LINE` is set to `true`.

### Displaying the first section prefix

Spaceship hides the prefix of the first section in the prompt. You can enable this behavior by setting `SPACESHIP_PROMPT_FIRST_PREFIX_SHOW` to `true`.

### Displaying prefixes and suffixes

You can disable the displaying of prefixes and suffixes by setting `SPACESHIP_PROMPT_PREFIXES_SHOW` and `SPACESHIP_PROMPT_SUFFIXES_SHOW` to `false`.

Additionally, you can change the default prefix and suffix by setting `SPACESHIP_PROMPT_DEFAULT_PREFIX` and `SPACESHIP_PROMPT_DEFAULT_SUFFIX`. These options will be used to render prefixes or suffixes unless the corresponding section option is set.
