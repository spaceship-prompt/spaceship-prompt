# Terraform (`terraform`)

!!! important "За замовчуванням ця секція рендериться асинхронно"

!!! info
    [**Terraform**](https://www.terraform.io) is a tool for building, changing, and combining infrastructure safely and efficiently.

The `terraform` section shows Terraform virtual environment.

This section is only displayed when you have a `terraform` command available in your path and upsearch finds a `.terraform/environment` file.

## Опції

| Змінна                       |          За замовчуванням          | Пояснення                               |
|:---------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_TERRAFORM_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_TERRAFORM_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_TERRAFORM_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_TERRAFORM_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_TERRAFORM_SYMBOL` |               `🛠️·`                | Символ, що відображається перед секцією |
| `SPACESHIP_TERRAFORM_COLOR`  |               `105`                | Колір секції                            |
