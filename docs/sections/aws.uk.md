# Amazon Web Services (AWS) `aws`

!!! info
    [**Amazon Web Services (AWS)**](https://aws.amazon.com) надає хмарну обчислювальну платформу та API для фізичних осіб, компаній та урядових установ на платній основі, встановлюючи плату спираючись на використані ресурси платформи.

Секція `aws` показує поточний профіль AWS використовуючи змінну оточення [`AWS_VAULT`](https://github.com/99designs/aws-vault).

Якщо змінну `AWS_VAULT` не визначено, ця секція буде використовувати змінну середовища [`AWS_PROFILE`](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html).

## Опції

| Variable               |          За замовчуванням          | Пояснення                               |
|:---------------------- |:----------------------------------:| --------------------------------------- |
| `SPACESHIP_AWS_SHOW`   |               `true`               | Показати секцію                         |
| `SPACESHIP_AWS_PREFIX` |              `using·`              | Префікс секції                          |
| `SPACESHIP_AWS_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                           |
| `SPACESHIP_AWS_SYMBOL` |               `☁️·`                | Символ, що відображається перед секцією |
| `SPACESHIP_AWS_COLOR`  |               `208`                | Колір секції                            |
