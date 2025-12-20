# Загальні утиліти

Тут ви можете ознайомитись з утилітами загального призначення.

## `spaceship::exists`

``` title="Signature"
spaceship::exists <command>
```

Ця команда перевіряє, що вказана програма доступна в системі. Вона зчитує змінну PATH та шукає двійкові файли та функції. Вона повертає нульовий код виходу, якщо `command` існує і ненульовий код в іншому випадку.

Ви можете використовувати цю утиліту, щоб перевірити, чи встановлено якусь програму, і виконувати дії на підставі якихось умов. Наприклад, ви можете повернути помилку та вийти або продовжити виконання сценарію. Наприклад:

```zsh
# Перевірте наявність кількох команд
if spaceship::exists nvm; then
  # отримати версію nvm
elif spaceship::exists node; then
  # отримати версію node
else
  return
fi

# Нічого не робити якщо docker не встановлено
spaceship::exists docker || return
```

## `spaceship::defined`

``` title="Signature"
spaceship::defined <function>
```

Те саме, що і [`spaceship::exists`](#spaceshipexists), але для функцій. Вона повертає нульовий код виходу, якщо `function` існує і ненульовий код в іншому випадку.

Ви можете використовувати цю утиліту для перевірки, чи раніше користувач визначив функцію, чи ні. Наприклад:

```zsh
# Перевірте, чи секцію визначено
if spaceship::defined spaceship_section; then
  spaceship_section
else
  # секцію не знайдено
fi
```

## `spaceship::is_git`

Ця утиліта повертає нульовий код виходу, якщо поточна робоча тека є репозиторієм Git, і відмінним від нуля, якщо це не так. Наприклад:

```zsh
# Вихід якщо поточна тека не є репозиторієм git
spaceship::is_git || return
```

## `spaceship::is_hg`

Те саме, що і [`spaceship::is_git`](#spaceshipisgit), але для репозиторіїв Mercurial. Ця утиліта повертає нульовий код виходу, якщо поточна робоча тека є репозиторієм Mercurial, і відмінним від нуля, якщо це не так.

```zsh
# Вихід якщо поточна тека не є репозиторієм Mercurial
spaceship::is_hg || return
```

## `spaceship::is_section_async`

Перевіряє, чи є секція є асинхронною, чи ні шляхом перевірки параметра `SPACESHIP_<SECTION>_ASYNC`. Ця утиліта повертає нульовий код виходу, якщо секція є асинхронною, і відмінним від нуля, якщо це не так.

Якщо `SPACESHIP_PROMPT_ASYNC` встановлено у `false`, тоді всі секції вважаються синхронними.

``` title="Signature"
spaceship::is_section_async <section>
```

1. `section` _Обовʼязково_ — секція, яку потрібно перевірити.

Деякі секції завжди синхронні, незважаючи ні на що, щоб забезпечити коректну роботу командного рядка. Це: `user`, `dir`, `host`, `exec_time`, `async`, `line_sep`, `jobs`, `exit_code` та `char`.

## `spaceship::is_prompt_async`

Перевіряє, чи командний рядок працює в асинхронному режимі. Ця утиліта повертає нульовий код виходу, якщо командний рядок працює в асинхроннім режимі, і відмінним від нуля, якщо це не так.

Перевіряє, чи `SPACESHIP_PROMPT_ASYNC` встановлено у `true` та [`zsh-async` завантажено](#spaceshipis_section_async).

## `spaceship::deprecated`

Ця утиліта перевіряє, чи `option` встановлено і якщо так, виводить `message`. `message` підтримує esc-послідовності для встановлення кольору тексту, фону та інших візуальних ефектів.

``` title="Signature"
spaceship::deprecated <option> [message]
```

1. `option` _Обовʼязково_ — назва застарілою змінної. Якщо ця змінна встановлена (містить будь-яке значення), то буде надруковано `"%B$deprecated%b is deprecated.`. `%B` і `%b` використовуються, щоб встановити жирний стиль тексту.
2. `message` _опціонально_ — додатковий текст, що додається до повідомлення. Може містити розширення командного рядка.

Детальніше про esc-послідовності в розділі [Prompt Expansion](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html) документації Zsh.

Приклад використання:

```zsh
# Перевірка чи встановлено SPACESHIP_BATTERY_ALWAYS_SHOW
spaceship::deprecated SPACESHIP_BATTERY_ALWAYS_SHOW "Use %BSPACESHIP_BATTERY_SHOW='always'%b instead."
#> SPACESHIP_BATTERY_ALWAYS_SHOW is deprecated. Use SPACESHIP_BATTERY_SHOW='always' instead.
```

## `spaceship::displaytime`

Ця утиліта перетворює `seconds` на зрозумілий формат часу. Вона розділяє `seconds` на дні (`d`), години (`h`), хвилини (`m`) та секунди (`s`).

``` title="Signature"
spaceship::displaytime <seconds> [precision]
```

1. `seconds` _Обовʼязково_ — секунди для перетворення у більш зрозумілий формат.
1. `precision` _Опціонально_ — точність виводу. Стандартне значення — `1`.

Приклад використання виглядає наступним чином:

```zsh
spaceship::displaytime 123456
#> 1d 10h 17m 36.0s

paceship::displaytime 123.45 2
#> 2m 3.45s
```

## `spaceship::union`

Утиліта для виконання об'єднання (перетину) масивів. Вона містить список вмісту, знайденого у двох або більше масивах.

Spaceship використовує цю утиліту внутрішньо для обробки секцій розділів, які потрібно знайти.

``` title="Signature"
spaceship::union <arr1[ arr2[ ...]]>
```

1. `arr...` — перелік масивів.

Розгляньмо приклад:

```zsh
arr1=('a' 'b' 'c')
arr2=('b' 'c' 'd')
arr3=('c' 'd' 'e')
spaceship::union $arr1 $arr2 $arr3
#> a b c d e
```

## `spaceship::upsearch`

Виконує пошук вгору по конкретному файлу або теці. Повертає шлях першого знайденого файлу або теки. Рухається в бік кореня репозиторію або файлової системи. Корисно для розуміння контексту поточної теки.

``` title="Signature"
spaceship::upsearch [--silent] <paths...>
```

1. `paths...` _Обовʼязково_ — перелік шляхів для пошуку.
2. `--silent` або `-s` _Опціонально_ — якщо встановлено, утиліта поверне нульовий код виходу, якщо принаймні один із `шляхів` знайдено, і відмінний від нуля, якщо ні.

Це може бути використано для визначення контексту проєкту або пошуку конкретного файлу вгорі.

```zsh
# Розуміння контексту проєкту
spaceship::upsearch -s package.json node_modules && echo "Node project detected."

# Пошук конкретного файлу вгорі
spaceship::upsearch package.json
#> /path/to/project/package.json
```

## `spaceship::extract`

!!! note
    Псевдонім цієї утиліти – `spaceship::datafile`

Ця утиліта запитує файли даних для отримання певного ключа. Вона повертає значення цього ключа. Виходить з ненульовим кодом, коли тип файлу невідомий, дані не можна прочитати або ключ не знайдено.

``` title="Signature"
spaceship::extract --<type> <file> [...keys]
```

1. `--type` _Обовʼязково_ — тип файлу даних. Може бути `json`, `yaml`, `toml` або `xml`.
2. `file` _Обовʼязково_ — шлях до файлу даних.
3. `key` _Опціонально_ — ключ, значення якого потрібно отримати з файлу.

Ви можете використовувати цю утиліту для запиту даних з файлів:

```zsh
spaceship::extract --json package.json "author.name"
#> "John Doe"
```

Потрібні такі інструменти для читання файлів даних:

* JSON — [`jq`](https://stedolan.github.io/jq/), [`yq`](https://mikefarah.gitbook.io/yq/) або [`python-yq`](https://kislyuk.github.io/yq/), [`python`](https://www.python.org/), [`node`](https://nodejs.org/)
* YAML — [`yq`](https://mikefarah.gitbook.io/yq/) або [`python-yq`](https://kislyuk.github.io/yq/), [`python`](https://www.python.org/)
* TOML — `tomlq` (постачається з [`python-yq`](https://kislyuk.github.io/yq/))
* XML — `xq` (постачається з [`python-yq`](https://kislyuk.github.io/yq/))

!!! tip "Порада"
    Найбільш універсальним рішенням для читання файлів даних є використання [`python-yq`](https://kislyuk.github.io/yq/).
