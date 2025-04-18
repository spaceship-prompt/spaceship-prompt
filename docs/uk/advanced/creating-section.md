# Створення власної секції

Ця інструкція спрямована на те, щоб допомогти вам створити свою першу користувацьку секцію.

## Правила для секцій

Рекомендації для створення секцій, які допоможуть підтримувати Spaseship швидким та зрозумілим.

### Секція не повинна засмічувати командний рядок

Having too much in prompt looks ugly. Краще дотримуватися необхідного мінімуму.

* **Добре:** `🚀 v1.2.3`
* **Погано:** `🚀 spasheship#c3BhY2VzaGlw`

### Секція має бути вартою того, щоби бути присутньою

Чи достатньо часто змінюється значення, що його постійно треба показувати в командному рядку? Чи це буде корисним для інших користувачів? Можливо, є підстави виконати команду замість засмічення командного рядка.

* **Добре:** стан/гілка git, версія оточення в пакетному менеджері, й т.д.
* **Погано:** версія фреймворку, постійна версія проєкту, тощо

### Секція повинна бути швидкою

Якщо ваша секція виконає складну перевірку, знайдіть спосіб зробити її швидше. Використовуйте асинхронний показ для виконання важких задач. Секція має бути:

* **Асинхронна:** якщо вона виконує зовнішні команди, виконує складні обчислення, читання великих файлів
* **Синхронна:** якщо перевіряє доступність команди, перевіряє значення змінної середовища

### Дотримуйтесь правил іменування параметрів

Всі параметри командного рядка слідують певному шаблону, так що легко запам'ятати: `SPACESHIP_SECTION_<OPTION>[_PROPERTY]`. Правило просте: під час іменування нових властивостей, зберігайте унікальні частини назв у кінці.

* **Добре:**
  ```
    SPACESHIP_GIT_STATUS_COLOR_BEHIND
    SPACESHIP_GIT_STATUS_COLOR_DIVERGED
  ```
* **Погано:**
  ```
    SPACESHIP_GIT_STATUS_BEHIND_COLOR
    SPACESHIP_GIT_STATUS_DIVERGED_COLOR
  ```

  Тут, `GIT_STATUS` це *секція*, `COLOR` — *опція* і `BEHIND ` або `DIVERGED` є *властивістю*.

## Створення секції

Найпростіший спосіб створити секцію — використати шаблон репозиторію для секції Spaceship.

[:fontawesome-brands-github: Скористатись шаблоном](https://github.com/spaceship-prompt/spaceship-section ""){.md-button}

Репозиторій з секціями містить шаблон для створення власних секцій та документацію, має налаштовані процеси тестування та підготовки випусків. Ознайомтесь з репозиторієм, щоб дізнатись більше.

Відкрийте [`spaceship-section.plugin.zsh` файл](https://github.com/spaceship-prompt/spaceship-section/blob/main/spaceship-section.plugin.zsh), як приклад для створення власної секції.

## Типовий розподіл секцій

Нижче наведено приклад типової секції Spaceship. Звертайте увагу на кілька важливих моментів:

- Визначте параметри для налаштування. Їх назви повинні починатися з `SPACESHIP_`.
- Назва кожної секції Spaceship має починатись з `spaceship_` (наприклад `spaceship_node`). Це домовленість, що використовується для ідентифікації секції.
- Секція має показуватись тільки за потреби (у теці, що містить потрібні файли, коли виконується потрібна команда тощо).

Секції визначаються [API – `spaceship::section`](../api/section.md). Ви можете використовувати [утиліти загального призначення](../api/utils.md) для виконання загальних завдань у секції.

Секція повинна мати подібний вигляд:

```zsh
#
# Foobar
#
# Foobar – це класний інструмент, який полегшує розробку.
# Link: https://www.foobar.xyz

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_FOOBAR_SHOW="${SPACESHIP_FOOBAR_SHOW=true}"
SPACESHIP_FOOBAR_ASYNC="${SPACESHIP_FOOBAR_ASYNC=true}"
SPACESHIP_FOOBAR_PREFIX="${SPACESHIP_FOOBAR_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_FOOBAR_SUFFIX="${SPACESHIP_FOOBAR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_FOOBAR_SYMBOL="${SPACESHIP_FOOBAR_SYMBOL="🍷 "}"
SPACESHIP_FOOBAR_COLOR="${SPACESHIP_FOOBAR_COLOR="white"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Показати статус foobar
# префікс spaceship_ на початку назви секції є обовʼязковим!
# Інакше, секцію не буде завантажено.
spaceship_foobar() {
  # Якщо SPACESHIP_FOOBAR_SHOW дорівнює false, не показувати секцію foobar
  [[ $SPACESHIP_FOOBAR_SHOW == false ]] && return

  # Перевірте, чи доступна для виконання команда foobar
  spaceship::exists foobar || return

  # Показати секцію foobar тільки якщо потрібні для foobar файли знаходяться
  # в поточній робочій теці.

  # утиліта spaceship::upsearch допомагає шукати файли вгору по дереву тек.
  local is_foobar_context="$(spaceship::upsearch foobar.conf)"
  # Тут використовуються глобальні кваліфікатори для перевірки наявності файлів
  #  із певним розширенням в теці. Дізнайтесь про це тут:
  # http://zsh.sourceforge.net/Doc/Release/Expansion.html
  [[ -n "$is_foobar_context" || -n *.foo(#qN^/) || -n *.bar(#qN^/) ]] || return

  local foobar_version="$(foobar --version)"

  # Перевірте, чи правильна версія інструменту
  [[ $tool_version == "system" ]] && return

  # Показати секцію foobar
  # утиліта spaceship::section складає секції. Флаги є опціональними
  spaceship::section::v4 \
    --color "$SPACESHIP_FOOBAR_COLOR" \
    --prefix "$SPACESHIP_FOOBAR_PREFIX" \
    --suffix "$SPACESHIP_FOOBAR_SUFFIX" \
    --symbol "$SPACESHIP_FOOBAR_SYMBOL" \
    "$foobar_status"
}
```

Перегляньте [Правила участі](//github.com/spaceship-prompt/spaceship-prompt/blob/master/CONTRIBUTING.md) для отримання додаткової інформації.

## Поділіться вашою секцією з іншими

Наступний крок — поділитися секцією зі спільнотою.

Відкрити тему обговорення на нашому форумі Discussion:

[Додати в реєстр](https://github.com/spaceship-prompt/spaceship-prompt/blob/master/docs/registry/external.json ""){.md-button} [Поділитись на форумі](https://github.com/spaceship-prompt/spaceship-prompt/discussions/new?category=show-and-tell&title=Section%20for%20[tool] ""){.md-button}
