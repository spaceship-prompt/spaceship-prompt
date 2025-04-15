# Prompt configuration

This page describes prompt-level options for Spaceship.

## Terminology

The prompt consists of **sections**. All sections are combined into a [**prompt order**](#prompt-order).

When the prompt is being rendered, just goes over the prompt order and executes each section. If you want to add a custom section, add it to the order. You can add or remove sections from the prompt order at any time.

Typically, a section consist of a **prefix**, **symbol**, **content** and **suffix**. The symbol and the content are painted in **color**. Here's an example with a `package` section:

```
is 📦 3.16.5
```

Above, `is ` is a prefix, `📦` is a symbol, `3.16.5` is the content and ` ` (a space) is the suffix.

Each part can be configured via corresponding **options**. Options are just environment variables and have this signature `SPACESHIP_<SECTION>_<OPTION>`:

```zsh
# SPACESHIP_<SECTION>_<OPTION>
  SPACESHIP_PACKAGE_PREFIX="via·"
  SPACESHIP_PACKAGE_SUFFIX=" "
  SPACESHIP_PACKAGE_COLOR="green"
```

Above `PACKAGE` is a **section** and `PREFIX`, `SUFFIX` and `COLOR` are **options** for prefix, suffix and color correspondingly.

!!! info
    Colors for sections can be [basic colors](https://wiki.archlinux.org/index.php/zsh#Colors) or [color codes](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).

## Prompt order

The **prompt order** is the order in which sections are executed and rendered. You can specify the order of prompt section using `SPACESHIP_PROMPT_ORDER` option.

The default prompt order is:

```zsh
SPACESHIP_PROMPT_ORDER=(
  time           # Time stamps section
  user           # Username section
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status)
  hg             # Mercurial section (hg_branch  + hg_status)
  package        # Package version
  node           # Node.js section
  bun            # Bun section
  deno           # Deno section
  ruby           # Ruby section
  python         # Python section
  elm            # Elm section
  elixir         # Elixir section
  xcode          # Xcode section
  swift          # Swift section
  golang         # Go section
  perl           # Perl section
  php            # PHP section
  rust           # Rust section
  haskell        # Haskell Stack section
  scala          # Scala section
  kotlin         # Kotlin section
  java           # Java section
  lua            # Lua section
  dart           # Dart section
  julia          # Julia section
  crystal        # Crystal section
  docker         # Docker section
  docker_compose # Docker section
  aws            # Amazon Web Services section
  gcloud         # Google Cloud Platform section
  azure          # Azure section
  venv           # virtualenv section
  conda          # conda virtualenv section
  uv             # uv section
  dotnet         # .NET section
  ocaml          # OCaml section
  vlang          # V section
  zig            # Zig section
  purescript     # PureScript section
  erlang         # Erlang section
  gleam          # Gleam section
  kubectl        # Kubectl context section
  ansible        # Ansible section
  terraform      # Terraform workspace section
  pulumi         # Pulumi stack section
  ibmcloud       # IBM Cloud section
  nix_shell      # Nix shell
  gnu_screen     # GNU Screen section
  exec_time      # Execution time
  async          # Async jobs indicator
  line_sep       # Line break
  battery        # Battery level and status
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
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

[Browse built-in sections](../sections/index.md){ .md-button }
[Browse all sections](../registry.md){ .md-button }

## Prompt-level options

This group of options defines a behavior of prompt and standard parameters for sections displaying.

| Variable                              | Default | Meaning                                             |
| :------------------------------------ | :-----: | --------------------------------------------------- |
| `SPACESHIP_PROMPT_ASYNC`              | `true`  | Render prompt asynchronously or not                 |
| `SPACESHIP_PROMPT_ADD_NEWLINE`        | `true`  | Adds a newline character before each prompt line    |
| `SPACESHIP_PROMPT_SEPARATE_LINE`      | `true`  | Make the prompt span across two lines               |
| `SPACESHIP_PROMPT_FIRST_PREFIX_SHOW`  | `false` | Shows a prefix of the first section in prompt       |
| `SPACESHIP_RPROMPT_FIRST_PREFIX_SHOW` | `false` | Shows a prefix of the first section in right prompt |
| `SPACESHIP_PROMPT_PREFIXES_SHOW`      | `true`  | Show prefixes before prompt sections or not         |
| `SPACESHIP_PROMPT_SUFFIXES_SHOW`      | `true`  | Show suffixes before prompt sections or not         |
| `SPACESHIP_PROMPT_DEFAULT_PREFIX`     | `via·`  | Default prefix for prompt sections                  |
| `SPACESHIP_PROMPT_DEFAULT_SUFFIX`     |   ` `   | Default suffix for prompt section                   |

Here is a breakdown of these options:

### Asynchronous rendering

The `SPACESHIP_PROMPT_ASYNC` option defines whether the prompt is rendered asynchronously or not. By default, the prompt is rendered asynchronously.

The synchronous sections are displayed immediately. The asynchronous sections are processed in the background and are displayed when the information is ready to be displayed.

The [`async` section](../sections/async.md) is used as a placeholder for not yet available asynchronous sections.

### Prompt spacing

Spaceship adds an empty line between each prompt. You can disable this behavior by setting `SPACESHIP_PROMPT_ADD_NEWLINE` to `false`.

The prompt is also separated by a line break if `SPACESHIP_PROMPT_SEPARATE_LINE` is set to `true`.

### Displaying the first section prefix

Spaceship hides the prefix of the first section in the prompt. You can enable this behavior by setting `SPACESHIP_PROMPT_FIRST_PREFIX_SHOW` to `true`.

### Displaying prefixes and suffixes

You can disable the displaying of prefixes and suffixes by setting `SPACESHIP_PROMPT_PREFIXES_SHOW` and `SPACESHIP_PROMPT_SUFFIXES_SHOW` to `false`.

Additionally, you can change the default prefix and suffix by setting `SPACESHIP_PROMPT_DEFAULT_PREFIX` and `SPACESHIP_PROMPT_DEFAULT_SUFFIX`. These options will be used to render prefixes or suffixes unless the corresponding section option is set.
