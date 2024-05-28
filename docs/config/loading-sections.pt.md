# Carregar Secções Personalizadas

Embora a Spaceship tenha várias secções para vários casos de uso, algumas vezes precisaremos instalar uma secção personalizada: para uma ferramenta específica ou algo que usamos pessoalmente.

Podemos criar a nossa própria secção usando a [interface de programação de aplicação das secções](/api/section) ou usar uma existente do [Registo](../registry.md):

[Navegar pelo Registo](../registry.md ""){.md-button} [Criar uma secção personalizada](/advanced/creating-section ""){.md-button}

## Como instalar uma secção

É melhor seguir as instruções de instalação fornecidas pelo autor da secção.

Na maior parte das vezes, já é o suficiente apenas clonar o repositório localmente (por exemplo, para o `~/.config/spaceship`) e extrair a secção em algum lugar na [configuração da Spaceship](/config/intro/#create-a-config-file) ou diretamente no `~/.zshrc`.

## Como adicionar a secção ao terminal

A interface da linha de comando da Spaceship fornece um comando para adicionar uma secção ao terminal:

```zsh
spaceship add <section>
```

Por exemplo, para secção `ember`, podemos usar:

```zsh
spaceship add ember
```

Precisamos adicionar esta linha em algum lugar no `~/.zshrc`.
