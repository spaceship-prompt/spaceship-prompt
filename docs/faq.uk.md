# Часті запитання

Ця сторінка допоможе вам вирішити поширені проблеми, що можуть виникнути при використанні Spaceship.

Якщо ви зовсім застрягли, пошукайте допомоги на нашому сервері Discord або форумі GitHub Discussions:

[:fontawesome-brands-discord: Discord][discord]{ .md-button }
[:fontawesome-brands-github: Discussions][discussions]{ .md-button }

## Чому мій командний рядок виглядає не так, як на превʼю?

<div class="terminal-demo">
  <script id="asciicast-513451" src="https://asciinema.org/a/513451.js" data-autoplay="true" data-loop="true" data-preload="true" async></script>
  <noscript>
    <object class="asciicast" type="image/svg+xml" data="/assets/images/spaceship-demo.svg">
      <img src="/assets/images/spaceship-demo.gif" alt="Демо Spaceship" />
    </object>
  </noscript>
</div>

Командний рядок `spaceship` у превʼю показано в наступному середовищі:

- **Термінал**
    - [iTerm2](https://iterm2.com/) в якості емулятору терміналу.
    - Тема [One Dark](https://www.npmjs.com/package/hyperterm-atom-dark).
    - [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads) з лігатурами у якості основного шрифту (розмір 16px).
- **Конфігурація оболонки**
    - [denysdovhan's Dotfiles](https://github.com/denysdovhan/dotfiles)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) для розфарбування команд.
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) для автозаповнення як в браузері.

Дивіться [скріншоти](https://github.com/spaceship-prompt/spaceship-prompt/wiki/Screenshots) у wiki з прикладами інших кольорових схем.

## Як мені отримати таке ж автозаповнення у демо GIF?

Використовуйте [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) щоб отримати автозаповнення команд як в браузері, на основі вашої історії.

## Що це за дивний символ перед гілкою `git`?

Для правильного показу символу гілки `git` у вас має бути встановлено пропатчений Powerline шрифт.

- Встановіть будь-який Powerline-сумісний шрифт на кшталт [Fira Code](https://github.com/tonsky/FiraCode) або [інший](https://github.com/powerline/fonts).
- Сконфігуруйте ваш емулятор терміналу на [використання цього шрифту](https://powerline.readthedocs.io/en/master/troubleshooting/osx.html).

## Що за дивний символ перед секцією?

Ця проблема не стосується безпосередньо командного рядку Spaceship. Spaceship використовує сиволи Unicode для відображення `SPACESHIP_*_SYMBOL` в секціях. Для вирішення проблеми:

- Переконайтесь, що ваш емулятор терміналу підтримує символи Unicode, за допомогою команди:
  ```zsh
  curl -L https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  # або
  wget -O - https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  ```
- Сконфігуруйте ваш емулятор терміналу на використання кодування символів UTF-8.
  - `LC_ALL` мусить мати [значення UTF-8](https://www.tecmint.com/set-system-locales-in-linux/), наприклад `en_US.UTF-8` або `de_DE.UTF-8` тощо.
  - Вам необхідно встановити шрифт для emoji. Більшість систем вже мають такий шрифт, але не всі (наприклад, Arch Linux). Якщо у вашій системі бракує такого шрифту, встановіть його за допомогою менеджера пакетів. [noto emoji](https://www.google.com/get/noto/help/emoji) – поширений вибір.
  -

У разі, якщо символи Unicode не підтримуються, ви можете замінити їх на ті, які сумісні з вашим терміналом, за допомогою `SPACEIP_*_SYMBOL` опцій. Дивіться сторінку [Опції](/config/intro).

## Чи `spaceship remove <section>` та `SPACESHIP_<SECTION>_SHOW=false` роблять одне й те саме?

Обидві команди, `spaceship remove` та `SPACESHIP_<SECTION>_SHOW=false`, прибирають секцію командного рядка, але роблять це по-різному.

Команда `spaceship remove` прибирає секцію зі змінної `SPACESHIP_[R]PROMPT_ORDER`, запобігаючи завантаженню та запуску секції.

Команда `SPACESHIP_<SECTION>_SHOW=false` не перешкоджає завантаженню та запуску секції. Секцію буде завантажено та запущено, однак сама секція вирішуватиме як її сховати (зазвичай секція пропускає всі перевірки й нічого не відображає).

tldr: `spaceship remove` змушує Spaceship пропустити секцію, а `SPACESHIP_<SECTION>_SHOW=false` каже секції сховати себе самостійно.

## В чому різниця між Spaceship та Starship?

[Starship](https://starship.rs) це чудовий командний рядок, рівний (більш-менш) у можливостях зі Spaceship. Так у чому ж різниця?

[Starship](https://starship.rs) написаний на Rust і є нащадком [Spacefish](https://spacefish.matchai.dev/) – імплементації Spaceship для Fish. Автори надихалися Spaceship (вони підтверджують це на своєму вебсайті). Він також базується на ідеях Дениса Довганя про кросс-оболонкові командні рядки, прототип реалізації яких наведено в [denysdovhan/robbyrussell-node](https://github.com/denysdovhan/robbyrussell-node).

Перевага Starship в тому, що він підтримує більшість існуючих оболонок. Spaceship, з іншого боку, працює лише з Zsh, але використовує його можливості на максимум.

Starship виконує перевірки асинхронно, відображаючи командний рядок як тільки він буде готовий. Spaceship також виконує перевірки асинхронно, але відображає командний рядок одразу та оновлює його, коли нова інформація надходить від асинхронних задач.

Spaceship вважає користувацькі секції обʼєктами першого класу та має Реєстр користувацьких секцій, а Starship пропонує використовувати [команди](https://starship.rs/config/#custom-commands) для створення користувацьких модулів.

Якщо ви використовуєте різні компʼютери з різними оболонками, Starship може стати кращим вибором. Spaceship більше підійде, якщо у вас одна конфігурація Zsh на всіх машинах.

## В чому різниця між Spaceship та Powerlevel10k (з Lean стилем)?

[Powerlevel10k](https://github.com/romkatv/powerlevel10k) (з Lean стилем) – ще один командний рядок для Zsh, що дуже нагадує Spaceship.

Обидва командні рядки асинхронні та відображаються одразу. Powerlevel10k використовує монолітний підхід та має безліч можливостей у єдиному командному рядку. Spaceship, з іншого боку, більш модульний, дозволяє створювати користувацькі секції та надає чмсленні варіанти налаштувань.

Powerlevel10k дозволяє мати декілька пресетів дизайну. Spaceship підтримує лише один.

## Іконки деяких секцій перекриваються?

![приклад перекриття значків](https://user-images.githubusercontent.com/3459374/34945188-1f6398be-fa0b-11e7-9845-a744bc3e148d.png)

Ця проблема повʼязана з особливостями відображення символів Unicode 9 вашим емулятором терміналу. Для її вирішення:

- Переконайтеся, що термінал використовує налаштування _Unicode Version 9 Widths_.
- Дозвольте терміналу показувати символи з неоднозначною шириною як символи подвійної ширини.

У _iTerm_ дотримуйтеся цих інструкцій:

- Перейдіть в _iTerm → Preferences… (⌘,) → Profiles → Text_
- Перевірте налаштування _Unicode Version 9 Widths_.
- Перевірте налаштування _Threat ambiguous-width characters as double-width_.
- Перезавантажте вкладку терміналу.

## Все ще не вирішили проблему?

Якщо нічого з вищенаведеного не допомогло, будь ласка, поставте питання на нашому Discord сервері або [створіть тему на Github][issues], опишіть вашу проблему, і ми з радістю допоможемо.

[:fontawesome-brands-discord: Discord][discord]{ .md-button }
[:fontawesome-brands-github: Discussions][discussions]{ .md-button }
[:fontawesome-brands-github: Віктрити питання][issues]{ .md-button }

<!-- References -->

[discord]: https://discord.gg/NTQWz8Dyt9
[discussions]: https://github.com/spaceship-prompt/spaceship-prompt/discussions/
[issues]: https://github.com/spaceship-prompt/spaceship-prompt/issues/new
[issues]: https://github.com/spaceship-prompt/spaceship-prompt/issues/new
