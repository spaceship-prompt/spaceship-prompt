# Criar uma Secção Personalizada

Este guia tem como objetivo ajudar-nos a criar a nossa primeira secção personalizada.

## Regras para as Secções

Eis algumas recomendações a seguir ao criar uma secção para manter a Spaceship limpa e lisa.

### A Secção Não Deve Sobrecarregar o Terminal

Ter demasiadas informações no terminal é feito. É preferível limitar-se a um mínimo de informações necessárias.

* **Bom:** `🚀 v1.2.3`
* **Mau:** `🚀 spasheship#c3BhY2VzaGlw`

### A Secção Deve Ser Considerada

O valor muda com frequência, pelo que é necessário mostrá-lo no terminal? Seria útil para outros utilizadores? É possível que exista uma razão para executar um comando em vez de sobrecarregar o terminal.

* **Bom:** estado ou ramo de Git, versão em execução através do gestor de versões, etc
* **Mau:** versão da abstração duma linguagem específica, versões de projetos estabelecidos, etc

### A Secção Deve Ser Rápida

Se a nossa secção efetuar alguma verificação pesada, devemos encontrar uma maneira de torná-la mais rápida. Usamos a reprodução assíncrona para executar tarefas pesadas. A secção de ser:

* **Assíncrona:** se executar comandos externos, efetuar cálculos complexos, ler ficheiros grandes
* **Síncrona:** se verificar a disponibilidade do comando, verificar o valor da variável de ambiente

### Seguir a Convenção de Nomes para as Opções

Todas as opções do terminal seguem um padrão para serem fáceis de lembrar: `SPACESHIP_SECTION_<OPTION>[_PROPERTY]`. A regra é simples: ao nomear novas propriedades, preservamos as partes únicas do nome no final.

* **Bom:**
  ```
    SPACESHIP_GIT_STATUS_COLOR_BEHIND
    SPACESHIP_GIT_STATUS_COLOR_DIVERGED
  ```
* **Mau:**
  ```
    SPACESHIP_GIT_STATUS_BEHIND_COLOR
    SPACESHIP_GIT_STATUS_DIVERGED_COLOR
  ```

  Neste exemplo, `GIT_STATUS` é a *secção*, `COLOR` é a *opção* e `BEHIND` ou `DIVERGED` é a *propriedade*.

## Criar uma Secção

A maneira mais simples de criar uma secção é utilizar um repositório modelo para a secção da Spaceship.

[:fontawesome-brands-github: Utilizar um modelo de secção](https://github.com/spaceship-prompt/spaceship-section ""){.md-button}

Este repositório padrão contém um módulo para uma secção e a sua respetiva documentação, fluxo de trabalho de lançamento e teste configurados. Explorar o repositório para saber mais.

Abrir o [ficheiro `spaceship-section.plugin.zsh`](https://github.com/spaceship-prompt/spaceship-section/blob/main/spaceship-section.plugin.zsh) para um exemplo de secção personalizada.

## Repartição Normal das Secções

Segue-se um exemplo duma secção normal da Spaceship. Prestemos atenção a alguns momentos cruciais:

- Definir opções para personalização. Os seus nomes devem começar por `SPACESHIP_`.
- Todos os nomes de secções da Spaceship devem começar por `spaceship_` (por exemplo, `spaceship_node`). Isto é uma convenção usada para identificar a secção.
- Mostrar a secção apenas onde é necessária (em diretórios que contêm ficheiros específicos, quando um comando específico estiver disponível, etc).

As secções são definidas pela [interface de programação de aplicação `spaceship::section`](/api/section/). Podemos utilizar [utilitários de uso geral](/api/utils/) para executar tarefas comuns numa secção.

Uma secção normal pode ter o seguinte aspeto:

```zsh
#
# Foobar
#
# Foobar is a supa-dupa cool tool for making you development easier.
# Link: https://www.foobar.xyz

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_FOOBAR_SHOW="${SPACESHIP_FOOBAR_SHOW=true}"
SPACESHIP_FOOBAR_ASYNC="${SPACESHIP_FOOBAR_ASYNC=true}"
SPACESHIP_FOOBAR_PREFIX="${SPACESHIP_FOOBAR_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_FOOBAR_SUFFIX="${SPACESHIP_FOOBAR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_FOOBAR_SYMBOL="${SPACESHIP_FOOBAR_SYMBOL="🍷 "}"
SPACESHIP_FOOBAR_COLOR="${SPACESHIP_FOOBAR_COLOR="white"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show foobar status
# spaceship_ prefix before section's name is required!
# Otherwise this section won't be loaded.
spaceship_foobar() {
  # If SPACESHIP_FOOBAR_SHOW is false, don't show foobar section
  [[ $SPACESHIP_FOOBAR_SHOW == false ]] && return

  # Check if foobar command is available for execution
  spaceship::exists foobar || return

  # Show foobar section only when there are foobar-specific files in current
  # working directory.

  # spaceship::upsearch utility helps finding files up in the directory tree.
  local is_foobar_context="$(spaceship::upsearch foobar.conf)"
  # Here glob qualifiers are used to check if files with specific extension are
  # present in directory. Read more about them here:
  # http://zsh.sourceforge.net/Doc/Release/Expansion.html
  [[ -n "$is_foobar_context" || -n *.foo(#qN^/) || -n *.bar(#qN^/) ]] || return

  local foobar_version="$(foobar --version)"

  # Check if tool version is correct
  [[ $tool_version == "system" ]] && return

  # Display foobar section
  # spaceship::section utility composes sections. Flags are optional
  spaceship::section::v4 \
    --color "$SPACESHIP_FOOBAR_COLOR" \
    --prefix "$SPACESHIP_FOOBAR_PREFIX" \
    --suffix "$SPACESHIP_FOOBAR_SUFFIX" \
    --symbol "$SPACESHIP_FOOBAR_SYMBOL" \
    "$foobar_status"
}
```

Para mais informações, consultar as [Diretrizes de Colaboração](//github.com/spaceship-prompt/spaceship-prompt/blob/master/CONTRIBUTING.md).

## Partilhar a Nossa Secção com os Outros

O próximo passo é partilhar a nossa secção com a comunidade.

Abrir um tópico de discussão no nosso fórum de Discussão:

[Adicionar ao Registo](https://github.com/spaceship-prompt/spaceship-prompt/blob/master/docs/registry/external.json ""){.md-button} [Partilhar no Fórum](https://github.com/spaceship-prompt/spaceship-prompt/discussions/new?category=show-and-tell&title=Section%20for%20[tool] ""){.md-button}
