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


    Створіть файлове посилання на `spaceship.zsh-theme` у вашому каталозі користувацьких тем oh-my-zsh:

    ```zsh title="Terminal"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```


    Встановіть `ZSH_THEME="spaceship"` у вашому `.zshrc`.

=== "npm"

    Встановіть Spaceship через npm, як будь-який інший глобальний пакет:

    ``` title="Terminal"
    npm install -g spaceship-prompt
    ```


    Ця команда завантажить Spaceship. Вона також попросить вас підключити Spaceship у вашому файлі `~/.zshrc`.
    
    !!! tip:**
        Ви можете оновлювати Spaceship до нових версій, так як і будь-який інший пакет.

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

    Додайте у файл `.zshrc` такий рядок:

    ```zsh title=".zshrc"
    antibody bundle spaceship-prompt/spaceship-prompt
    ```

=== "zinit"

    Додайте такий рядок до вашого `.zshrc` у місці, де ви додаєте інші плагіни Zsh:

    ```zsh title=".zshrc"
    zinit light spaceship-prompt/spaceship-prompt
    ```

=== "zgen"

    Додайте такий рядок до вашого `.zshrc` у місці, де ви додаєте інші плагіни Zsh:

    ```zsh title=".zshrc"
    zgen load spaceship-prompt/spaceship-prompt spaceship
    ```

=== "zplug"

    Використовуйте цю команду в вашому `.zshrc` для завантаження Spaceship в якості теми командного рядка:

    ```zsh title=".zshrc"
    zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
    ```

=== "sheldon"

    Додайте наступне у ваш файл `plugins.toml` (відкрийте його за допомогою `sheldon edit`):

    ```toml title="plugins.toml"
    [plugins.spaceship]
    github = "spaceship-prompt/spaceship-prompt"
    ```


    Або запустіть таку команду, щоб додати його автоматично:

    ```zsh title="Terminal"
    sheldon add spaceship --github spaceship-prompt/spaceship-prompt
    ```

=== "Arch"

    Встановіть найновіший master з AUR-пакета [`spaceship-prompt-git`](https://aur.archlinux.org/packages/spaceship-prompt-git/):

    ```
    git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1
    cd spaceship-prompt-git
    makepkg -si
    ```

## Вітаємо!

Ви зробили це! Ви встановили Spaceship на вашу машину!

Що далі? Spaceship має помірковані налаштування за замовчуванням, але ви можете налаштувати його під свої потреби. Дізнайтеся, як налаштувати Spaceship:

[Налаштувати Spaceship](/config/intro ""){.md-button}

Крім того, приєднайтеся до нашої спільноти або розгляньте можливість зробити внесок у проект.

[:material-hand-heart: Зробити внесок](/contribute ""){.md-button} [:fontawesome-brands-twitter: Twitter](https//twitter.com/SpaceshipPrompt ""){.md-button} [:fontawesome-brands-discord: Discord](https://discord.gg/NTQWz8Dyt9 ""){.md-button}

## Виникли проблеми?

Знайдіть відповіді на нашій сторінці усунення несправностей або отримайте допомогу від нашої спільноти. Не допомогло? Будь ласка, *надішліть нам повідомлення*, опишіть вашу проблему, і ми з радістю допоможемо вам.

[:fontawesome-brands-discord: Discord](https://discord.gg/NTQWz8Dyt9 ""){.md-button} [:fontawesome-brands-github: Discussions](https://github.com/spaceship-prompt/spaceship-prompt/discussions/ ""){.md-button} [:fontawesome-brands-github: Issues](https://github.com/spaceship-prompt/spaceship-prompt/issues ""){.md-button}
