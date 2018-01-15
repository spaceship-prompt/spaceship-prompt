<p align="center">
  <a href="https://github.com/denysdovhan/spaceship-zsh-theme">
    <img alt="spaceship →~ prompt" src="https://cloud.githubusercontent.com/assets/3459374/21679181/46e24706-d34b-11e6-82ee-5efb3d2ba70f.png" width="400">
  </a>
</p>

# 🚀⭐ Spaceship ZSH

[![NPM version][npm-image]][npm-url]
[![ZSH][zsh-image]][zsh-url]
[![Donate with card][donate-card-image]][donate-readme]
[![Donate with Bitcoin][donate-btc-image]][donate-readme]
[![Donate with Ethereum][donate-eth-image]][donate-readme]

> A [ZSH][zsh-url] prompt for Astronauts.

Spaceship is a minimalistic, powerful and extremely customizable [ZSH][zsh-url] prompt. It combines everything you may need for convenient work, without unnecessary complications, like a real spaceship.

Currently it shows:

* Clever hostname and username displaying.
* Prompt character turns red if the last command exits with non-zero code.
* Current Git branch and rich repo status:
  * `?` — untracked changes;
  * `+` — uncommitted changes in the index;
  * `!` — unstaged changes;
  * `»` — renamed files;
  * `✘` — deleted files;
  * `$` — stashed changes;
  * `=` — unmerged changes;
  * `⇡` — ahead of remote branch;
  * `⇣` — behind of remote branch;
  * `⇕` — diverged chages.
* Current Mercurial branch and rich repo status:
  * `?` — untracked changes;
  * `+` — uncommitted changes in the index;
  * `!` — unstaged changes;
  * `✘` — deleted files;
* Indicator for jobs in the background (`✦`).
* Current Node.js version, through nvm/nodenv/n (`⬢`).
* Current Ruby version, through rvm/rbenv/chruby (`💎`).
* Current Elixir version, through kiex/exenv/elixir (`💧`).
* Current Swift version, through swiftenv (`🐦`).
* Current Xcode version, through xenv (`🛠`).
* Current Go version (`🐹`).
* Current PHP version (`🐘`).
* Current Rust version (`𝗥`).
* Current version of Haskell Tool Stack (`λ`).
* Current Julia version (`ஃ`).
* Current Docker version and connected machine (`🐳`).
* Current Amazon Web Services (AWS) profile (`☁️`) ([Using named profiles](http://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html)).
* Current Python virtualenv.
* Current Conda virtualenv (`🅒`).
* Current Python pyenv (`🐍`).
* Current .NET SDK version, through dotnet-cli (`.NET`).
* Current Ember.js version, through ember-cli (`🐹`).
* Current Kubectl context (`☸️`).
* Package version, if there's is a package in current directory (`📦`).
* Current battery level and status:
  * `⇡` - charging;
  * `⇣` - discharging;
  * `•` - fully charged.
* Current Vi-mode mode ([with handy aliases for temporarily enabling](#vi-mode-vi_mode)).
* Optional exit-code of last command ([how to enable](#exit-code-exit_code)).
* Optional time stamps 12/24hr in format ([how to enable](#time-time)).
* Execution time of the last command if it exceeds the set threshold.

Want more features? Please, [open an issue](https://github.com/denysdovhan/spaceship-zsh-theme/issues/new) or send pull request.

## Preview

<p align="center">
  <img alt="Spaceship with Hyper and One Dark" src="./preview.gif" width="980px">
</p>

You can find more examples with different color schemes in [Screenshots](https://github.com/denysdovhan/spaceship-zsh-theme/wiki/Screenshots) wiki-page.

## Requirements

For correct work you will first need:

* A [`zsh`](http://www.zsh.org/) (v5.0.5 or recent) must be installed

## Installing

### [npm]

```
npm install -g spaceship-zsh-theme
```

Done. This command should link `spaceship.zsh` as `prompt_spaceship_setup` to your `$fpath` and set `prompt spaceship` in `.zshrc`. Just reload your terminal.

**Tip:** Update Spaceship to new versions as any other package.

### [oh-my-zsh]

- Set `ZSH_THEME=""` in your `.zshrc`
- Follow instructions in [manual](https://github.com/denysdovhan/spaceship-zsh-theme#manual) installation.

### [antigen]

Add the following snippet in your `~/.zshrc``:

```
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
```

### [antibody]

Update your `.zshrc` file with the following line:

```
antibody bundle denysdovhan/spaceship-zsh-theme
```

### [zgen]

Add the following line to your `~/.zshrc` where you're adding your other zsh plugins:

```
zgen load denysdovhan/spaceship-zsh-theme spaceship
```

### [zplug]

Use this command in your `.zshrc` to load Spaceship as prompt theme:

```
zplug denysdovhan/spaceship-zsh-theme, use:spaceship.zsh, from:github, as:theme
```

### Manual

If you have problems with approches above, follow these instructions:

- Download the theme [here](https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh)
- Symlink `spaceship.zsh` to somewhere in `$fpath` as `prompt_spaceship_setup`.

Run `echo $fpath` to see possible locations. Like,

```console
$ ln -sf "$PWD/spaceship.zsh" "/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
```

For a user-specific installation (which would not require escalated privileges), simply add a directory to `$fpath` for that user:

```sh
# .zshrc
fpath=( "$HOME/.zfunctions" $fpath )
```
Then install the theme there:
```console
$ ln -sf "$PWD/spaceship.zsh" "$HOME/.zfunctions/prompt_spaceship_setup"
```

- Initialize prompt system and choose `spaceship`

```sh
# .zshrc
autoload -U promptinit; promptinit
prompt spaceship
```

## Donate

Hi! I work on this project in my spare time, beside my primary job. I hope enjoy using Spaceship, and if you do, please, [buy me a cup of tea ☕️][donate-card-url].

| Credit/Debit card | Bitcoin | Ethereum |
|:-----------------:|:-------:|:--------:|
| [Donate with LiqPay][donate-card-url] | `1FrPrQb6ACTkbSBAz9PduJWrDFfq41Ggb4` | `0x6aF39C917359897ae6969Ad682C14110afe1a0a1` |
| <img src="https://cloud.githubusercontent.com/assets/3459374/25771981/6f2ba08c-3268-11e7-9fc8-49e3f7b9e0e5.png" width="160px"/> | <img src="https://user-images.githubusercontent.com/3459374/33760933-1c9b81b4-dc10-11e7-8e4b-22d81f98c138.png" width="160px"/> | <img src="https://user-images.githubusercontent.com/3459374/33760932-1c7b3fb2-dc10-11e7-9774-411264d533da.png" width="160px"/> |

I would appreciate your support! _Thank you!_

## License

MIT © [Denys Dovhan](http://denysdovhan.com)

<!-- Badges -->

[npm-url]: https://npmjs.org/package/spaceship-zsh-theme
[npm-image]: https://img.shields.io/npm/v/spaceship-zsh-theme.svg?style=flat-square

[zsh-url]: http://zsh.org/
[zsh-image]: https://img.shields.io/badge/zsh->=v5.0.5-777777.svg?style=flat-square

[donate-readme]: https://github.com/denysdovhan/spaceship-zsh-theme#donate
[donate-card-url]: https://www.liqpay.com/en/checkout/380951100392
[donate-card-image]: https://img.shields.io/badge/donate-LiqPay-blue.svg?style=flat-square
[donate-btc-image]: https://img.shields.io/badge/donate-BTC-yellow.svg?style=flat-square
[donate-eth-image]: https://img.shields.io/badge/donate-ETH-gray.svg?style=flat-square

<!-- References -->

[oh-my-zsh]: http://ohmyz.sh/
[antigen]: http://antigen.sharats.me/
[zgen]: https://github.com/tarjoilija/zgen
[npm]: https://www.npmjs.com/
[antibody]: https://github.com/getantibody/antibody
[zplug]: https://github.com/zplug/zplug
[n]: https://github.com/tj/n
[xcenv]: http://xcenv.org/
[swiftenv]: https://github.com/kylef/swiftenv
[powerline]: https://github.com/powerline/fonts
