# Інструменти тестування

Цей набір утиліті має на меті допомогти вам перевірити ваші власні секції. Вони корисні для відтворення командного рядка у вигляді тексту для перевірки відтвореного виводу.

Наприклад, ось приклад тестування з Shunit2:

```zsh
# Необхідно для правильної роботи shunit2
setopt shwordsplit
SHUNIT_PARENT=$0

# Налаштування гачків shunit2
oneTimeSetUp() {
  export TERM="xterm-256color"

  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(char)

  source "spaceship.zsh"
}

# Очищення гачків shunit2
oneTimeTearDown() {
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

# Перевірка
test_char() {
  SPACESHIP_CHAR_COLOR_SUCCESS=blue

  # Тут ми візуалізуємо підказку як рядок
  local actual="$(spaceship::testkit::render_prompt)"
  local expected="%{%B%F{$SPACESHIP_CHAR_COLOR_SUCCESS}%}➜ %{%b%f%}"

  assertEquals "render char" "$expected" "$actual"
}

source tests/shunit2/shunit2
```

## `spaceship::testkit::render_prompt`

Обробляє значення змінної `PROMPT` і виводить його як рядок.

``` title="Signature"
spaceship::testkit::render_prompt
```

## `spaceship::testkit::render_rprompt`

Обробляє значення змінної `RPROMPT` і виводить його як рядок.

``` title="Signature"
spaceship::testkit::render_rprompt
```

## `spaceship::testkit::render_ps2`

Обробляє значення змінної `PS2` і виводить його як рядок.

``` title="Signature"
spaceship::testkit::render_ps2
```
