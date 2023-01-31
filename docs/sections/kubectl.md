# Kubernetes `kubectl`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Kubernetes**](https://kubernetes.io) is an open-source container orchestration system for automating software deployment, scaling, and management.

The `kubectl` section consists of [`kubectl_version`](#kubernetes-version-kubectl_version) and [`kubectl_context`](#kubernetes-context-kubectl_context) subsections. It is shown only when `kubectl` can connect to Kubernetes cluster.

## Options

| Variable                   |              Default               | Meaning                               |
| :------------------------- | :--------------------------------: | ------------------------------------- |
| `SPACESHIP_KUBECTL_SHOW`   |              `false`               | Show section                          |
| `SPACESHIP_KUBECTL_ASYNC`  |              `true`                | Render section asynchronously         |
| `SPACESHIP_KUBECTL_PREFIX` |               `at·`                | Section's prefix                      |
| `SPACESHIP_KUBECTL_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                      |
| `SPACESHIP_KUBECTL_COLOR`  |              `white`               | Section's color of Kubernetes section |
| `SPACESHIP_KUBECTL_SYMBOL` |               `☸️·`                 | Symbol displayed before the section   |

## Kubernetes version `kubectl_version`

The `kubectl_version` section shows the version of the Kubernetes. It is shown only when `kubectl` binary is available.

### Options

| Variable                           |              Default               | Meaning                       |
| :--------------------------------- | :--------------------------------: | ----------------------------- |
| `SPACESHIP_KUBECTL_VERSION_SHOW`   |               `true`               | Show subsection               |
| `SPACESHIP_KUBECTL_VERSION_ASYNC`  |               `true`               | Render section asynchronously |
| `SPACESHIP_KUBECTL_VERSION_PREFIX` |                 -                  | Subsection's prefix           |
| `SPACESHIP_KUBECTL_VERSION_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Subsection's suffix           |
| `SPACESHIP_KUBECTL_VERSION_COLOR`  |               `cyan`               | Subsection's color            |

## Kubernetes context `kubectl_context`

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

### Prettifying the displayed context and namespace

You can furthermore alter the displayed context and namespace in functions of your own. To do so, write functions that accept the raw value in `$1` and echo the prettified version, and supply their names in the `SPACESHIP_KUBECTL_CONTEXT_PRETTIFY_CONTEXT` and `SPACESHIP_KUBECTL_CONTEXT_PRETTIFY_NAMESPACE` options, respectively.

For instance, you would make production clusters stand out with:

```zsh title=".zshrc"
prettify_kubectl_context() {
  local name="$1"
  [[ $name = (#b)prod-(*) ]] && name="$match[1]$emoji[smiling_imp]"
  echo $name
}
SPACESHIP_KUBECTL_CONTEXT_PRETTIFY_CONTEXT=prettify_kubectl_context
```

(This assumes that you have Oh My Zsh's `$emoji[]` loaded, for readability.)

### Options

| Variable                                       |              Default               | Meaning                                           |
| :--------------------------------------------- | :--------------------------------: | ------------------------------------------------- |
| `SPACESHIP_KUBECTL_CONTEXT_SHOW`               |               `true`               | Show subsection                                   |
| `SPACESHIP_KUBECTL_CONTEXT_PREFIX`             |                 -                  | Subsection's prefix                               |
| `SPACESHIP_KUBECTL_CONTEXT_SUFFIX`             | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Subsection's suffix                               |
| `SPACESHIP_KUBECTL_CONTEXT_COLOR`              |               `cyan`               | Subsection's color                                |
| `SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE`     |               `true`               | Should namespace be also displayed                |
| `SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS`       |                 -                  | _Array_ of pairs of colors and match patterns     |
| `SPACESHIP_KUBECTL_CONTEXT_PRETTIFY_CONTEXT`   |                 -                  | Name of function to alter the displayed context   |
| `SPACESHIP_KUBECTL_CONTEXT_PRETTIFY_NAMESPACE` |                 -                  | Name of function to alter the displayed namespace |
