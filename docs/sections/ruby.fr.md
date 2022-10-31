# Ruby `ruby`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Ruby**](https://www.ruby-lang.org) is a dynamic, reflective, object-oriented, general-purpose programming language.

The `ruby` section displays the version of Ruby. This section supports [rvm-prompt](https://rvm.io/workflow/prompt), [chruby](https://github.com/postmodern/chruby), [rbenv](https://github.com/rbenv/rbenv) and [asdf](https://asdf-vm.com) version managers.

This section is displayed only when the current directory is within a Ruby project, meaning:

* Upsearch finds a `Gemfile` or `Rakefile` file
* The current directory contains any `.rb` file

## Options

| Variable                |              Default               | Meaning                               |
|:----------------------- |:----------------------------------:| ------------------------------------- |
| `SPACESHIP_RUBY_SHOW`   |               `true`               | Show section                          |
| `SPACESHIP_RUBY_ASYNC`  |               `true`               | Render section asynchronously       | |
| `SPACESHIP_RUBY_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                      |
| `SPACESHIP_RUBY_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                      |
| `SPACESHIP_RUBY_SYMBOL` |                `💎·`                | Symbol displayed before the section   |
| `SPACESHIP_RUBY_COLOR`  |               `red`                | Section's color                       |
