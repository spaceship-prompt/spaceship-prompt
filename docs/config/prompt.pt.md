# Configuração do Terminal

Esta página descreve as opções ao nível do terminal para a Spaceship.

## Terminologia

O terminal é constituído por **secções**. Todas as secções são combinas na [**ordem do terminal**](#prompt-order).

Quando o terminal for desenhado, apenas passará pela ordem do terminal e executará cada secção. Se quisermos adicionar uma secção personalizada, a adicionamos a ordem. Podemos adicionar ou remover secções da ordem do terminal a qualquer momento.

Normalmente, uma secção é constituída por um **prefixo**, **símbolo**, **conteúdo**, e **sufixo**. O símbolo e o conteúdo são pintados a **cor**. Eis um exemplo com uma secção `package`:

```
is 📦 3.16.5
```

Acima, `is` é um prefixo, `📦` é um símbolo, `3.16.5` é o conteúdo e `` (um espaço) é o sufixo.

Cada parte pode ser configurada através das **opções** correspondentes. As opções são apenas variáveis de ambiente e têm esta assinatura `SPACESHIP_<SECTION>_<OPTION>`:

```zsh
# SPACESHIP_<SECTION>_<OPTION>
  SPACESHIP_PACKAGE_PREFIX="via·"
  SPACESHIP_PACKAGE_SUFFIX=" "
  SPACESHIP_PACKAGE_COLOR="green"
```

Acima `PACKAGE` é uma **secção** e `PREFIX`, `SUFFIX` e `COLOR` são **opções** para prefixo, sufixo e cor, respetivamente.

!!! info
    As cores das secções podem ser [cores básicas](https://wiki.archlinux.org/index.php/zsh#Colors) ou [códigos de cores](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).

## Ordem do terminal

A **ordem do terminal** é a ordem pela qual as secções são executadas e desenhadas. Podemos especificar a ordem da secção do terminal usando a opção `SPACESHIP_PROMPT_ORDER`.

A ordem predefinida do terminal é:

```zsh
SPACESHIP_PROMPT_ORDER=(
  time           # Secção dos carimbos de data e hora
  user           # Secção do nome do utilizador
  dir            # Secção do diretório atual
  host           # Secção do nome do hospedeiro
  git            # Secção da Git (git_branch + git_status)
  hg             # Secção da Mercurial (hg_branch  + hg_status)
  package        # Versão do pacote
  node           # Secção da Node.js
  bun            # Secção da Bun
  deno           # Secção da Deno
  ruby           # Secção da Ruby
  python         # Secção da Python
  elm            # Secção da Elm
  elixir         # Secção da Elixir
  xcode          # Secção do Xcode
  swift          # Secção da Swift
  golang         # Secção da Go
  perl           # Secção da Perl
  php            # Secção da PHP
  rust           # Secção da Rust
  haskell        # Secção da Pilha de Haskell
  scala          # Secção da Scala
  kotlin         # Secção da Kotlin
  java           # Secção da Java
  lua            # Secção da Lua
  dart           # Secção da Dart
  julia          # Secção da Julia
  crystal        # Secção da Crystal
  docker         # Secção da Docker
  docker_compose # Secção da Docker
  aws            # Secção dos Amazon Web Services
  gcloud         # Secção da Google Cloud Platform
  azure          # Secção da Azure
  venv           # Secção do virtualenv
  conda          # Secção do conda virtualenv
  dotnet         # Secção da .NET
  ocaml          # Secção da OCaml
  vlang          # Secção da V
  zig            # Secção da Zig
  purescript     # Secção da PureScript
  erlang         # Secção da Erlang
  kubectl        # Secção do contexto da Kubectl
  ansible        # Secção da Ansible
  terraform      # Secção do área do espaço de trabalho da Terraform
  pulumi         # Secção da pilha da Pulumi
  ibmcloud       # Secção da IBM Cloud
  nix_shell      # Concha da Nix
  gnu_screen     # Secção do Ecrã do GNU
  exec_time      # Tempo de execução
  async          # Indicador de tarefas assíncronas
  line_sep       # Quebra de linha
  battery        # Nível e estado da bateria
  jobs           # Indicador de tarefas de segunda plano
  exit_code      # Secção do código de saída
  sudo           # Indicador do sudo
  char           # Carácter do terminal
)
```

Podemos adicionar ou remover secções usando os comandos `spaceship add` e `spaceship remove`, da seguinte maneira:

```zsh
# Remove a git do terminal
spaceship remove git

# Adiciona a git de volta ao terminal
spaceship add git
```

### Ordem do terminal direito

Também podemos adicionar itens ao terminal direito especificando-os na opção `SPACESHIP_RPROMPT_ORDER`. Por padrão, `` SPACESHIP_RPROMPT_ORDER` `` é um vetor vazio.

## Configurar as secções

Podemos personalizar cada secção do terminal com as opções da secção. Para mais informações, consultar a documentação de cada secção.

Para além das secções embutidas, podemos adicionar uma secção externa ao nosso terminal ou construir uma secção personalizada.

[Navegar nas secções embutidas](/sections/index.md ""){.md-button} [Navegar por todas as secções](../registry.md ""){.md-button}

## Opções ao nível do terminal

Este grupo de opções define um comportamento de parâmetros padrão e de terminal para a visualização.

| Variável                              | Padrão  | Significado                                                        |
|:------------------------------------- |:-------:| ------------------------------------------------------------------ |
| `SPACESHIP_PROMPT_ASYNC`              | `true`  | Desenha ou não o terminal de maneira assíncrona                    |
| `SPACESHIP_PROMPT_ADD_NEWLINE`        | `true`  | Adiciona um carácter de nova linha antes de cada linha do terminal |
| `SPACESHIP_PROMPT_SEPARATE_LINE`      | `true`  | Faz com que o terminal se estenda por duas linhas                  |
| `SPACESHIP_PROMPT_FIRST_PREFIX_SHOW`  | `false` | Mostra um prefixo da primeira secção no terminal                   |
| `SPACESHIP_RPROMPT_FIRST_PREFIX_SHOW` | `false` | Mostra um prefixo da primeira secção no terminal direito           |
| `SPACESHIP_PROMPT_PREFIXES_SHOW`      | `true`  | Mostra ou não os prefixos antes das secções do terminal            |
| `SPACESHIP_PROMPT_SUFFIXES_SHOW`      | `true`  | Mostra ou não sufixos antes das secções do terminal                |
| `SPACESHIP_PROMPT_DEFAULT_PREFIX`     | `via·`  | Prefixo predefinido para as secções do terminal                    |
| `SPACESHIP_PROMPT_DEFAULT_SUFFIX`     |   ``    | Sufixo predefinido para a secção do terminal                       |

Segue-se uma análise destas opções:

### Apresentação assíncrona

A opção `SPACESHIP_PROMPT_ASYNC` define se o terminal é desenhado de maneira assíncrona ou não. Por padrão, o terminal é desenhado de maneira assíncrona.

As secções síncronas são imediatamente visualizadas. As secções assíncronas são processadas em segundo plano e apresentadas quando a informação estiver pronta para ser apresentada.

A [secção `async`](/sections/async.md) é usada como reservador de espaço para secções assíncronas que ainda não estão disponíveis.

### Espaçamento do terminal

A Spaceship adiciona uma linha vazia entre cada linha do terminal. Podemos desativar este comportamento definindo `SPACESHIP_PROMPT_ADD_NEWLINE` para `false`.

O terminal também é separado por uma quebra de linha se `SPACESHIP_PROMPT_SEPARATE_LINE` for definido como `true`.

### Visualizar o prefixo da primeira secção

A Spaceship esconde o prefixo da primeira secção do terminal. Podemos desativar este comportamento definindo `SPACESHIP_PROMPT_FIRST_PREFIX_SHOW` para `true`.

### Visualizar prefixos e sufixos

Podemos desativar a apresentação de prefixos e sufixos definindo `SPACESHIP_PROMPT_PREFIXES_SHOW` e `SPACESHIP_PROMPT_SUFFIXES_SHOW` para `false`.

Adicionalmente, podemos alterar o prefixo e o sufixo padrão definindo `SPACESHIP_PROMPT_DEFAULT_PREFIX` e `SPACESHIP_PROMPT_DEFAULT_SUFFIX`. Estas opções serão usadas para desenhar prefixos ou sufixos, a menos que a opção da secção correspondente esteja definida.
