# Amazon Web Services (AWS) `aws`

!!! info
[**Amazon Web Services (AWS)**](https://aws.amazon.com) provides on-demand cloud computing platforms and APIs to individuals, companies, and governments, on a metered pay-as-you-go basis.

The `aws` section shows the current AWS profile using the [`AWS_VAULT`](https://github.com/99designs/aws-vault) environment variable.

If the `AWS_VAULT` variable is not defined, this section will use the [`AWS_PROFILE`](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html) environment variable.

## Options

| Variable                             |              Default               | Meaning                             |
| :----------------------------------- | :--------------------------------: | ----------------------------------- |
| `SPACESHIP_AWS_SHOW`                 |               `true`               | Show section                        |
| `SPACESHIP_AWS_PREFIX`               |              `using·`              | Section's prefix                    |
| `SPACESHIP_AWS_SUFFIX`               | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                    |
| `SPACESHIP_AWS_SYMBOL`               |               `☁️·`                 | Symbol displayed before the section |
| `SPACESHIP_AWS_COLOR`                |               `208`                | Section's color                     |
| `SPACESHIP_AWS_PROFILE_SHOW`         |               `true`               | Show current set Profile            |
| `SPACESHIP_AWS_ACCOUNT_ALIAS_SHOW`   |               `true`               | Show current account alias          |
| `SPACESHIP_AWS_ACCOUNT_NUMBER_SHOW`  |               `true`               | Show current account number         |
| `SPACESHIP_AWS_ACCOUNT_ROLE_SHOW`    |               `true`               | Show current role being used        |
| `SPACESHIP_AWS_ACCOUNT_SESSION_SHOW` |               `true`               | Show current session name           |
