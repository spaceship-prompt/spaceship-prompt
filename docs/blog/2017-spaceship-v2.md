# A big update of spaceship-zsh-theme

<aside class="mdx-author" markdown>
  ![@denysdovhna](https://unavatar.io/denysdovhan)

  <span>__Denys Dovhan__ · @denysdovhan</span>
  <span>
  :octicons-calendar-24: May 8, 2017 ·
  [:octicons-tag-24: v2.0.0](https://github.com/spaceship-prompt/spaceship-prompt/tree/v2.0.0)
  </span>
</aside>

---

<p align="center" markdown>
  ![Awesome Spaceship’s logo](https://cdn-images-1.medium.com/max/2050/1*inODQBDdKkPWKree_HSyWA.png){ width=33.3% }
</p>

I’ve been working on big PR for spaceship-zsh-theme last few weeks. This is the biggest update of Spaceship ever, there are a lot of changes (breaking changes too), prompt is almost completely rewritten, so I decided to write a note which should be a summary of my efforts.

## Why?

Before I dive into describing of new features I’d like to talk about causes of full-rewritting. The main reason is that Spaceship has a lot of boilerplate copy-pasted code, like this:

```zsh
echo -n "%{$fg_bold[green]%}"
echo -n "${SPACESHIP_NVM_SYMBOL} ${nvm_status}"
echo -n "%{$reset_color%}"
```

And this snippet was a part of any section causing many related problems.

Order of section and their colors in prompt was hardly defined in Spaceship’s source code and that was the second important problem. Users could override prefixes for sections, but couldn’t do the same for suffixes, colors or order of sections. Options were grouped by the name (like GIT, XCODE, etc), except PREFIX-options which were grouped by themselves. That was made API inconsistence.

Another yet problem was hidden in the hostname section. Internally, this section used username section and directory prefix. It’s just historical issue related to the specificity of implementation. Anyway, this caused non-obvious binding between parts of prompt and that was the big problem for future features.

Besides this, there was few smaller, but nevertheless annoying issues around Spaceship’s internals which have to be fixed.

## What’s new?

**spaceship-zsh-theme** is now v2.0.0. A [pull-request #78](https://github.com/denysdovhan/spaceship-zsh-theme/pull/78) for this version contains 66 commits (1095 additions and 523 deletions), 48 new options (98 total, 26 was deprecated).

![preview of Spaceship](https://cdn-images-1.medium.com/max/2400/1*Vtc9ZCR2p7a_9-6MuFB-hw.gif)

Let’s take a look what’s coming on with new major update precisely. Here is a list of important changes:

### Custom prompt ordering

I’ve started refactoring from implementing of new feature: *custom prompt ordering*.

Previously, users have no ability to change order of Spaceship’s sections. Moreover, there wasn’t such thing like *section* in Spaceship. Therefore, giving users ability to define order of prompt was the key feature of this major update.

Now you can use `$SPACESHIP_PROMPT_ORDER` options to define desirable order, like this (default order below):

```zsh
SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  ruby          # Ruby section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  docker        # Docker section
  venv          # virtualenv section
  pyenv         # Pyenv section
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  char          # Prompt character
)
```

### Prefixes are part of sections

Previously, I’ve mentioned problems with naming of prefix options. In new version prefixes are moved to the corresponding sections:
`$SPACESHIP_PREFIX_* →$SPACESHIP_*_PREFIX`

`$SPACESHIP_PREFIX_SHOW` options was renamed to `$SPACESHIP_PROMPT_PREFIXES_SHOW` and moved under prompt section.

Don’t worry if you use old options right now, you will get a deprecation warning with suggestion of option that should be used instead:

![An example of deprecation warnings](https://cdn-images-1.medium.com/max/3332/1*HsAPhD7LM1ViUosVQMjpLQ.png)

Warnings for deprecated options won’t be removed until next major release.

### Suffix options

Since introducing prefixes, it was expected that suffixes should be added too. Now each section has corresponding `$SPACESHIP_*_SUFFIX` option for section’s suffix. As default it falls to the value of `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` which is space. However, feel free to define you own suffix for any section (find more examples in [Presets](https://github.com/denysdovhan/spaceship-zsh-theme/wiki/Presets) wiki-page).

### Custom colors

Previously, there was no way to change section colors. New major release brings this feature to the users. If you need to change a section color, just assign color name to the corresponding `$SPACESHIP_*_COLOR` variable. Here is an example:

![An example of using **SPACESHIP_*_COLOR** options](https://cdn-images-1.medium.com/max/3332/1*pYv-hix4QKUCPCMCW2A4Ug.png)

### Git is more specific

Now Git support is much more better. Firstly, git section was split up into two subsections:git_branch + git_status. As you may noticed, the first one shows current Git branch and the second one shows Git status.

In addition to good old indicators, here are new ones that were added to Git status subsection:

* » — renamed files;
* ✘ — deleted files;
* = — unmerged changes;
* ⇕ — diverged changes.

### Fixed Node.js support

There is no nvm section and related options anymore. Instead of this, node is used. We had [plenty of issues](https://github.com/denysdovhan/spaceship-zsh-theme/issues/33) from people, who prefer to use n instead of nvm. New version comes with `$SPACESHIP_NODE_DEFAULT_VERSION` option. If you use n, assign you default system Node.js version to this variable and node section will be hidden.

### NPM package

Spaceship now spread as NPM-package. That means you can install it with single command:

```zsh
npm install -g spaceship-zsh-theme
```

This command will automatically download, link and source Spaceship. `$ZSH_THEME` will be set to "spaceship". Just reload your terminal.

Also, you can uninstall Spaceship with npm uninstall command and update with npm update.

Along with this, you can install Spaceship as usual, using shell plugin manager or with single command:

```zsh
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh
```

By the way, it would be great if we add ability to install Spaceship using Homebrew. If you can help, please, drop a message in related issue — [Install via Homebrew](https://github.com/denysdovhan/spaceship-zsh-theme/issues/90).

### Smaller changes

With bigger changes there were also smaller ones. Spaceship has got more internal improvements, specifically:

* **New prompt character.** Now it’s `➜` instead of `➔`. The change is not quite obvious, but new character has rounded corners, which is more appropriate for eyes.
* **Low internal coupling.** User and dir sections are independent from host section.
* **Extended API.** Now time and user has their own prefixes and other options, which were missed.
* **Better installer/uninstaller.** `install.sh` was replaced by `install.zsh` and `uninstall.zsh` for installing and uninstalling respectively. Both are triggered by NPM postscripts or with curl and wget.
* **Added `.editorconfig`.** I have no idea why I’ve missed adding it before. Definitely, this file should be in any open source project.
* **Added wiki pages.** Docs were particularly move to the GitHub wiki pages. Specifically, [Screenshots](https://github.com/denysdovhan/spaceship-zsh-theme/wiki/Screenshots) page now contains more screenshots of Spaceship with other color schemes (including light ones).

## Presets

At this moment, Spaceship has 98 options. You can change almost anything you want: order, colors, prefixes, suffixes, symbols, etc. This makes Spaceship even more customizable than it was before.

Playing with options, I found out that I make Spaceship to look like other themes. For instance, here is a demo how Spaceship may look like **robbyrussell** prompt (default Oh-My-Zsh prompt):

![A [**robbyrussell **preset](https://github.com/denysdovhan/spaceship-zsh-theme/wiki/Presets#robbyrussell) for Spaceship](https://cdn-images-1.medium.com/max/2000/1*2nj-JjXMsxJ2lxEH8JAO8A.gif)

That’s why I decided to create a [Presets](https://github.com/denysdovhan/spaceship-zsh-theme/wiki/Presets) wiki page where users can share their configuration with others.

## Plans for future

Surely, this release is not the end. There are plenty feature requests and working pull requests with draft implementation of these features, specifically:

* [☿ Mercurial support](https://github.com/denysdovhan/spaceship-zsh-theme/issues/54)
* [⚙ Background jobs](https://github.com/denysdovhan/spaceship-zsh-theme/issues/66)
* [🐘 PHP support](https://github.com/denysdovhan/spaceship-zsh-theme/issues/74)
* [☁️ Amazon Web Services support](https://github.com/denysdovhan/spaceship-zsh-theme/issues/86)

Wanna help? Check out [help wanted label](https://github.com/denysdovhan/spaceship-zsh-theme/issues?q=is%3Aopen+is%3Aissue+label%3Ahelp-wanted) in Issue. If you need a feature or have any question, don’t be hesitate to [open an issue](https://github.com/denysdovhan/spaceship-zsh-theme/issues/new).

## Donation

I work on this project in my spare time, beside my primary job. I hope enjoy using Spaceship, and if you do, please, [buy me a cup of chamomile tea ☕️ or cheese cake 🍰](https://www.buymeacoffee.com/denysdovhan)

I would appreciate your support! *Thank you!*

> Thank you for reading! Follow me on [Twitter](https://twitter.com/denysdovhan) and [Facebook](https://www.facebook.com/denysdovhan), if you want to get updates.
