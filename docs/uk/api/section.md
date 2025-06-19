# Секції

Секції визначаються за допомогою функції `spaceship::section`. Секція отримує значення параметрів для показу, такі як префікс, суфікс, колір та символ. Ці значення будуть використані для показу секції.

`spaceship::section` використовується для упаковування даних секції в кортеж даних. Цей кортеж даних зберігається в кеші. Під час процесу обробки, кортеж для кожної секції перетворюється в секцію за допомогою функції `spaceship::section::render`.

## `spaceship::section`

!!! tip "Порада"
    Для створення власної секції бажано використовувати функцію [`spaceship::section::v4` function](#spaceshipsectionv4). Функція з зазначенням версії забезпечить сумісність з новими версіями Spaceship.

Це основна функція для створення секції. Вона зчитує параметри секції і її вміст і перетворює їх на кортежі даних.

``` title="Signature"
spaceship::section [--color color] [--prefix prefix] [--suffix suffix] [--symbol symbol] <content>
```

Вона бере один аргумент `content`, який є контентом секції. Крім того, функція приймає наступні додаткові параметри:

* `--color` — колір для показу `вмісту`. Може бути [назвою кольору](https://wiki.archlinux.org/index.php/zsh#Colors) чи [кодом кольору](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).
* `--prefix` — префікс перед `content`. Зазвичай це значення `SPACESHIP_<SECTION>_PREFIX`.
* `--symbol` — символ секції. Може бути будь-яким допустимим значенням або результатом виконання команд. Буде додано перед змістом.
* `--suffix` — суфікс після `content`. Зазвичай це значення `SPACESHIP_<SECTION>_SUFFIX`.

Порядок параметрів не важливий. Типово всі вони є порожніми рядками.

!!! help "Довідка"
   `content`, `--prefix`, `--suffix` та `--symbol` можуть містити esc-послідовності для встановлення додаткових кольорів фону, написів та інших візуальних ефектів.

    Детальніше про esc-послідовності в [13 Prompt Expansion](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html) розділі документації Zsh.

## `spaceship::section::v4`

Це псевдонім функції `spaceship:section`. Це функція з версією для створення власної секції.

Підпис цієї функції такий самий, як і для функції `spaceship::section`.

Приклад використання:

```zsh
local content="value"

spaceship::section::v4 \
  --color "$SPACESHIP_SECTION_COLOR" \
  --prefix "$SPACESHIP_SECTION_PREFIX" \
  --suffix "$SPACESHIP_SECTION_SUFFIX" \
  --symbol "$SPACESHIP_SECTION_SYMBOL" \
  "$content"
```

## `spaceship::section::v3`

!!! warning "Попередження"
    Ця функція введена для сумісності з секціями Spachip v3. Натомість рекомендується використовувати функцію [`spaceship::section::v4`](#spaceshipsectionv4).

Це замінник для функції `spaceship::section`, що використовувався в Spaceship v3. Використовуйте його для зворотної сумісності.

``` title="Signature"
spaceship::section <color> [prefix] <content> [suffix]
```

`spaceship::section:v3` покладається на наступний порядок аргументів:

1. `color` _Обовʼязково_ — колір для показу `content`. Може бути [назвою кольору](https://wiki.archlinux.org/index.php/zsh#Colors) чи [кодом кольору](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg).
2. `prefix` _Опціонально_ — префікс перед `content`. Зазвичай це значення `SPACESHIP_<SECTION>_PREFIX`.
3. `content` _Обовʼязково_ — вміст секції. Може бути будь-яким допустимим значенням або результатом виконання команд.
4. `suffix` _Опціонально_ — суфікс після `content`. Зазвичай це значення `SPACESHIP_<SECTION>_SUFFIX`.

Ось простий приклад:

```zsh
# Показ секції з префіксом та суфіксом
# Зворотна коса риска використовується для екранування кінця рядка
spaceship::section \
  "$SPACESHIP_SECTION_COLOR" \
  "$SPACESHIP_SECTION_PREFIX" \
  "$SPACESHIP_SECTION_SYMBOL$section_content" \
  "$SPACESHIP_SECTION_SUFFIX"

# Показ секції без префікса та суфікса
spaceship::section "$color" "$SPACESHIP_CHAR_SYMBOL"
```

## `spaceship::section::render`

Ця функція обробляє секцію з кортежу даних отриманих з [`spaceship::section`](#spaceshipsection).

``` title="Signature"
spaceship::render section <data>
```

Якщо `SPACESHIP_PROMPT_PREFIXES_SHOW` є `false` або якщо секція не є першою у запиті, то префікс буде пропущений.

Якщо `SPACESHIP_PROMPT_SUFFIXES_SHOW` є `false`, тоді суфікс буде пропущено.

`data` є результатом функції `spaceship::section`. Наприклад:

```zsh
local color="red" content="value"

spaceship::section::render "$(spaceship::section --color "$color" "$content")"
#> %{%B%F{red}%}value%{%b%f%}
```

!!! tip "Порада"
    Можна використовувати обробку підсекцій у складних секціях. Наприклад, подивіться сирці секцій [`git`](https://github.com/spaceship-prompt/spaceship-prompt/blob/master/sections/git.zsh) або [`docker`](https://github.com/spaceship-prompt/spaceship-prompt/blob/master/sections/docker.zsh).
