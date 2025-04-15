# Налаштування для конкретної теки

Нас багато запитували, як змінити налаштування Spaceship для конкретної теки. Для цього існує багато способів. Ми покажемо як це зробити за допомогою інструменту, що називається `direnv`.

`direnv` є інструментом, який дозволяє керувати змінними середовища для теки. Це проста обгортка для файлів `.envrc`. Він може підключати та відключати змінні, визначені в `.envrc` на основі поточної теки. Також він працює не тільки з Zsh, але і з іншими популярними оболонками.

## Встановлення `direnv`

Встановіть `direnv` за допомогою менеджера пакунків на ваш вибір. Або скористайтеся скриптом для встановлення бінарної збірки `direnv`.

[Інструкції зі встановлення](https://github.com/direnv/direnv/blob/master/docs/installation.md ""){.md-button}

Після успішного встановлення `direnv` вам необхідно додати його до вашої оболонки.

## Підключення `direnv` до Zsh

Додайте наступний рядок десь в кінці файлу `.zshrc`:

```zsh title=".zhrc"
eval "$(direnv hook zsh)"
```

## Встановлення змінних середовища для конкретної теки

Щойно ви встановили `direnv` і підключили його до Zsh, ви можете встановити змінні середовища для будь-якої теки у файлі `.envrc` в цій теці.

```zsh title=".envrc"
export SPACESHIP_USER_SHOW='always'
```

Після цього вам потрібно явним чином надати дозвіл на використання файлів `.envrc` в теці.

```
direnv allow /path/to/directory
```

Ось приклад роботи `direnv`:

<div class="terminal-demo">
  <script id="asciicast-l6jOkth3csJQGkJRGV8A6DLl0" src="https://asciinema.org/a/l6jOkth3csJQGkJRGV8A6DLl0.js" data-autoplay="true" data-loop="true" data-preload="true" async></script>
</div>

## Альтернативи `direnv`

Крім `direnv` є багато інших інструментів, які дозволяють керувати змінними середовища для тек. Ось список найбільш популярних:

* [zsh-autoenv](https://github.com/Tarrasch/zsh-autoenv)
* [asdf-direnv](https://github.com/asdf-community/asdf-direnv)
* [shadowenv](https://shopify.github.io/shadowenv/)
* [quickenv](https://github.com/untitaker/quickenv)
