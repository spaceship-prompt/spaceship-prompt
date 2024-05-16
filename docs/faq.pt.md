# Questões Feitas com Frequência

Está página visa ajudar-nos a resolver os problemas mais comuns encontrados com a Spaceship.

Se tivermos dificuldades com alguma coisa, devemos sentir-nos à vontade para fazer uma pergunta no nosso servidor da Discord ou no fórum das discussões da GitHub:

[:fontawesome-brands-discord: Discord][discord]{ .md-button }
[:fontawesome-brands-github: Discussions][discussions]{ .md-button }

## Por que é que o meu terminal não se parece com a pré-visualização?

<div class="terminal-demo">
  <script id="asciicast-513451" src="https://asciinema.org/a/513451.js" data-autoplay="true" data-loop="true" data-preload="true" async></script>
  <noscript>
    <object class="asciicast" type="image/svg+xml" data="/assets/images/spaceship-demo.svg">
      <img src="/assets/images/spaceship-demo.gif" alt="Demonstração da Spaceship" />
    </object>
  </noscript>
</div>

A pré-visualização mostra a configuração do terminal da `spaceship` com:

- **Terminal**
    - [iTerm2](https://iterm2.com/) como emulador de terminal.
    - Cor de tema [One Dark](https://www.npmjs.com/package/hyperterm-atom-dark).
    - [Tipo de Letra Nerd FiraCode](https://www.nerdfonts.com/font-downloads) com ligaduras como tipo de letra primária (16px de tamanho).
- **Configuração da Concha (Shell)**
    - [denysdovhan's Dotfiles](https://github.com/denysdovhan/dotfiles)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) para ter comandos coloridos.
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) para ter conclusões automáticas parecidas com às do navegador.

Consultar a wiki de [capturas de ecrã](https://github.com/spaceship-prompt/spaceship-prompt/wiki/Screenshots) por mais exemplos de esquemas de cor.

## Como obtenho a conclusão do comando como mostrado no formato de intercâmbio de gráficos (GIF) da demonstração?

Usamos [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) para obter as conclusões de comando semelhantes aos do navegador baseada na história e conclusões.

## O que é o símbolo estranho antes do ramo de `git`?

Precisamos de ter um tipo de letra da Powerline corrigido para mostrar corretamente o símbolo do ramo de `git`.

- Instalamos qualquer tipo de letra compatível da Powerline como o [Fira Code](https://github.com/tonsky/FiraCode) ou [outros](https://github.com/powerline/fonts).
- Configuramos o nosso emulador de terminal para [usar este tipo de letra](https://powerline.readthedocs.io/en/master/troubleshooting/osx.html).

## Qual é símbolo o estranho em frente de uma secção?

Este não é um problema com o terminal da Spaceship. A Spaceship utiliza símbolos de código universal para representar `SPACESHIP_*_SYMBOL` em secções. Para resolver este problema:

- Verificamos se o nosso emulador de terminal suporta caracteres de código universal com este comando:
  ```zsh
  curl -L https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  # ou
  wget -O - https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  ```
- Configuramos o nosso emulador de terminal para usar UTF-8 como codificação de caracteres.
  - A `LC_ALL` precisa ser [definida para um valor UTF-8](https://www.tecmint.com/set-system-locales-in-linux/) como `en_US.UTF-8` ou `de_DE.UTF-8`, etc.
  - Precisamos de instalar um tipo de letra de emoji. Na maioria dos sistemas já tem este tipo de letra instalado, mas alguns sistemas não o têm (por exemplo, o Arch Linux). Devemos instalar um através do nosso gestor de pacote preferido. [noto emoji](https://www.google.com/get/noto/help/emoji) é uma escolha popular.
  -

No caso de símbolos de código universal são serem suportados, podemos substituí-los por aqueles compatíveis com o nosso terminal com as opções `SPACESHIP_*_SYMBOL`. Consultar a página de [opções](/config/intro) por mais informação.

## O `spaceship remove <section>` e `SPACESHIP_<SECTION>_SHOW=false` fazem o mesmo?

Ambos os comandos `spaceship remove` e `SPACESHIP_<SECTION>_SHOW=false` escondem a secção do terminal, mas fazem-no de maneira diferente.

O comando `spaceship remove` remove a secção da variável `SPACESHIP_[R]PROMPT_ORDER`, impedindo assim a secção de carregar e executar.

O comando `SPACESHIP_<SECTION>_SHOW=false` não impedi a secção de carregar e executar. A secção será carregada e depois executada, embora a própria secção decida como se esconder (normalmente, a secção salta todas as verificações e não desenha nada).

tldr: `spaceship remove` força o desenhador da Spaceship a saltar a secção e `SPACESHIP_<SECTION>_SHOW=false` diz à secção para se esconder.

## Qual é a diferença entre a Spaceship e Starship?

São ótimas, ambas, [Starship](https://starship.rs) é uma excelente linha de comando e tem (mais ou menos) paridade de funcionalidades com a Spaceship. Então, qual é a diferença?

A [Starship](https://starship.rs) é escrita em Rust e vem como uma sucessora da [Spacefish](https://spacefish.matchai.dev/) — uma implementação de Fish da linha de comando da Spaceship. É fortemente inspirada na linha de comando da Spaceship (eles confirmam isto no seu sítio da Web). Também é baseada nas ideias de Denys Dovhan de linhas de comandos compatíveis com várias conchas que forma implementadas em [denysdovhan/robbyrussell-node](https://github.com/denysdovhan/robbyrussell-node) como prova de conceito.

A Starship tem vantagem nas conchas suportadas, esta funciona com praticamente qualquer concha. A Spaceship está limitada a Zsh, mas usa a maioria das capacidades da Zsh.

A Starship realiza as suas verificações de maneira assíncrona e desenha a linha de comando assim que estiver pronta. A Spaceship não realiza as verificações de maneira assíncrona, como também desenha a linha de comando de imediato e atualiza-a assim que surgem novas informações vindas de tarefas assíncronas.

A Spaceship considera as secções personalizadas como um cidadão de primeira classe e tem um Registo de secções personalizadas, enquanto a Starship sugere o uso de [comandos personalizados](https://starship.rs/config/#custom-commands) para criar módulos personalizados.

Se usarmos máquinas diferentes com diferentes linhas de comandos de concha, a Starship pode ser uma melhor escolha para nós. A Spaceship é ótima se preferirmos usar a mesma configuração de Zsh em todas as máquinas que usamos.

## Qual é a diferença entre a Spaceship e a Powerlevel10k (com estilo Simples)?

[Powerlevel10k](https://github.com/romkatv/powerlevel10k) (com modo Simples) é outra linha de comando de Zsh que pode parecer muito semelhante a Spaceship.

Ambas linhas de comandos são assíncronas e desenham o terminal assim que este estiver pronto. Powerlevel10k adota uma abordagem mais monolítica para linha de comando, com toneladas de funcionalidades integradas numa única linha de comando. A Spaceship, no entanto, adota uma abordagem mais modular para a linha de comando com secções personalizadas e mais opções de personalização.

Por outro lado, a Powerlevel10k sugere várias predefinições de desenho. A Spaceship apenas suporta uma predefinição.

## Alguns ícones de secção sobrepõem-se mutuamente?

![exemplo de ícones sobrepostos](https://user-images.githubusercontent.com/3459374/34945188-1f6398be-fa0b-11e7-9845-a744bc3e148d.png)

Este problema está relacionado com como o nosso emulador de terminal desenha os caracteres de código universal. Para corrigir este problema:

- Temos de nos certificar de que o terminal utiliza as _Larguras de Código Universal de Versão 9_.
- Temos de permitir que o nosso terminal desenhe os caracteres de largura ambígua como sendo de largura dupla.

No _iTerm_, sigamos estas instruções:

- Vamos _iTerm → Preferences… (⌘,) → Profiles → Text_
- Confirmamos _Unicode Version 9 Widths_.
- Confirmamos _Threat ambiguous-width characters as double-width_.
- Recarregamos o separador do terminal.

## Ainda não conseguimos encontrar uma solução?

Se nenhuma das opções anteriores ajudar, podemos fazer uma pergunta no nosso servidor da Discord ou [registar uma questão][issues], para descrever o nosso problema, e encontraremos pessoas dispostas a ajudar-nos.

[:fontawesome-brands-discord: Discord]][discord]{ .md-button }
[:fontawesome-brands-github: Discussões][discussions]{ .md-button }
[:fontawesome-brands-github: Abrir um Problema][issues]{ .md-button }

<!-- References -->

[discord]: https://discord.gg/NTQWz8Dyt9

[discord]: https://discord.gg/NTQWz8Dyt9
[discussions]: https://github.com/spaceship-prompt/spaceship-prompt/discussions/
[discussions]: https://github.com/spaceship-prompt/spaceship-prompt/discussions/
[issues]: https://github.com/spaceship-prompt/spaceship-prompt/issues/new
[issues]: https://github.com/spaceship-prompt/spaceship-prompt/issues/new
