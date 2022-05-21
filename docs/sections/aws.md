---
hide: [toc]
---

# Amazon Web Services (AWS) `aws`

!!! info
    [**Amazon Web Services (AWS)**](aws.amazon.com) provides on-demand cloud computing platforms and APIs to individuals, companies, and governments, on a metered pay-as-you-go basis.

The `aws` section shows the current AWS profile using the [`AWS_VAULT`](https://github.com/99designs/aws-vault) environment variable.

If the `AWS_VAULT` variable is not defined, this section will use the [`AWS_PROFILE`](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html) environment variable.

## Options

| Variable               |              Default               | Meaning                                      |
| :--------------------- | :--------------------------------: | -------------------------------------------- |
| `SPACESHIP_AWS_SHOW`   |               `true`               | Show current selected AWS-cli profile or not |
| `SPACESHIP_AWS_PREFIX` |              `using·`              | Prefix before the AWS section                |
| `SPACESHIP_AWS_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the AWS section                 |
| `SPACESHIP_AWS_SYMBOL` |               `☁️·`                | Character to be shown before AWS profile     |
| `SPACESHIP_AWS_COLOR`  |               `208`                | Color of AWS section                         |
