# Pulumi (`pulumi`)

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Terraform**](https://www.pulumi.com/) is an infrastructure-as-code platform for full-stack developers.

The `pulumi` section shows Pulumi stack.

This section is only displayed when you have a `pulumi` command available and:

* Upsearch finds a `Pulumi.yaml` or `Pulumi.yml` file
* Upsearch finds a `.pulumi/stacks` file

## Options

| Variable                  |              Default               | Meaning                             |
| :------------------------ | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_PULUMI_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_PULUMI_ASYNC`  |               `true`               | Render section asynchronously       |
| `SPACESHIP_PULUMI_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_PULUMI_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_PULUMI_SYMBOL` |               ` `                | Symbol displayed before the section |
| `SPACESHIP_PULUMI_COLOR`  |               `133`                | Section's color                     |
