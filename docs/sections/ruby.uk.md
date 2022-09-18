# Ruby `ruby`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Ruby**](https://www.ruby-lang.org) is a dynamic, reflective, object-oriented, general-purpose programming language.

Секція `ruby` відображає версію Ruby. This section supports [rvm-prompt](https://rvm.io/workflow/prompt), [chruby](https://github.com/postmodern/chruby), [rbenv](https://github.com/rbenv/rbenv) and [asdf](https://asdf-vm.com) version managers.

Ця секція відображається лише тоді, коли поточний каталог знаходиться у Ruby-проєкті, тобто:

* Пошук вгору знаходить файл `Gemfile` або `Rakefile`
* Поточна папка містить будь-який файл `.rb`

## Опції

| Змінна                  |          За замовчуванням          | Пояснення                               |
|:----------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_RUBY_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_RUBY_ASYNC`  |               `true`               | Рендерити секцію асинхронно       |     |
| `SPACESHIP_RUBY_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_RUBY_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_RUBY_SYMBOL` |                `💎·`                | Символ, що відображається перед секцією |
| `SPACESHIP_RUBY_COLOR`  |               `red`                | Колір секції                            |
