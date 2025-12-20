# Announcing Spaceship v4 — the faster, the better

<aside class="mdx-author" markdown>
  ![@denysdovhan](https://unavatar.io/denysdovhan)

  <span>__Denys Dovhan__ · @denysdovhan</span>
  <span>
  :octicons-calendar-24: Aug 20, 2022 ·
  [:octicons-tag-24: v4.0.0](https://github.com/spaceship-prompt/spaceship-prompt/tree/v4.0.0)
  </span>
</aside>

---

_The wait is over._ We're finally ready to launch the new version of Spaceship.

This is a major release, bringing many new features and smaller improvements. We've dramatically improved performance, improved API, made configuration easier and refactored dozens of parts of the codebase.

Let's see what's new in **Spaceship v4**.

<figure markdown>
  ![spacex-tKs_2sBoqAg-unsplash](https://user-images.githubusercontent.com/3459374/183982070-512f298c-5ff6-4b1c-b0b7-23d0551d09aa.jpeg)
  <figcaption>A picture of Falcon Heavy by SpaceX</figcaption>
</figure>

## A few words from maintainer

Hey, I'm Denys 👋

I'm original creator and maintainer of Spaceship project. Before we begin, I'd like to say a few words about my journey to this release.

It's been a while since the last release of Spaceship. A lot has happened. I've burned out from doing open-source for free, moved to another city, started lots of different projects, and _full scale invasion of my country began_.

I live in Kyiv, Ukraine. Russia invaded my country, kills my countrymen daily, endangers my live forcing me to flee the city I live in. I was working on this release mostly to get my mind off the reality. This release is partly made when I was sitting in a shelter, hiding from rocket strikes. This is the reality of Russian cruelty and aggression.

Ukrainian Open Source community teamed up and created a website where you can read more about the situation and donate to help people in need. Please, consider donating to help us survive and win this war.

[:flag_ua: StandWithUkraine](https://stand-with-ukraine.pp.ua){ .md-button }
[War in Ukraine](https://war.ukraine.ua){ .md-button }

Please, **spread the word and help us, help me**. Thank you. Let's get back to the release.

## What's new in v4?

This release comes with tons of bigger and smaller improvements. Let's take a closer look at features that are new in v4.

[v4.0.0 Release Notes](https://github.com/spaceship-prompt/spaceship-prompt/releases/tag/v4.0.0){ .md-button }

### Asynchronous rendering

The biggest feature of this release is [**asynchronous rendering**](../config/prompt.md). We know you've been waiting for this for long.

Spaceship has a lot of sections and even [more have been contributed](https://github.com/spaceship-prompt/spaceship-prompt/pulls?q=is%3Apr+is%3Aopen+label%3Anew-feature). The more section is added, the more computation is needed to render the prompt. For a user it means you have to wait longer to be able to type the next command. Not anymore.

Now Spaceship performs heavy computation in a separate thread and renders the prompt asynchronously. Spaceship will display the prompt **immediately, without blocking the input**. You can start typing the following command right away. Additional information will be added to the prompt as soon as the computation is finished.

Here's how it works:

<div class="terminal-demo">
  <script id="asciicast-514494" src="https://asciinema.org/a/514494.js" data-autoplay="true" data-loop="true" data-preload="true" async></script>
</div>

As you see above, only the directory and prompt character are displayed immediately. The rest of the prompt (`git` and `package` sections) are rendered asynchronously and thus added later. A [`…` placeholder](../sections/async.md) for upcoming information is displayed while the computation is in progress.

If you're fast enough you can even type the following command, before the prompt is fully rendered.

The asynchronous rendering is enabled by default. You can disable it by setting `SPACESHIP_PROMPT_ASYNC` to `false` in your configuration.

```zsh title=".spaceshiprc.zsh"
SPACESHIP_PROMPT_ASYNC=false
```

Kudos to [@laggardkernel](https://github.com/laggardkernel) who laid the groundwork for asynchronous rendering.

### Registry for sections

This release also introduces [the Spaceship Registry](../registry.md). It's a registry of all sections that are available for Spaceship.

![Spaceship Registry](https://user-images.githubusercontent.com/3459374/187728583-0a7b3fdb-2a6d-41bb-ae1d-378b8e4db660.png)

It will dramatically simplify exploring new sections. Now you can browse all the sections, including the additional sections developed and maintained by other users.

Additionally, if you are developing a custom section for Spaceship you might want to check out our section development guide and a template repository:

[Create a custom section](../advanced/creating-section.md){ .md-button}
[:fontawesome-brands-github: Use a section template](https://github.com/spaceship-prompt/spaceship-section){ .md-button }

### Easier configuration

Previously, users had problems with understanding where to put Spaceship's configuration in their dotfiles. This release introduces Spaceship configuration files. Now you can put your configuration in `~/.spaceshiprc.zsh` or `~/.config/spaceship.zsh` files and it will be loaded automatically in a proper place.

These files will sourced as a simple Zsh file, so you can write imperative configuration within them. You can also use [Spaceship CLI](#command-line-interface) within the configuration file.

To get started with configuration file, create one:

```zsh title="Terminal"
touch ~/.spaceshiprc.zsh
```

You can also quickly open you configuration file with `spaceship edit` command. Here's an example:

<div class="terminal-demo">
  <script id="asciicast-AcdMFOQRt0s2N3fUcbACtqf3H" src="https://asciinema.org/a/AcdMFOQRt0s2N3fUcbACtqf3H.js" data-autoplay="true" data-loop="true" data-preload="true" async></script>
</div>

### Command line interface

You might have noticed Spaceship now comes with a handy `spaceship` CLI. The goal is to simplify common task you do with Spaceship, like editing configuration, adding and removing sections, etc.

You can also dynamically add and remove sections to/from the prompt with `spaceship add` and `spaceship remove` commands.

<div class="terminal-demo">
  <script id="asciicast-FKGI2RSQnGP3T67ykYq4g3sfA" src="https://asciinema.org/a/FKGI2RSQnGP3T67ykYq4g3sfA.js" data-autoplay="true" data-loop="true" data-preload="true" async></script>
</div>

Both `spaceship add` and `spaceship remove` apply changes only to the current session, so if you want to make them permanent, add those commands to your `.spaceshiprc.zsh`:

```zsh title=".spaceshiprc.zsh"
# Removes git out of the prompt
spaceship remove git dir

# Adds git back to the prompt, before the prompt character
spaceship add git --before char

# Add directory to the right prompt
spaceship add dir --order rprompt
```

What else can you do with `spaceship` CLI?

* `spaceship print` — prints the current prompt value in a raw format.
* `spaceship edit` — quickly opens your [Spaceship configuration](#easier-configuration) in your `$EDITOR`.
* `spaceship bug-report` — generates a bug report for you with pre-filled information about your environment. Use it any time you want to report a bug.

### Other improvements

* **Source files of the Spaceship are now getting automatically compiled to ZWC with [`zcompile`](https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html#index-_002e).** ZWC or Zsh Word Code is a special format of compiled Zsh scripts. It helps Zsh skip the reading and parsing of the script and get straight to executing. This results in a significant performance boost.
* **Improved `package` section.** Now it supports `composer` and `julia`. Package version resolution got smarter and faster thanks to the new `spaceship::extract` utility.
* **`git` and `hg` orders are now configurable.** You can use `spaceship add --order git` to change the order of `git` section or add custom subsection to it.
* **Upsearching files.** Now when Spaceship looks for a file, it will search for it in the current directory and all parent directories up to the repository root. This will help maintaining the context of you current environment.
* **Added checks for minimal zsh version.** Now, if you are running an outdated version of Zsh, you will get a message.
* **Spaceship Docker image.** You can now use [Spaceship Docker image](https://github.com/spaceship-prompt/spaceship-prompt/pkgs/container/spaceship-prompt) to test Spaceship in a clean environment. It's also used to run tests in CI.
* **Spaceship Testkit.** If you are developing a custom section you can now use [Spaceship Testkit](../api/testkit.md) for performing common testing tasks.
* [**And many more!**](TODO: link to changelog)

### Breaking Changes

Of course, every major release comes with breaking changes. Here's what you need to know:

#### A new API for `spaceship::section`, not relying on arguments order

Not you can pass information about the section via flags. In custom sections it's recommended to use `spaceship::section::v4` function to ensure smooth migration to the newer version in the future. Previous one can be used via `::v3` suffix.

#### `pyenv` section is renamed to `python`

This is done to unify naming of the sections. If you are using `PYENV_` options, you need to rename it to `PYTHON_` in your configuration. You'll get a corresponding warning if you are using the old options.

#### `ember` section is removed from core

It's now [an external section `spaceship-ember`](https://github.com/spaceship-prompt/spaceship-ember). It's still available in the registry, so you can install it back to your prompt if you need it.

#### `java` section was refactored

[Maven (`spaceship-maven`)](https://github.com/spaceship-prompt/spaceship-maven) and [Gradle (`spaceship-gradle`)](https://github.com/spaceship-prompt/spaceship-gradle) are not included by default, but still can be installed as external sections.

#### `vi_mode` section is also removed from core

It used to cause too many problems for users who are not using Vi-mode. You can still install as [`spaceship-vi-mode` section](https://github.com/spaceship-prompt/spaceship-vi-mode).

#### Kubecontext section now has consisted naming.

Options are renamed to `KUBECTL_` instead of `KUBECONTEXT_`. You'll get a corresponding warning if you are using the old options.

## What's next?

### Smaller and shorter releases

Preparing such releases like this one is a bit of a challenge. There are too many things to check and rework.

From now on, we'll try to release more often, but with smaller and shorter changelogs. This will help us to keep the quality of the releases high and make it easier for you to keep up with the changes.

### More sections

More new sections are coming. Asynchronous rendering unblocks new sections that were frozen due to performance issues. In upcoming day and weeks we will gradually unfreeze, update and merge PRs with new sections.

You should expect these sections to be released in the next few weeks: [Flutter](https://github.com/spaceship-prompt/spaceship-prompt/pull/942), [V Lang](https://github.com/spaceship-prompt/spaceship-prompt/pull/877), [Pulumni](https://github.com/spaceship-prompt/spaceship-prompt/pull/834), [Ocaml](https://github.com/spaceship-prompt/spaceship-prompt/pull/810), [Deno](https://github.com/spaceship-prompt/spaceship-prompt/pull/809) and others.

## How to help?

The development of such release takes time and effort. We gladly accept any help. Here are some ways you can help:

### Contribute to the project

You can contribute to the project by taking simple tasks marked by **good first issue** label, helping to translate the documentation or by helping people who are having issues with Spaceship.

[:material-open-source-initiative: How to Contribute](../contribute.md){ .md-button }
[:material-translate: Help Translating](https://translate.spaceship-prompt.sh/){ .md-button }

### Financial support

If you really enjoy this project, you can contribute financially. Any contribution is highly appreciated, even the smallest one. There are several ways to donate:

**Recurring donations:**

[:fontawesome-brands-github: Sponsors](https://github.com/sponsors/denysdovhan?frequency=recurring){ .md-button }
[:material-open-source-initiative: Open Collective](https://opencollective.com/spaceship-prompt){ .md-button }
[:fontawesome-brands-patreon: Patreon](https://patreon.com/denysdovhan){ .md-button }

**One-time donations:**

[:fontawesome-brands-github: Sponsors](https://github.com/sponsors/denysdovhan?frequency=one-time){ .md-button }
[:material-coffee: Buy Me a Coffee](https://buymeacoffee.com/denysdovhan){ .md-button }

**Crypto donations:**

* **:fontawesome-brands-ethereum: Ethereum**: `0x5C9496De5E51D48daf28354DC04d8f9D33955559`
* **:fontawesome-brands-bitcoin: Bitcoin**: `bc1q5ezjvpgftmx42f9qgdf5lscjz43uh4jf02uvje`

## Thanks everyone!

Thanks for reading! Thank you for using Spaceship! Hope you'll enjoy using this new version of Spaceship!

See you in our [Discord server](https://discord.gg/NTQWz8Dyt9)! Don't forget to like and retweet our announcement tweet!

<blockquote class="twitter-tweet">
  <p lang="en" dir="ltr">🎉 Announcing Spaceship 4.0<br><br>The wait is over. We&#39;re finally ready to launch the new version of Spaceship.<br><br>🚀 Fast asynchronous rendering<br>📝 Sections Registry<br>⚙️ Customizable configuration files<br>💻 Command-line interface<br>🤭 New sections are coming<br><br>👉 <a href="https://t.co/gzQRCjiq7i">https://t.co/gzQRCjiq7i</a></p>&mdash; Spaceship 🚀⭐ (@SpaceshipPrompt) <a href="https://twitter.com/SpaceshipPrompt/status/1566742940759650305?ref_src=twsrc%5Etfw">September 5, 2022</a>
</blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
