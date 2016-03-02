
![Spaceship](./preview.png)

# ⭐🚀 Spaceship ZSH

> An [“Oh My ZSH!”](http://ohmyz.sh/) theme for Astronauts.

Spaceship is an [“Oh My ZSH!”](http://ohmyz.sh/) minimalistic and powerful theme. It combines everything you may need for convenient work, like a real spaceship.

Currently it shows:

* Current git branch.
* Git repo status:
  * `+` — uncommitted changes in the index;
  * `!` — unstaged changes;
  * `?` — untracked changes;
  * `$` — stashed changes;
  * `⇣` — unpulled commits;
  * `⇡` — unpushed commits.
* Prompt character turns red if the last command exits with non-zero code.
* Hostname only displayed when in an SSH session.
* Username displayed only when it isn't `$LOGNAME`.
* Username turns red when root.
* Current Node.js version, through NVM.
* Current Ruby version, through RVM/RBENV/CHRUBY.
* Current Python virtualenv.

Want more features? Please, [open an issue](https://github.com/denysdovhan/spaceship-zsh-theme/issues/new) or send pull request.

## Requirements

For correct work you will first need:

* A [`zsh`](http://www.zsh.org/) must be installed
* A zsh–framework like [oh-my-zsh](http://ohmyz.sh/), [antigen](http://antigen.sharats.me/) or [zgen](https://github.com/tarjoilija/zgen)

## Installing

### For oh-my-zsh users

Installing using **curl**:

```
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh
```

Installing using **wget**:

```
wget -O - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh
```

If you have problems, follow these instructions:

1. Download the theme [here](https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh-theme)
2. Put the file `spaceship.zsh-theme` in `$ZSH_CUSTOM/themes/`
3. Add the line to your `~/.zshrc`:
  ```
  ZSH_THEME="spaceship"
  ```

### For antigen users

Add the following snippet `~/.zshrc` after the line `antigen use oh-my-zsh`:

```
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship-zsh-theme
```

### For Zgen users

Add the following line to your `~/.zshrc` where you're adding your other zsh plugins:

```
zgen load denysdovhan/spaceship-zsh-theme spaceship-zsh-theme
```

## Screenshots

The spaceship theme looks awesome with some popular color schemes. Take a look to make sure:

### Monokai

![Monokai](https://cloud.githubusercontent.com/assets/3459374/12703427/827bfd5e-c84b-11e5-8bef-44d4e6955c01.png)

### Solarized Dark

![Solarized](https://cloud.githubusercontent.com/assets/3459374/12703426/82799b72-c84b-11e5-8943-3a7df0d55978.png)

### Night Eighties

![Night Eighties](https://cloud.githubusercontent.com/assets/3459374/12703429/827d2918-c84b-11e5-95a1-bbfe621e77d5.png)

### One Dark

![One Dark](https://cloud.githubusercontent.com/assets/3459374/12703428/827c7356-c84b-11e5-8764-372ce30dd3fa.png)

## License

MIT © [Denys Dovhan](http://denysdovhan.com)
