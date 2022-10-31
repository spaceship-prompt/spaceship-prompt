# Kubernetes `kubectl`

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Kubernetes**](https://kubernetes.io) is an open-source container orchestration system for automating software deployment, scaling, and management.

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

Секція `kubectl_version` показує версію Kubernetes. It is shown only when `kubectl` binary is available.

### Опції

| Змінна                             |          За замовчуванням          | Пояснення                   |
|:---------------------------------- |:----------------------------------:| --------------------------- |
| `SPACESHIP_KUBECTL_VERSION_SHOW`   |               `true`               | Показати підсекцію          |
| `SPACESHIP_KUBECTL_VERSION_ASYNC`  |               `true`               | Рендерити секцію асинхронно |
| `SPACESHIP_KUBECTL_VERSION_PREFIX` |                 -                  | Префікс підсекції           |
| `SPACESHIP_KUBECTL_VERSION_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс підсекції            |
| `SPACESHIP_KUBECTL_VERSION_COLOR`  |               `cyan`               | Колір підсекції             |

## Контекст Kubernetes `kubectl_context`

The `kubectl_context` section shows an active Kubernetes context, which consists of a cluster name and a namespace name (when working in a non-default namespace).

!!! tip
    If your cluster name (and thus context name) is too long, you can give it a shorter name using:

    ```zsh
    kubectl config rename-context very_long_context_name name
    ```

### Defining color base on current context or namespace

To set the section to a different color based on context or namespace, you can define an array of pair values in which the first value of a pair is a color name to use and the second value is a regular expression pattern to match against the section text (context name and/or namespace). The first matched pattern will determine the color, so list order can be used to prioritize patterns.

Here is an example:

```zsh title=".zshrc"
SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=(
  # red if namespace is "kube-system"
  red    '\(kube-system)$'

  # else, green if "dev-01" is anywhere in the context or namespace
  green  dev-01

  # else, red if context name ends with ".k8s.local" _and_ namespace is "system"
  red    '\.k8s\.local \(system)$'

  # else, yellow if the entire content is "test-" followed by digits, and no namespace is displayed
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
