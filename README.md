[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner-direct-single.svg)](https://stand-with-ukraine.pp.ua/)

<h1 align="center">
  <a href="https://github.com/spaceship-prompt/spaceship-prompt">
    <img alt="spaceship →~ prompt" src="https://cloud.githubusercontent.com/assets/3459374/21679181/46e24706-d34b-11e6-82ee-5efb3d2ba70f.png" width="400">
  </a>
  <br>Spaceship Prompt 🚀⭐<br>
</h1>

<h4 align="center">
  Minimalistic, powerful and extremely customizable <a href="http://zsh.org" target="_blank"><code>Zsh</code></a> prompt
</h4>

<p align="center">
  <a href="https://npmjs.org/package/spaceship-prompt">
    <img src="https://img.shields.io/npm/v/spaceship-prompt.svg?style=flat-square"
      alt="NPM Version" />
  </a>

  <a href="https://github.com/spaceship-prompt/spaceship-prompt/actions">
    <img src="https://img.shields.io/github/actions/workflow/status/spaceship-prompt/spaceship-prompt/validate.yaml?style=flat-square"
      alt="GitHub Workflow Status" />
  </a>

  <a href="http://zsh.org/">
    <img src="https://img.shields.io/badge/zsh-%3E%3Dv5.2-777777.svg?style=flat-square"
      alt="Zsh Version" />
  </a>

  <a href="https://twitter.com/SpaceshipPrompt">
    <img src="https://img.shields.io/badge/twitter-%40SpaceshipZSH-00ACEE.svg?style=flat-square"
      alt="Spaceship Twitter" />
  </a>

  <a href="https://discord.gg/NTQWz8Dyt9">
    <img
      src="https://img.shields.io/discord/859409950999707668?label=discord&logoColor=white&style=flat-square"
      alt="Chat on Discord"
    />
  </a>

  <a href="https://patreon.com/denysdovhan">
    <img src="https://img.shields.io/badge/support-patreon-F96854.svg?style=flat-square"
      alt="Donate" />
  </a>
</p>

<div align="center">
  <h4>
    <a href="https://spaceship-prompt.sh">Website</a> |
    <a href="https://spaceship-prompt.sh/getting-started">Installation</a> |
    <a href="https://spaceship-prompt.sh/config/intro">Configuration</a> |
    <a href="https://spaceship-prompt.sh/advanced/creating-section">Advanced Usage</a>
  </h4>
</div>

<div align="center">
  <sub>Built with ❤︎ by
  <a href="https://denysdovhan.com">Denys Dovhan</a> and
  <a href="https://github.com/spaceship-prompt/spaceship-prompt/graphs/contributors">contributors </a>
</div>
<br>

Spaceship is a minimalistic, powerful and extremely customizable [Zsh][zsh-url] prompt. Prompt is what you see when you type a command. It can show a lot of useful tips, saving your time and making user experience smooth and pleasant. It combines everything you may need for convenient work, without unnecessary complications, like a real spaceship.

<p align="center">
  <a href="https://asciinema.org/a/513451">
    <img alt="Spaceship with One Dark, zsh-autosuggestions and zsh-syntax-highlight" src="https://user-images.githubusercontent.com/3459374/183478313-5aa02cbe-fafc-42e0-a791-ea08a0902f56.gif" width="80%">
  </a>
  <br>
  <sup>Visit <a href="https://deploy-preview-963--spaceship-prompt.netlify.app/faq/#why-doesnt-my-prompt-look-like-the-preview">Frequently Asked Question</a> for similar setup and find more examples with different color schemes in <a href="https://github.com/spaceship-prompt/spaceship-prompt/wiki/Screenshots">Screenshots </a>wiki-page.
  </sup>
</p>

## ✨ Features

Here are some sneak picks of what **Spaceship** can show:

- Clever hostname and username displaying
- Repository statuses (Git and Mercurial are supported)
- Runtime environments for various languages (Node.js, Rust, Python, Ruby, Swift, Go, PHP and many others)
- Docker version, Kubernetes context and connected machine
- Package version (npm, lerna, cargo, composer and others)
- Battery level and status
- Indicator for jobs in the background `✦`
- A lot of [useful information](https://spaceship-prompt.sh/sections)
- Custom [information of your choice](https://spaceship-prompt.sh/advanced/creating-section)

Want more features? Please, [open an issue](https://github.com/spaceship-prompt/spaceship-prompt/issues/new/choose) or send pull request.

## 🤝 Requirements

Before we begin, let's make sure you have the following installed:

- [Zsh](http://www.zsh.org/) (v5.2 or recent) must be installed. Run the following command to check you version of Zsh:
  ```zsh
  echo $ZSH_VERSION #> 5.8.1
  ```
- [Powerline Font](https://github.com/powerline/fonts) or [Nerd Font](https://www.nerdfonts.com/) (even better) must be installed and used in your terminal. [Fira Code](https://github.com/tonsky/FiraCode) is a popular choice. To check if Powerline Font works for you, run:
  ```zsh
  echo -e "\xee\x82\xa0" #> 
  ```

## 🚀 Installation

Here's a few popular methods to install Spaceship. Select the one you use from the list below:

<details>
<summary>Homebrew</summary>
Installing Spaceship via Homebrew is a simple command:

```zsh title="Terminal"
brew install spaceship
```

Add prompt initialization to your `.zshrc`:

```zsh title="Terminal"
echo "source $(brew --prefix)/opt/spaceship/spaceship.zsh" >>! ~/.zshrc
```
</details>

<details>
<summary>Oh-My-Zsh</summary>
Clone this repo:

```zsh
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
```

Symlink `spaceship.zsh-theme` to your oh-my-zsh custom themes directory:

```zsh
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

Set `ZSH_THEME="spaceship"` in your `.zshrc`.
</details>

<details>
<summary>npm</summary>
Install Spaceship via npm as you would with any other global package:

```
npm install -g spaceship-prompt
```

This command will download Spaceship. It will also ask you to source Spaceship in your `~/.zshrc` file.

</details>

<details>
<summary>prezto</summary>

- Follow [prezto-contrib#usage](https://github.com/belak/prezto-contrib#usage) to clone `prezto-contrib` to the proper location.
- Enable the `contrib-prompt` module (before the `prompt` module).
- Set `zstyle ':prezto:module:prompt' theme 'spaceship'` in your `.zpreztorc`.

</details>

<details>
<summary>zim</summary>
Add Spaceship to your `.zimrc`:

```zsh
zmodule spaceship-prompt/spaceship-prompt --name spaceship --no-submodules
```

Then install Spaceship:

```zsh
zimfw install
```
</details>

<details>
<summary>antigen</summary>
Add the following snippet in your `.zshrc`:

```zsh
antigen theme spaceship-prompt/spaceship-prompt
```
</details>

<details>
<summary>antibody</summary>
Update your `.zshrc` file with the following line:

```zsh
antibody bundle spaceship-prompt/spaceship-prompt
```
</details>

<details>
<summary>zinit</summary>
Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

```zsh
zinit light spaceship-prompt/spaceship-prompt
```
</details>

<details>
<summary>zgen</summary>
Add the following line to your `.zshrc` where you're adding your other Zsh plugins:

```zsh
zgen load spaceship-prompt/spaceship-prompt spaceship
```
</details>

<details>
<summary>zplug</summary>
Use this command in your `.zshrc` to load Spaceship as prompt theme:

```zsh
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
```
</details>

<details>
<summary>sheldon</summary>
Add the following to your `plugins.toml` file (open it with `sheldon edit`):

```toml
[plugins.spaceship]
github = "spaceship-prompt/spaceship-prompt"
```

Or run the following to automatically add it:

```zsh
sheldon add spaceship --github spaceship-prompt/spaceship-prompt
```
</details>

<details>
<summary>Arch</summary>

Install the latest release from the AUR package [spaceship-prompt](https://aur.archlinux.org/packages/spaceship-prompt/):

```
git clone https://aur.archlinux.org/spaceship-prompt.git
cd spaceship-prompt
makepkg -si
```

or using `yay`:

```
yay -S spaceship-prompt
```

Also there is an unmaintained git package [spaceship-prompt-git](https://aur.archlinux.org/packages/spaceship-prompt-git/).
</details>

<details>
<summary>Manual</summary>

If none of the above methods works for you, you can install Spaceship manually.

1. Clone this repo somewhere, for example to `$HOME/.zsh/spaceship`.
2. Source Spaceship in your `~/.zshrc`.

### Example

```zsh
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"
```

For initializing prompt system add this to your `.zshrc`:

```zsh title=".zshrc"
source "$HOME/.zsh/spaceship/spaceship.zsh"
```
</details>

## ⚙️ Configuration

Spaceship works well out of the box, but you can customize almost everything if you want.

- [**⚙️ Configuration**](https://spaceship-prompt.sh/config/intro) — Tweak section's behavior with tons of options.
- [**😎 Advanced Usage**](https://spaceship-prompt.sh/advanced/creating-section) — Learn how to create a custom section, benefit of per-directory configuration and more.

Additionally, join our community in [Discord](https://discord.gg/NTQWz8Dyt9) and follow our [Twitter](https//twitter.com/SpaceshipPrompt) for updates.

## 🫶 Contributing

We're glad to accept contributions from developers of **all skill levels**! If you are interested in contributing to Spaceship, please take a look at our [Contribution Guide](./CONTRIBUTING.md) for more details. If you're looking for an easy way into the project, take one of the issues with [**good first issue**](https://github.com/spaceship-prompt/spaceship-prompt/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22) label.

If you are fluent in any other language besides English, we greatly appreciate any help with translating our documentation in other languages. If you would like to help, join the [team of translators on our Crowdin](https://translate.spaceship-prompt.sh).

If you're interested in helping other people, answer questions asked by other users of Spaceship and help to solve their issues. Additionally, join our [**Discord**](https://discord.gg/NTQWz8Dyt9) to discuss Spaceship and help people who need help.

## 💌 Sponsoring

If you really enjoy this project, you can contribute financially. Any contribution is highly appreciated, even the smallest one. There are several ways to donate:

* **Recurring donations**:
  * [GitHub Sponsors](https://github.com/sponsors/denysdovhan?frequency=recurring)
  * [Open Collective](https://opencollective.com/spaceship-prompt)
  * [Patreon](https://patreon.com/denysdovhan)
* **One-time donations**:
  * [GitHub Sponsors](https://github.com/sponsors/denysdovhan?frequency=one-time)
  * [Buy Me A Coffee](https://buymeacoffee.com/denysdovhan)
  * [Monobank Jar](https://send.monobank.ua/jar/2N46sWTaZZ)
* **Crypto donations**:
  * Ethereum: `0x5C9496De5E51D48daf28354DC04d8f9D33955559`
  * Bitcoin: `bc1q5ezjvpgftmx42f9qgdf5lscjz43uh4jf02uvje`

## 🤔 Having trouble?

Find answers on our troubleshooting page or get help by our community.

[**Issues**](https://github.com/spaceship-prompt/spaceship-prompt/issues) • [**Discussions**](https://github.com/spaceship-prompt/spaceship-prompt/discussions/) • [**Discord**](https://discord.gg/NTQWz8Dyt9)

Still struggling? Please, [*file an issue*](https://github.com/spaceship-prompt/spaceship-prompt/issues/new/choose), describe your problem, and we will gladly help you.

## 👀 Derived Projects

Here's a list of related projects that have been inspired by Spaceship ZSH.

- [**denysdovhan/dotfiles**](https://github.com/denysdovhan/dotfiles) - Dotfiles of Spaceship's author from which Spaceship is originated.
- [**matchai/spacefish**](https://github.com/matchai/spacefish) - A port of Spaceship ZSH for fish shell intending to achieve complete feature parity.
- [**starship/starship**](https://github.com/starship/starship) - A blazing-fast, cross-shell prompt written in Rust, heavily inspired by Spaceship ZSH.

## 📄 License

MIT © [Denys Dovhan](http://denysdovhan.com)

<!-- References -->
[zsh-url]: http://zsh.org/
[patreon-url]: https://www.patreon.com/denysdovhan
