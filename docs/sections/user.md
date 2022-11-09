# Username `user`

The `user` section shows the current user's username. By default, it's displayed only when:

* the machine is connected via SSH (`$SSH_CONNECTION` is not empty)
* username is not the same as `$LOGNAME`
* username is a root user

The root user is highlighted in `SPACESHIP_USER_COLOR_ROOT` color (red as default).

## Controlling when to show the `user` section

`SPACESHIP_USER_SHOW` defines when to show the `user` section. Here are possible values:

| `SPACESHIP_USER_SHOW` | Show on local | Show on remote |
| :-------------------: | :------------ | :------------- |
|        `false`        | Never         | Never          |
|       `always`        | Always        | Always         |
|        `true`         | If needed     | Always         |
|       `needed`        | If needed     | If needed      |

*If needed* means the default behavior.

## Options

| Variable                    |              Default               | Meaning                                              |
| :-------------------------- | :--------------------------------: | ---------------------------------------------------- |
| `SPACESHIP_USER_SHOW`       |               `true`               | Show section (`true`, `false`, `always` or `needed`) |
| `SPACESHIP_USER_PREFIX`     |              `with·`               | Section's prefix                                     |
| `SPACESHIP_USER_SUFFIX`     | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Section's suffix                                     |
| `SPACESHIP_USER_COLOR`      |              `yellow`              | Section's color                                      |
| `SPACESHIP_USER_COLOR_ROOT` |               `red`                | Section's color when user is root                    |



