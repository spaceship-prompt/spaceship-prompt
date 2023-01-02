# Ansible (`ansible`)

!!! important "This section is rendered asynchronously by default"

!!! info
    [**Ansible**](https://www.ansible.com/) is a suite of software tools that enables infrastructure as code.

The `ansible` section shows Ansible version.

This section is only displayed when you have a `ansible` command available and:

* Upsearch finds a `ansible.cfg` or `.ansible.cfg` file
* Current directory contains a file with `.yml`, `.yaml` extensions containing ansible playbooks.

## Options

| Variable                  |              Default               | Meaning                             |
| :------------------------ | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_ANSIBLE_SHOW`   |               `true`               | Show section                        |
| `SPACESHIP_ANSIBLE_ASYNC`  |               `true`               | Render section asynchronously       |
| `SPACESHIP_ANSIBLE_PREFIX` | `$SPACESHIP_PROMPT_DEFAULT_PREFIX` | Section's prefix                    |
| `SPACESHIP_ANSIBLE_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_ANSIBLE_SYMBOL` |               `🅐 `                | Symbol displayed before the section |
| `SPACESHIP_ANSIBLE_COLOR`  |               `white`              | Section's color                     |
