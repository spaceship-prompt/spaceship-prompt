# Deno (`deno`)

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Deno**](https://deno.land) — захищене середовище для запуску JavaScript і TypeScript.

Секція `deno` показує версію Deno.

Ця секція показується лише тоді, коли:

- Пошук вгору знаходить файл `deno.json` або `deno.jsonc`
- Поточна тека містить файли `deps.ts`, `mod.ts`, `main.ts` або `cli.ts`.

## Налаштування стандартної версії Deno

Якщо ви вкажете у `SPACESHIP_DENO_DEFAULT_VERSION` стандартну версію Deno, а поточна версія на платформі збігається з `SPACESHIP_DEFAULT_VERSION`, тоді Deno

```zsh title=".spaceshiprc.zsh"
SPACESHIP_DENO_DEFAULT_VERSION="1.25.3"
```

## Опції

| Змінна                           |          За замовчуванням          | Пояснення                                 |
|:-------------------------------- |:----------------------------------:| ----------------------------------------- |
| `SPACESHIP_DENO_SHOW`            |               `true`               | Показати секцію                           |
| `SPACESHIP_DENO_ASYNC`           |               `true`               | Рендерити секцію асинхронно               |
| `SPACESHIP_DENO_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                            |
| `SPACESHIP_DENO_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                             |
| `SPACESHIP_DENO_SYMBOL`          |                `🦕·`                | Символ, що показується на початку секції  |
| `SPACESHIP_DENO_DEFAULT_VERSION` |                 ``                 | Версія Deno, що вважатиметься стандартною |
| `SPACESHIP_DENO_COLOR`           |               `cyan`               | Колір секції                              |
