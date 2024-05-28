# Começar

Saudações, astronauta! Instalaremos a Spaceship na nossa máquina, astronauta!

## Requisitos

Primeiramente, precisamos de certificar-nos de que temos o seguinte instalado:

- [Zsh](http://www.zsh.org/) (v5.2 ou recente) deve estar instalado. Executamos o seguinte comando para verificar a nossa versão de Zsh:
  ```zsh
  echo $ZSH_VERSION #> 5.8.1
  ```
- [Powerline Font](https://github.com/powerline/fonts) ou [Nerd Font](https://www.nerdfonts.com/) (muito melhor) deve ser instalado e usado no nosso terminal. [Fira Code](https://github.com/tonsky/FiraCode) é uma escolha popular. Para verificar se o tipo de letra da Powerline funciona para nós, executamos:
  ```zsh
  echo -e "\xee\x82\xa0" #> 
  ```

## Instalação

Agora que já satisfazemos os requisitos, podemos instalar a Spaceship através de quaisquer uma das seguintes abordagens:

=== "Manual"

    !!! sugestão
        Se estivermos a usar algum gestor de extensão, como Oh-My-Zsh, antigen, zgen, zplug ou outro, esta pode não ser a melhor maneira instalar a Spaceship para nós.

    1. Clonamos este repositório em algum lugar, por exemplo, em `$HOME/.zsh/spaceship`.
    2. Extraímos a Spaceship no nosso `~/.zshrc`.


    ### Exemplo

    ```zsh title="Terminal"
    mkdir -p "$HOME/.zsh"
    git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"
    ```

    Para inicializarmos a o sistema da linha de comando adicionamos isto ao nosso `.zshrc`:

    ```zsh title=".zshrc"
    source "$HOME/.zsh/spaceship/spaceship.zsh"
    ```

=== "Homebrew"

    A instalação da Spaceship através da Homebrew é um comando simples:

    ```zsh title="Terminal"
    brew install spaceship
    ```


    Adicionamos a inicialização da linha de comando ao nosso `.zshrc`:

    ```zsh title="Terminal"
    echo "source $(brew --prefix)/opt/spaceship/spaceship.zsh" >>! ~/.zshrc
    ```


    !!! dica
        Também podemos adicionar o seguinte ao [`Brewfile`](https://github.com/Homebrew/homebrew-bundle#usage) para empacotarmos a Spaceship juntamente com o nosso outro software:

        ```ruby title="Brewfile"
        brew "spaceship"
        ```

=== "oh-my-zsh"

    Clonamos este repositório:

    ```zsh title="Terminal"
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ```


    Ligamos simbolicamente o `spaceship.zsh-theme` ao nosso diretório de temas personalizados da oh-my-zsh:

    ```zsh title="Terminal"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```


    Definimos `ZSH_THEME="spaceship"` no nosso `.zshrc`.

=== "npm"

    Instalamos a Spaceship através da npm como faríamos com qualquer outro pacote global:

    ``` title="Terminal"
    npm install -g spaceship-prompt
    ```


    Este comando descarregará a Spaceship. Também pedir-nos-á para extrair a Spaceship no nosso ficheiro `~/.zshrc`.
    
    !!! dica
        Atualizamos a Spaceship para nossas versões como faríamos com qualquer outro pacote.

=== "prezto"

    - Seguimos [prezto-contrib#usage](https://github.com/belak/prezto-contrib#usage) para clonar a `prezto-contrib` para a localização correta.
    - Ativamos o módulo `contrib-prompt` (antes do módulo `prompt`).
    - Definimos `zstyle ':prezto:module:prompt' theme 'spaceship'` no nosso `.zpreztorc`.

=== "zim"

    Adicionamos a Spaceship ao nosso `.zimrc`:

    ```zsh title=".zimrc"
    zmodule spaceship-prompt/spaceship-prompt --name spaceship --no-submodules
    ```


    Depois instalamos a Spaceship:

    ```zsh title="Terminal"
    zimfw install
    ```

=== "antigen"

    Adicionamos o seguinte trecho ao nosso `.zshrc`:

    ```zsh title=".zshrc"
    antigen theme spaceship-prompt/spaceship-prompt
    ```

=== "antibody"

    Atualizamos o nosso ficheiro `.zshrc` com a seguinte linha:

    ```zsh title=".zshrc"
    antibody bundle spaceship-prompt/spaceship-prompt
    ```

=== "zinit"

    Adicionamos a seguinte linha ao `.zshrc` onde adicionamos as nossas outras extensões de Zsh:

    ```zsh title=".zshrc"
    zinit light spaceship-prompt/spaceship-prompt
    ```

=== "zgen"

    Adicionamos a seguinte linha ao `.zshrc` onde adicionamos as nossas outras extensões de Zsh:

    ```zsh title=".zshrc"
    zgen load spaceship-prompt/spaceship-prompt spaceship
    ```

=== "zplug"

    Usamos este comando no nosso `.zshrc` para carregar a Spaceship como tema de linha de comando:

    ```zsh title=".zshrc"
    zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
    ```

=== "sheldon"

    Adicionamos o seguinte ao nosso ficheiro `plugins.toml` (o abrimos com `sheldon edit`):

    ```toml title="plugins.toml"
    [plugins.spaceship]
    github = "spaceship-prompt/spaceship-prompt"
    ```


    Ou executamos o seguinte para o adicionarmos automaticamente:

    ```zsh title="Terminal"
    sheldon add spaceship --github spaceship-prompt/spaceship-prompt
    ```

=== "Arch"

    Instalamos o lançamento mais recente a partir do pacote AUR [spaceship-prompt](https://aur.archlinux.org/packages/spaceship-prompt/):

    ```
    git clone https://aur.archlinux.org/spaceship-prompt.git
    cd spaceship-prompt
    makepkg -si
    ```


    ou usamos `yay`:

    ```
    yay -S spaceship-prompt
    ```


    Também existe um pacote [spaceship-prompt-git](https://aur.archlinux.org/packages/spaceship-prompt-git/) de Git não mantido.


## Parabéns!

Conseguimos! Instalamos a Spaceship na nossa máquina!

O que se segue? Spaceship tem padrões razoáveis, mas podemos ajustá-los às nossas necessidades. Saibamos como configurar a nossa Spaceship:

[Configurar a Spaceship](/config/intro ""){.md-button}

Além disto, podemos juntar-nos à nossa comunidade ou considerar colaborar com o projeto.

[:material-hand-heart: Colaborar](/contribute ""){.md-button} [:fontawesome-brands-twitter: Twitter](https//twitter.com/SpaceshipPrompt ""){.md-button} [:fontawesome-brands-discord: Discord](https://discord.gg/NTQWz8Dyt9 ""){.md-button}

## Há Problemas?

Podemos encontrar respostas na página de resolução ou obter ajuda da nossa comunidade. As dificuldades persistem? Por favor, *regista um problema*, descreva o problema, e teremos todo gosto em ajudar.

[:fontawesome-brands-discord: Discord](https://discord.gg/NTQWz8Dyt9 ""){.md-button} [:fontawesome-brands-github: Discussões](https://github.com/spaceship-prompt/spaceship-prompt/discussions/ ""){.md-button} [:fontawesome-brands-github: Problemas](https://github.com/spaceship-prompt/spaceship-prompt/issues ""){.md-button}
