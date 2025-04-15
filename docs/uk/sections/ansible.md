# Ansible (`ansible`)

!!! important "Типово ця секція обробляється асинхронно"

!!! info "Інформація"
    [**Ansible**](https://www.ansible.com/) – це набір програмних інструментів, які дозволяють працювати з інфраструктурою як з кодом.

Секція `ansible` показує версію Ansible.

Ця секція показується лише за наявності команди `ansible` у вашій системі та:

* Шукає файл `ansible.cfg` чи `.ansible.cfg`
* Поточна тека містить файл з розширеннями `.yml`, `.yaml` з інструкціями ansible.

## Параметри

| Змінна                     |               Типово               | Опис                                     |
|:-------------------------- |:----------------------------------:| ---------------------------------------- |
| `SPACESHIP_ANSIBLE_SHOW`   |               `true`               | Показати секцію                          |
| `SPACESHIP_ANSIBLE_ASYNC`  |               `true`               | Обробляти секцію асинхронно              |
| `SPACESHIP_ANSIBLE_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Префікс секції                           |
| `SPACESHIP_ANSIBLE_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Суфікс секції                            |
| `SPACESHIP_ANSIBLE_SYMBOL` |                `🅐`                 | Символ, що показується на початку секції |
| `SPACESHIP_ANSIBLE_COLOR`  |              `white`               | Колір секції                             |
