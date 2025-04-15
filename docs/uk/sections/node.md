# Node.js `node`

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Node.js**](https://nodejs.org) — це середовище виконання JavaScript, створене поверх рушія JavaScript V8 Chrome.

Секція `node` показує версію поточного рушія Node.js. Ця секція працює з менеджерами керування версіями: [nvm](https://github.com/nvm-sh/nvm), [nodenv](https://github.com/nodenv/nodenv), [fnm](https://github.com/Schniz/fnm) або використовує `node -v`, якщо жоден з них не встановлено.

Ця секція показується лише тоді, коли поточна тека знаходиться в межах проєкту Node.js, тобто:

* Пошук вгору знаходить файл `package.json`
* Пошук вгору знаходить папку `node_modules`
* Пошук вгору знаходить файл `.nvmrc`
* Пошук вгору знаходить файл `.node-version`
* Тека містить файли з розширеннями `.js`, `.cjs` або `.mjs`

## Встановлення версії Node.js за замовчуванням

Якщо ви бажаєте уникнути показу секції Node.js для певних версій (наприклад, версії встановленої разом з системою), використовуйте змінну `SPACESHIP_NODE_DEFAULT_VERSION`. Секцію буде приховано, якщо поточна версія Node.js збігається зі значенням змінної.

```zsh title=".spaceshiprc.zsh"
SPACESHIP_NODE_DEFAULT_VERSION="18.0.0"
```

## Параметри

| Змінна                           |          За замовчуванням          | Пояснення                                     |
|:-------------------------------- |:----------------------------------:| --------------------------------------------- |
| `SPACESHIP_NODE_SHOW`            |               `true`               | Показати секцію                               |
| `SPACESHIP_NODE_ASYNC`           |               `true`               | Рендерити секцію асинхронно                   |
| `SPACESHIP_NODE_PREFIX`          | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                                |
| `SPACESHIP_NODE_SUFFIX`          | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                                 |
| `SPACESHIP_NODE_SYMBOL`          |                `⬢·`                | Символ, що відображається перед секцією       |
| `SPACESHIP_NODE_COLOR`           |              `green`               | Колір секції                                  |
| `SPACESHIP_NODE_DEFAULT_VERSION` |                 ``                 | Версія Node.js, яку слід розглядати як типову |
