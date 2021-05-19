# Getting Started

## Requirements

To work correctly, you will first need:

- [`zsh`](http://www.zsh.org/) (v5.2 or recent) must be installed.
- [Powerline Font](https://github.com/powerline/fonts) must be installed and used in your terminal (for example, switch font to [Fira Code](https://github.com/tonsky/FiraCode)).

## Installing

Now that the requirements are satisfied, you can install Spaceship ZSH via any of the following tools.

**💡 Tip:** If you like this project ~~and want to get some stickers and postcards~~, consider becoming a patron:

<a href="https://patreon.com/denysdovhan">
  <img alt="Become a patron" src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="150px">
</a>

### [npm]

```
npm install -g spaceship-prompt
```

Done. This command should link `spaceship.zsh` as `prompt_spaceship_setup` to your `$fpath` and set `prompt spaceship` in `.zshrc`. Just reload your terminal.

**💡 Tip:** Update Spaceship to new versions as you would any other package.

### [oh-my-zsh]

Clone this repo:

```zsh
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
```

Symlink `spaceship.zsh-theme` to your oh-my-zsh custom themes directory:

```zsh
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

Set `ZSH_THEME="spaceship"` in your `.zshrc`.

### [prezto]

- Follow [prezto-contrib#usage](https://github.com/belak/prezto-contrib#usage) to clone `prezto-contrib` to the proper location.
- Enable the `contrib-prompt` module (before the `prompt` module).
- Set `zstyle ':prezto:module:prompt' theme 'spaceship'` in your `.zpreztorc`.

### [zim]

Add `zmodule denysdovhan/spaceship-prompt --name spaceship` to your `.zimrc` and run `zimfw install`.

### [antigen]

Add the following snippet in your `.zshrc`:

```
antigen theme denysdovhan/spaceship-prompt
```

### [antibody]

Update your `.zshrc` file with the following line:

```
antibody bundle denysdovhan/spaceship-prompt
```

### [zinit]

Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

```
zinit light denysdovhan/spaceship-prompt
```

### [zgen]

Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

```
zgen load denysdovhan/spaceship-prompt spaceship
```

### [zplug]

Use this command in your `.zshrc` to load Spaceship as prompt theme:

```
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
```

### Linux package manager

#### Arch Linux

Install the latest master from the AUR package [`spaceship-prompt-git`](https://aur.archlinux.org/packages/spaceship-prompt-git/):

```
git clone https://aur.archlinux.org/spaceship-prompt-git.git --depth=1
cd spaceship-prompt-git
makepkg -si
```

### Manual

If you have problems with approaches above, follow these instructions:

- Clone this repo `git clone https://github.com/denysdovhan/spaceship-prompt.git --depth=1`
- Symlink `spaceship.zsh` to somewhere in [`$fpath`](http://www.refining-linux.org/archives/46/ZSH-Gem-12-Autoloading-functions/) as `prompt_spaceship_setup`.
- Initialize prompt system and choose `spaceship`.

#### Example

Run `echo $fpath` to see possible location and link `spaceship.zsh` there, like:

```zsh
$ ln -sf "$PWD/spaceship.zsh" "/usr/local/share/zsh/site-functions/prompt_spaceship_setup"
```

For a user-specific installation, simply add a directory to `$fpath` for that user in `.zshrc`:

```zsh
fpath=( "${ZDOTDIR:-$HOME}/.zfunctions" $fpath )
```

Then install the theme like this:

```zsh
$ ln -sf "$PWD/spaceship.zsh" "${ZDOTDIR:-$HOME}/.zfunctions/prompt_spaceship_setup"
```

For initializing prompt system add this to your `.zshrc`:

```zsh
# .zshrc
autoload -U promptinit; promptinit
prompt spaceship
```

<!-- References -->

[oh-my-zsh]: http://ohmyz.sh/
[prezto]: https://github.com/sorin-ionescu/prezto
[zim]: https://github.com/zimfw/zimfw
[antigen]: http://antigen.sharats.me/
[zgen]: https://github.com/tarjoilija/zgen
[npm]: https://www.npmjs.com/
[antibody]: https://github.com/getantibody/antibody
[zplug]: https://github.com/zplug/zplug
[n]: https://github.com/tj/n
[xcenv]: http://xcenv.org/
[swiftenv]: https://github.com/kylef/swiftenv
[powerline]: https://github.com/powerline/fonts
[zinit]: https://github.com/zdharma/zinit
