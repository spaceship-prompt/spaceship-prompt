# Kubernetes `kubectl`

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Kubernetes**](https://kubernetes.io) – система з відкритими сирцями керування контейнерами для автоматизації розгортання, масштабування та керування програмним забезпеченням.

Секція `kubectl` складається з підсекцій [`kubectl_version`](#kubernetes-version-kubectl_version) та [`kubectl_context`](#kubernetes-context-kubectl_context). Вона відображається тільки коли `kubectl` може підключитись до кластера Kubernetes.

## Опції

| Змінна                     |          За замовчуванням          | Пояснення                               |
|:-------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_KUBECTL_SHOW`   |              `false`               | Показати секцію                         |
| `SPACESHIP_KUBECTL_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_KUBECTL_PREFIX` |               `at·`                | Префікс секції                          |
| `SPACESHIP_KUBECTL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_KUBECTL_COLOR`  |              `white`               | Колір секції Kubernetes                 |
| `SPACESHIP_KUBECTL_SYMBOL` |               `☸️·`                | Символ, що відображається перед секцією |

## Версія Kubernetes `kubectl_version`

Секція `kubectl_version` показує версію Kubernetes. Вона показується лише за наявності `kubectl`.

### Параметри

| Змінна                             |          За замовчуванням          | Пояснення                   |
|:---------------------------------- |:----------------------------------:| --------------------------- |
| `SPACESHIP_KUBECTL_VERSION_SHOW`   |               `true`               | Показати підсекцію          |
| `SPACESHIP_KUBECTL_VERSION_ASYNC`  |               `true`               | Рендерити секцію асинхронно |
| `SPACESHIP_KUBECTL_VERSION_PREFIX` |                 -                  | Префікс підсекції           |
| `SPACESHIP_KUBECTL_VERSION_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс підсекції            |
| `SPACESHIP_KUBECTL_VERSION_COLOR`  |               `cyan`               | Колір підсекції             |

## Контекст Kubernetes `kubectl_context`

Секція `kubectl_context` показує активний контекст Kubernetes, який складається з імені кластера та назви простору імен (коли ви працюєте не в стандартному просторі імен).

!!! tip "Порада"
    Якщо назва вашого кластера (і, отже, назва контексту) задовга, ви можете дати йому коротшу назву за допомогою:

    ```zsh
    kubectl config rename-context very_long_context_name name
    ```

### Визначення кольору на основі поточного контексту або простору імен

Щоб встановити для розділу інший колір залежно від контексту чи простору імен, ви можете визначити масив парних значень, у якому перше значення пари – це назва, а друге значення – це регулярний вираз для порівняння з текстом секції (назва контексту та/або простір імен). Перший збіг визначатиме колір, отже розташовуйте вирази відповідно до їх пріоритету.

Розгляньмо приклад:

```zsh title=".zshrc"
SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=(
  # red якщо простір імен – "kube-system"
  red    '\(kube-system)$'

  # інакше, green, якщо "dev-01" є або в контексті або в просторі імен
  green  dev-01

  # або, red, якщо назва контексту закінчується на ".k8s.local" _та_ простір імен — "system"
  red    '\.k8s\.local \(system)$'

  # інакше, yellow, якщо в контексті є збіг зі словом "test-" після якого йдуть цифри та простір імен не показується
  yellow '^test-[0-9]+$'
)
```

### Опції

| Змінна                                     |          За замовчуванням          | Пояснення                        |
|:------------------------------------------ |:----------------------------------:| -------------------------------- |
| `SPACESHIP_KUBECTL_CONTEXT_SHOW`           |               `true`               | Показати підсекцію               |
| `SPACESHIP_KUBECTL_CONTEXT_PREFIX`         |               `at·`                | Префікс підсекції                |
| `SPACESHIP_KUBECTL_CONTEXT_SUFFIX`         | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс підсекції                 |
| `SPACESHIP_KUBECTL_CONTEXT_COLOR`          |               `cyan`               | Колір підсекції                  |
| `SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE` |               `true`               | Чи слід відображати простір імен |
| `SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS`   |                 -                  | _Масив_ пар кольорів та шаблонів |
