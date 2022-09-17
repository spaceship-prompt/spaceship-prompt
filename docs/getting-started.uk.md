# Початок роботи

Ласкаво просимо на борт! Давайте встановимо Spaceship на вашу машину, астронавте!

## Вимоги

Перш ніж ми розпочнемо, переконайтеся, що ви встановили наступне:

- [](http://www.zsh.org/)zsh (v5.2 або новіше) має бути встановлено. Запустіть наступну команду, щоб перевірити вашу версію Zsh:
  ```zsh
  echo $ZSH_VERSION #> 5.8.1
  ```
- [Powerline шрифт](https://github.com/powerline/fonts) або [Nerd Font](https://www.nerdfonts.com/) (навіть краще) має бути встановлений і використовуватись у вашому терміналі. [Fira Code](https://github.com/tonsky/FiraCode) є популярним вибором. Щоб перевірити чи Powerline шрифт працює для вас, запустіть:
  ```zsh
  echo -e "\xee\x82\xa0" #> 
  ```

## Встановлення

Тепер, коли вимоги задоволені, ви можете встановити Spaceship за допомогою будь-якого з перелічених способів:

=== "Вручну"

    !!! hint
        Якщо ви використовуєте будь-який менеджер плагінів, наприклад Oh-My-Zsh, antigen, zgen, zplug чи інший, це можливо не найкращий спосіб встановити Spaceship для вас.

    1. Клонуйте цей репозиторій, наприклад, у `$HOME/.zsh/spaceship`.
    2. Завантажте Spaceship у вашому `~/.zshrc`.


    ### Приклад

    ```zsh title="Terminal"
    mkdir -p "$HOME/.zsh"
    git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"
    ```

    Для ініціалізації командного рядка додайте це до вашого `.zshrc`:

    ```zsh title=".zshrc"
    source "$HOME/.zsh/spaceship/spaceship.zsh"
    ```

=== "Homebrew"

    Встановіть Spaceship через Homebrew простою командою:

    ```zsh title="Terminal"
    brew install spaceship
    ```


    Додати команду ініціалізації до вашого `.zshrc`:

    ```zsh title="Terminal"
    echo "source $(brew --prefix)/opt/spaceship/spaceship.zsh" >>! ~/.zshrc
    ```


    !!! tip
        You can also add the following to your [`Brewfile`](https://github.com/Homebrew/homebrew-bundle#usage) to bundle Spaceship along with your other software:

        ```ruby title="Brewfile"
        brew "spaceship"
        ```

=== "oh-my-zsh"

    Клонуйте репозиторій:

    ```zsh title="Terminal"
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ```


    Symlink `spaceship.zsh-theme` to your oh-my-zsh custom themes directory:

    ```zsh title="Terminal"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```


    Set `ZSH_THEME="spaceship"` in your `.zshrc`.

=== "npm"

    Install Spaceship via npm as you would with any other global package:

    ``` title="Terminal"
    npm install -g spaceship-prompt
    ```


    This command will download Spaceship. It will also ask you to source Spaceship in your `~/.zshrc` file.
    
    !!! tip
        Update Spaceship to new versions as you would any other package.

=== "prezto"

    - Follow [prezto-contrib#usage](https://github.com/belak/prezto-contrib#usage) to clone `prezto-contrib` to the proper location.
    - Enable the `contrib-prompt` module (before the `prompt` module).
    - Set `zstyle ':prezto:module:prompt' theme 'spaceship'` in your `.zpreztorc`.

=== "zim"

    Додайте Spaceship до свого `.zimrc`:

    ```zsh title=".zimrc"
    zmodule spaceship-prompt/spaceship-prompt --name spaceship --no-submodules
    ```


    Далі встановіть Spaceship:

    ```zsh title="Terminal"
    zimfw install
    ```

=== "antigen"

    Додайте такий фрагмент у вашому `.zshrc`:

    ```zsh title=".zshrc"
    antigen theme spaceship-prompt/spaceship-prompt
    ```

=== "antibody"

    Update your `.zshrc` file with the following line:

    ```zsh title=".zshrc"
    antibody bundle spaceship-prompt/spaceship-prompt
    ```

=== "zinit"

    Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

    ```zsh title=".zshrc"
    zinit light spaceship-prompt/spaceship-prompt
    ```

=== "zgen"

    Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

    ```zsh title=".zshrc"
    zgen load spaceship-prompt/spaceship-prompt spaceship
    ```

=== "zplug"

    Use this command in your `.zshrc` to load Spaceship as prompt theme:

    ```zsh title=".zshrc"
    zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
    ```

=== "sheldon"

    Add the following to your `plugins.toml` file (open it with `sheldon edit`):

    ```toml title="plugins.toml"
    [plugins.spaceship]
    github = "spaceship-prompt/spaceship-prompt"
    ```


    Or run the following to automatically add it:

    ```zsh title="Terminal"
    sheldon add spaceship --github spaceship-prompt/spaceship-prompt
    ```

=== "Arch"

    Install the latest master from the AUR package [`spaceship-prompt-git`](https://aur.archlinux.org/packages/spaceship-prompt-git/):

    ```
    git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1
    cd spaceship-prompt-git
    makepkg -si
    ```

## Вітаємо!

Ви зробили це! Ви встановили Spaceship на вашу машину!

Що далі? Spaceship має помірковані налаштування за замовчуванням, але ви можете налаштувати його під свої потреби. Дізнайтеся, як налаштувати Spaceship:

[Налаштувати Spaceship](/config/intro ""){.md-button.md-button--primary}

Крім того, приєднайтеся до нашої спільноти або розгляньте можливість зробити внесок у проект.

[:material-hand-heart: Contribute](/contribute ""){.md-button} [:fontawesome-brands-twitter: Twitter](https//twitter.com/SpaceshipPrompt ""){.md-button} [:fontawesome-brands-discord: Discord](https://discord.gg/NTQWz8Dyt9 ""){.md-button}

## Виникли проблеми?

Find answers on our troubleshooting page or get help by our community. Still struggling? Please, *file an issue*, describe your problem, and we will gladly help you.

[:fontawesome-brands-discord: Discord](https://discord.gg/NTQWz8Dyt9 ""){.md-button} [:fontawesome-brands-github: Discussions](https://github.com/spaceship-prompt/spaceship-prompt/discussions/ ""){.md-button} [:fontawesome-brands-github: Issues](https://github.com/spaceship-prompt/spaceship-prompt/issues ""){.md-button}
