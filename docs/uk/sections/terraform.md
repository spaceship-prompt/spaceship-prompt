# Terraform (`terraform`)

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Terraform**](https://www.terraform.io) – це інструмент для безпечного й ефективного створення, зміни та об’єднання інфраструктури.

Секція `terraform` показує інформацію про віртуальне середовище Terraform.

Ця секція показується лише коли у вас команда `terraform` доступна у змінній оточення Path і пошук знаходить файл `.terraform/environment`.

## Опції

| Змінна                       |          За замовчуванням          | Пояснення                               |
|:---------------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_TERRAFORM_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_TERRAFORM_ASYNC`  |               `true`               | Рендерити секцію асинхронно             |
| `SPACESHIP_TERRAFORM_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                          |
| `SPACESHIP_TERRAFORM_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_TERRAFORM_SYMBOL` |               `🛠️·`                | Символ, що відображається перед секцією |
| `SPACESHIP_TERRAFORM_COLOR`  |               `105`                | Колір секції                            |
