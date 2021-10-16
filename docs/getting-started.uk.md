---
hide:
  - navigation
---

# Початок роботи

## Вимоги

- [`zsh`](http://www.zsh.org/) (v5.2 або новіше) має бути встановлено.
- [Powerline-шрифт](https://github.com/powerline/fonts) слід встановити і використовувати у вашому терміналі (наприклад, змінити шрифт на [Fira Code](https://github.com/tonsky/FiraCode)).

## Встановлення

Тепер, коли вимоги задоволені, ви можете встановити Spaceship за допомогою будь-якого з перелічених інструментів.

=== "Ручне встановлення"
    
    !!! hint
        If you're using any plugin manager, like Oh-My-Zsh, zplug, antigen or other, this might not be the best way to install Spaceship for you.
    
    Ось спосіб встановити Spaceship, якщо ви не використовуєте жодного менеджера для плагінів Zsh:

    - Клонувати цей репозиторій `git clone https://github.com/spaceship-prompt/spaceship-prompt.git --depth=1`
    - Зробіть символічне посилання на `spaceship.zsh` у вашому [`$fpath`](http://www.refining-linux.org/archives/46/ZSH-Gem-12-Autoloading-functions/) як `prompt_spaceship_setup`.
    - Ініціалізуйте систему командного рядка та оберіть `spaceship`.

    #### Приклад

    Запустіть `echo $fpath`, щоб побачити можливе розташування та залінкуйте туди `spaceship.zsh`, ось так:

    ```zsh
    $ ln -sf "$PWD/spaceship.zsh" "/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
    ```

    Щоб встановити для окремого користувача, просто додайте каталог у `$fpath` для цього користувача у `.zshrc`:

    ```zsh
    fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
    ```

    Далі встановіть тему отак:

    ```zsh
    $ ln -sf "$PWD/spaceship.zsh" "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
    ```

    Для ініціалізації командного рядка додайте це до вашого `.zshrc`:

    ```zsh
    # .zshrc
    autoload -U promptinit; promptinit
    prompt spaceship
    ```

=== "oh-my-zsh"

    Клонуйте репозиторій:

    ```zsh
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ```

    Створіть файлове посилання на `spaceship.zsh-theme` у вашому каталозі користувацьких тем oh-my-zsh:

    ```zsh
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```

    Встановіть `ZSH_THEME="spaceship"` у вашому `.zshrc`.

=== "npm"

    ```
    npm install -g spaceship-prompt
    ```
    
    Готово. Ця команда має залінкувати `spaceship.zsh` як `prompt_spaceship_setup` у вашому `$fpath` та встановити  `prompt spaceship` у `.zshrc`. Just reload your terminal.

    **💡 Порада:** Ви можете оновлювати Spaceship до нових версій, так як і будь-який інший пакет.

=== "prezto"

    - Скористайтесь [prezto-contrib#usage](https://github.com/belak/prezto-contrib#usage) , щоб клонувати `prezto-contrib` до правильного розташування.
    - Увімкніть модуль `contrib-prompt` (перед модулем `prompt`).
    - Встановіть `zstyle ':prezto:module:prompt' theme 'spaceship'` у вашому `.zpreztorc`.

=== "zim"

    Додайте `zmodule spaceship-prompt/spaceship-prompt --name spaceship` у `.zimrc` та запустіть `zimfw install`.

=== "antigen"

    Додайте такий фрагмент у вашому `.zshrc`:

    ```
    antigen theme spaceship-prompt/spaceship-prompt
    ```

=== "antibody"

    Додайте у файл `.zshrc` такий рядок:

    ```
    antibody bundle spaceship-prompt/spaceship-prompt
    ```

=== "zinit"

    Додайте такий рядок до вашого `.zshrc` у місці, де ви додаєте інші плагіни Zsh:

    ```
    zinit light spaceship-prompt/spaceship-prompt
    ```

=== "zgen"

    Додайте такий рядок до вашого `.zshrc` у місці, де ви додаєте інші плагіни Zsh:

    ```
    zgen load spaceship-prompt/spaceship-prompt spaceship
    ```

=== "zplug"

    Використовуйте цю команду в вашому `.zshrc` для завантаження Spaceship в якості теми командного рядка:

    ```
    zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
    ```

=== "Arch"

    Встановіть найновіший master з AUR-пакета [`spaceship-prompt-git`](https://aur.archlinux.org/packages/spaceship-prompt-git/):

    ```
    git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1
    cd spaceship-prompt-git
    makepkg -si
    ```

## Congratulations!

You've made it! You've installed Spaceship on your machine!

What's next? Spaceship has reasonable defaults, but you might want to adjust them to your needs. Visit our [Options](./options.md) page to learn how to configure your Spaceship.

<!-- prettier-ignore -->
!!! tip Follow [our Twitter](//twitter.com/SpaceshipPrompt) to keep yourself updated about new features, improvements, and bugfixes.

## Troubleshooting

Having trouble? Take a look at out [Troubleshooting](./troubleshooting.md) page.

Still struggling? Please, [file an issue](https://github.com/spaceship-prompt/spaceship-prompt/issues/new/choose), describe your problem and we will gladly help you.
