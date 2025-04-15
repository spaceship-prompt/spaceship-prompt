# Ruby `ruby`

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Ruby**](https://www.ruby-lang.org) — це динамічна, рефлексивна, об’єктноорієнтована мова програмування загального призначення.

Секція `ruby` відображає версію Ruby. Секція підтримує менеджери керування версіями [rvm-prompt](https://rvm.io/workflow/prompt), [chruby](https://github.com/postmodern/chruby), [rbenv](https://github.com/rbenv/rbenv) та [asdf](https://asdf-vm.com).

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
