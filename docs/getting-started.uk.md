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

=== "Вручну"

    !!! hint
        If you're using any plugin manager, like Oh-My-Zsh, zplug, antigen or other, this might not be the best way to install Spaceship for you.
    
    This is way to install Spaceship if you don't use any tool for managing Zsh plugins.

    - Скористайтесь [prezto-contrib#usage](https://github.com/belak/prezto-contrib#usage) , щоб клонувати `prezto-contrib` до правильного розташування.
    - Увімкніть модуль `contrib-prompt` (перед модулем `prompt`).
    - Initialize prompt system and choose `spaceship`.


    #### Example

    Run `echo $fpath` to see possible location and link `spaceship.zsh` there, like:

    ```zsh
    $ ln -sf "$PWD/spaceship.zsh" "/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
    ```

    For a user-specific installation, simply add a directory to `$fpath` for that user in `.zshrc`:

    ```zsh
    fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
    ```

    Then install the theme like this:

    ```zsh
    $ ln -sf "$PWD/spaceship.zsh" "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
    ```

    For initializing prompt system add this to your `.zshrc`:

    ```zsh
    # .zshrc
    autoload -U promptinit; promptinit
    prompt spaceship
    ```

=== "Homebrew"

    ```
    brew install spaceship
    ```


    You can also add the following to your [`Brewfile`](https://github.com/Homebrew/homebrew-bundle#usage):

    ```ruby
    brew "spaceship"
    ```

=== "oh-my-zsh"

    Clone this repo:

    ```zsh
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ```


    Symlink `spaceship.zsh-theme` to your oh-my-zsh custom themes directory:

    ```zsh
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ```


    Set `ZSH_THEME="spaceship"` in your `.zshrc`.

=== "npm"

    ```
    npm install -g spaceship-prompt
    ```


    Done. This command should link `spaceship.zsh` as `prompt_spaceship_setup` to your `$fpath` and set `prompt spaceship` in `.zshrc`. Just reload your terminal.
    
    !!!tip
        Update Spaceship to new versions as you would any other package.

=== "prezto"

    - Клонувати цей репозиторій `git clone https://github.com/spaceship-prompt/spaceship-prompt.git --depth=1`
    - Зробіть символічне посилання на `spaceship.zsh` у вашому [`$fpath`](http://www.refining-linux.org/archives/46/ZSH-Gem-12-Autoloading-functions/) як `prompt_spaceship_setup`.
    - Ініціалізуйте систему командного рядка та оберіть `spaceship`.

=== "zim"

    Add `zmodule spaceship-prompt/spaceship-prompt --name spaceship --no-submodules` to your `.zimrc` and run `zimfw install`.

=== "antigen"

    Add the following snippet in your `.zshrc`:

    ```
    antigen theme spaceship-prompt/spaceship-prompt
    ```

=== "antibody"

    Update your `.zshrc` file with the following line:

    ```
    antibody bundle spaceship-prompt/spaceship-prompt
    ```

=== "zinit"

    Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

    ```
    zinit light spaceship-prompt/spaceship-prompt
    ```

=== "zgen"

    Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

    ```
    zgen load spaceship-prompt/spaceship-prompt spaceship
    ```

=== "zplug"

    Use this command in your `.zshrc` to load Spaceship as prompt theme:

    ```
    zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
    ```

=== "Arch"

    Install the latest master from the AUR package [`spaceship-prompt-git`](https://aur.archlinux.org/packages/spaceship-prompt-git/):

    ```
    git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1
    cd spaceship-prompt-git
    makepkg -si
    ```

## Вітаємо!

You've made it! You've installed Spaceship on your machine!

What's next? Spaceship has reasonable defaults, but you might want to adjust them to your needs. Visit our [Options](./options.md) page to learn how to configure your Spaceship.

<!-- prettier-ignore -->
!!! tip
    Follow [our Twitter](//twitter.com/SpaceshipPrompt) to keep yourself updated about new features, improvements, and bugfixes.

## Troubleshooting

Having trouble? Take a look at out [Troubleshooting](./troubleshooting.md) page.

Still struggling? Please, [file an issue](https://github.com/spaceship-prompt/spaceship-prompt/issues/new/choose), describe your problem and we will gladly help you.
