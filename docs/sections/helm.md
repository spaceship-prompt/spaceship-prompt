# Helm `helm`

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Helm**](https://helm.sh) Helm helps you manage Kubernetes applications — Helm Charts help you define, install, and upgrade even the most complex Kubernetes application.

The `helm` section displays the version of the Helm.

This section is displayed only when the current directory is within a Helm project, meaning:

* Upsearch finds helmfile.yaml or Chart.yaml 

## Options

| Variable                |              Default               | Meaning                             |
| :---------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_HELM_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_HELM_ASYNC`  |               `true`               | Render section asynchronously       |
| `SPACESHIP_HELM_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_HELM_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_HELM_SYMBOL` |               `⎈ `                 | Symbol displayed before the section |
| `SPACESHIP_HELM_COLOR`  |               `blue`               | Section's color                     |
