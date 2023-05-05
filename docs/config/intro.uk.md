# Вступ

Ласкаво просимо до конфігурації Spaceship! Ось швидкий посібник по налаштуванню Spaceship для ваших особистих робочих процесів.

## Створення файлу конфігурації

Щоб почати з налаштування, створіть файл конфігурації:

```zsh
touch ~/.spaceshiprc.zsh
```

… або, якщо ви бажаєте зберегти свою конфігурацію в папках `~/.config` або `~/.config/spaceship`, зробіть ось це:

```zsh
mkdir -p ~/.config/spaceship.zsh
```

Spaceship автоматично завантажить цей файл при запуску.

## Налаштуйте ваш командний рядок

Файл конфігурації є файлом `.zsh`, тому ви можете використовувати `zsh`-синтаксис для налаштування Spaceship. Можна використовувати цикли, умови, користувацькі функції або навіть завантажувати додаткові `zsh` файли. Вирішувати вам.

Ось приклад файлу конфігурації:

```zsh
# Показувати час
SPACESHIP_TIME_SHOW=true

# Завжди показувати ім'я користувача
SPACESHIP_USER_SHOW=always

# Не скорочувати шлях в репозиторіях
SPACESHIP_DIR_TRUNC_REPO=false

# Додати зовнішню секцію Ember
# See: https://github.com/spaceship-prompt/spaceship-ember
spaceship add ember

# Додати зовнішню секцію vi-mode
# See: https://github.com/spaceship-prompt/spaceship-vi-mode
spaceship add --before char vi_mode
```

Ви можете дізнатися більше про доступні опції, читаючи документацію далі.

[Переглянути доступні опції](/config/prompt ""){.md-button}

## Зміна розташування файлу конфігурації

Додатково, ви можете змінити розташування файлу конфігурації у змінній середовища `SPACESHIP_CONFIG_FILE`.

```zsh
export SPACESHIP_CONFIG="$HOME/.dotfiles/path/to/spaceship.zsh"
```
