# Meet Spaceship ZSH v3.0!

<aside class="mdx-author" markdown>
  ![@denysdovhan](https://unavatar.io/denysdovhan)

  <span>__Denys Dovhan__ · @denysdovhan</span>
  <span>
  :octicons-calendar-24: Jan 20, 2018 ·
  [:octicons-tag-24: v3.0.0](https://github.com/spaceship-prompt/spaceship-prompt/tree/v3.0.0)
  </span>
</aside>

---

![Photo by [Tim Mossholder](https://unsplash.com/photos/qjgdslbEn-I?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/search/photos/rocket?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)](https://cdn-images-1.medium.com/max/14400/1*J5P7vSWaFGRiO6wxyU5z8w.jpeg)

[Spaceship](https://github.com/denysdovhan/spaceship-prompt) is a minimalistic, powerful and extremely customizable [Zsh](http://zsh.org/) prompt. Today we’re announcing the third major release of Spaceship prompt — one of the most powerful zsh prompts ever.

Almost a year has passed since [A big update of spaceship-zsh-theme](https://medium.com/@denysdovhan/a-big-update-of-spaceship-zsh-theme-a705776ac6b5) and release of v2.0, but now we have even more exciting changes and announcements. So here we go!

[:material-github: Source on GitHub](https://github.com/spaceship-prompt/spaceship-prompt/tree/v3.0.0){ .md-button}

## What’s new?

The initial purpose of this release was refactoring of how Spaceship works with sections. By the way, there were a few pull-requests with breaking, but important changes. This release brings better API, new options, few performance improvements and more.

### Drop Oh-My-Zsh dependency

We’ve run into [troubles](https://github.com/denysdovhan/spaceship-prompt/issues/101) using built-in functions from Oh-My-Zsh (OMZ). Besides this, a lot of users would like to use Spaceship without OMZ, with their custom setup or with frameworks like [prezto](https://github.com/sorin-ionescu/prezto). That was the main reason why we decided to remove using OMZ in Spaceship code.

You don’t have to use `ZSH_THEME` or `ZSH_CUSTOM` folder anymore to install Spaceship. Since v3.0 we use a native prompt system that comes zsh:

```zsh
# .zshrc
autoload -U promptinit; promptinit
prompt spaceship
```

### Brand-new name

Dropping OMZ means that Spaceship isn’t a *theme *anymore, it’s a *prompt*. We’ve renamed our packages and GitHub repository

**spaceship-zsh-theme → spaceship-prompt**

Old `spaceship-zsh-theme` npm-package has been deprecated with recommendation to install spaceship-prompt instead.

### Better project structure

First, project structure has been totally reorganized. Previously, Spaceship was just a huge single source file and any change causes constant jumping between different parts of a single file.

Now Spaceship is split up into smaller modules (sections, utils, etc) and they are loading when it’s required. That also means, if you’re struggling with performance, you can just avoid loading the sections that you don’t use. Read more at **“Why is my prompt slow?”** section of documentation:

[Troubleshooting](https://github.com/spaceship-prompt/spaceship-prompt/blob/v3.0.0/docs/Troubleshooting.md){ .md-button }

### Custom sections and Spaceship API

Brice Dutheil sent us a pull-request with [Allow invoking custom functions](https://github.com/denysdovhan/spaceship-prompt/pull/262). This feature opens an ability to define custom sections with any functionality and, therefore, to extend functionality as much as you need.

Moreover, v3.0 comes with better API for creating sections. To avoid conflicts, Spaceship uses SPACESHIP_ prefix for variables and spaceship:: prefix for a function. All section, including custom ones, are being required to use spaceship_prefix before their name to load correctly.

Check out Spaceship’s API here:

[API Documentation](https://github.com/spaceship-prompt/spaceship-prompt/blob/v3.0.0/docs/API.md){ .md-button }

We encourage you to create your section, as many as you want and share them with others on our [External sections](https://github.com/denysdovhan/spaceship-prompt/wiki/External-sections) wiki-page!

### Contributing guidelines

Ability to extend and share sections requires new contributing guidelines, so we’ve finally added a CONTRIBUGING.md file to our repository.

Three simple rules define our development path:

* **Show only what’s needed.** The prompt should not be overloaded, it shows only what user needs at the moment (current directory, git branch, etc).
* **Work out of the box.** The prompt should work right after installation without any additional configuration. Install it and use it.
* **Be configurable.** It works without configuration, but if a configuration is needed, it provides an easy-to-use interface for customization.

Please, keep this simple rules in mind while you’re contributing to Spaceship.

[Contributing Guide](https://github.com/spaceship-prompt/spaceship-prompt/blob/v3.0.0/CONTRIBUTING.md){ .md-button }

### Right prompt support

The new release brings the support of right prompt (`RPROMPT`). By default, right prompt is empty, but you can add some sections the same way you do with a primary prompt.

![**Spaceship** with **time** section in right prompt*](https://cdn-images-1.medium.com/max/3268/1*ebF5F3FSxkFGYir2i3aP0A.png)

Read the documentation about prompt ordering to learn more:

[Options](https://github.com/spaceship-prompt/spaceship-prompt/blob/v3.0.0/docs/Options.md){ .md-button }

### Website and documentation

We are glad to announce that now Spaceship has a documentation website. We use [GitBook](https://gitbook.com) for generating this website from our `./docs` folder.

Here’s how it looks like:

![Website Preview](https://cdn-images-1.medium.com/max/6208/1*sBoAIMIJgp9zZFavFDxTng.png)

Check out our website at:

[Website](https://spaceship-prompt.sh){ .md-button }

### Smaller changes

There was also a lot of petite, but still important changes:

* Thanks to [Rolf Koenders](undefined) Spaceship now [truncates directory name in repositories](https://github.com/denysdovhan/spaceship-prompt/pull/169).
* Now Spaceship has more options for displaying sections: always, needed and charged (for battery section).
* We [removed LS_COLORS](https://github.com/denysdovhan/spaceship-prompt/pull/273) configuration from Spaceship since it doesn’t seem to be a part of prompt.
* [char is now a separate section](https://github.com/denysdovhan/spaceship-prompt/pull/115) that can be configurable as any other.
* Some long-standing bugs have been fixed and resolved.

You can check out Spaceship 3.0 Roadmap for further information:

[:material-github: 3.0: Roadmap · Issue #200](https://github.com/denysdovhan/spaceship-prompt/issues/200){ .md-button}

## Some statistics

It’s always interesting to see more statistic, so totally a [pull-request #148](https://github.com/denysdovhan/spaceship-prompt/pull/148) contains:

* ⏺ 178 commits
* ➕ 3,220 additions
* ➖ 2,250 deletions
* ✅ 34 closed issues in milestone
* 👨‍💻 +1 team member (welcome [Maxim Baz](undefined) 👋🏻)

## Plans for future

As always, the project doesn’t stop to evolve. We have plenty of issue, pull-requests, and plans for future development.

* **Top priority:** [Async rendering to speed-up prompt.](https://github.com/denysdovhan/spaceship-prompt/issues/307)
* [☕ Java support](https://github.com/denysdovhan/spaceship-prompt/pull/265)
* [🌳 Elm support](https://github.com/denysdovhan/spaceship-prompt/pull/253)
* and [others](https://github.com/denysdovhan/spaceship-prompt/pulls)

Want to help? Check out [help wanted label](https://github.com/denysdovhan/spaceship-prompt/labels/help-wanted) in Issue. If you need a feature or have any question, don’t be hesitated to [open an issue](https://github.com/denysdovhan/spaceship-zsh-theme/issues/new).

## Donation

Hi! I work on this project in my spare time, beside my primary job. I hope enjoy using Spaceship, and if you do, please, [buy me a cup of tea ☕️](https://www.buymeacoffee.com/denysdovha).

I would appreciate your support! *Thank you!*

> Thankyou for reading! If you like this article, please, press 👏. Follow me on [Twitter](https://twitter.com/denysdovhan) and [GitHub](https://github.com/denysdovhan), if you want to get updates.*
