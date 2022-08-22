# Per-directory configuration

Many users asked us how to change Spaceship options only for a specific directory. There are plenty solutions for this. We will show how to do that with a tool called `direnv`.

`direnv` is a tool that allows you to manage environment variables for a directory. It is a simple wrapper around `.envrc` files. It can load and unload variables defined in `.envrc` based on current directory. It also works not only with Zsh, but with other popular shells.

## Installing `direnv`

Install `direnv` with the package manager of your choice. Or use a script to install a binary build of `direnv`.

[Installation guide](https://github.com/direnv/direnv/blob/master/docs/installation.md){ .md-button }

After successful installation of `direnv` you need to hook it to your shell.

## Hooking `direnv` into Zsh

Add the following line somewhere at the end of your `.zshrc` file:

```zsh title=".zhrc"
eval "$(direnv hook zsh)"
```

## Setting per-directory environment variables

As soon as you've installed `direnv` and hooked it to the Zsh, you can set environment variables for any directory in a `.envrc` file within that directory.

```zsh title=".envrc"
export SPACESHIP_USER_SHOW='always'
```

After that you need explicitly grant permissions to source `.envrc` files in the directory.

```
direnv allow /path/to/directory
```

Here is a live example of how `direnv` works:

<div class="terminal-demo">
  <script id="asciicast-l6jOkth3csJQGkJRGV8A6DLl0" src="https://asciinema.org/a/l6jOkth3csJQGkJRGV8A6DLl0.js" data-autoplay="true" data-loop="true" data-preload="true" async></script>
</div>

## Alternatives to `direnv`

Besides `direnv` there are many other tools that allow you to manage environment variables for a directory. Here's a list of the most popular of them:

* [zsh-autoenv](https://github.com/Tarrasch/zsh-autoenv)
* [asdf-direnv](https://github.com/asdf-community/asdf-direnv)
* [shadowenv](https://shopify.github.io/shadowenv/)
* [quickenv](https://github.com/untitaker/quickenv)
