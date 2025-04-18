# Introdução

Bem-vindos a configuração da Spaceship! Eis um guia introdutório de como ajustar a Spaceship aos nosso fluxo de trabalho pessoal.

## Criar um ficheiro de configuração

Para começar com personalização, criamos um ficheiro de configuração:

```zsh
touch ~/.spaceshiprc.zsh
```

… ou, se preferirmos manter a nossa configuração em pastas como `~/.config` ou `~/config/spaceship`, também podemos fazê-lo:

```zsh
mkdir -p ~/.config
touch ~/.config/spaceship.zsh
```

Este ficheiro será automaticamente extraído pela Spaceship quando estiver a iniciar.

## Configurar o nosso terminal

O ficheiro de configuração é um ficheiro `.zsh`, então podemos usar a sintaxe da `zsh` para personalizar a Spaceship. Podemos usar ciclos de repetição, condições, funções personalizadas ou mesmo extrair ficheiros de `zsh` adicionais. É uma questão de preferência e gosto nosso.

Eis um exemplo de um ficheiro de configuração:

```zsh
SPACESHIP_TIME_SHOW=true

# Exibir sempre o nome do utilizador SPACESHIP_USER_SHOW=always

# Não truncar o caminho nos repositórios SPACESHIP_DIR_TRUNC_REPO=false

# Adicionar secção personalizada da Ember
# Consultar: https://github.com/spaceship-prompt/spaceship-ember
spaceship add ember

# Adicionar uma secção personalizada do modo vi ao terminal
# Consultar: https://github.com/spaceship-prompt/spaceship-vi-mode
spaceship add --before char vi_mode
```

Podemos aprender mais sobre as opções disponíveis ao ler documentação adicional.

[Consultar as opções disponíveis](prompt.md ""){.md-button}

## Alterar a localização da configuração

Opcionalmente, podemos alterar a localização do ficheiro de configuração ao definir a variável de ambiente `SPACESHIP_CONFIG`.

```zsh
export SPACESHIP_CONFIG="$HOME/.dotfiles/path/to/spaceship.zsh"
```
