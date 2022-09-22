# Frequently Asked Questions

This page aimed to help you fix the common problems encountered with Spaceship.

If you struggle with something, feel free to ask a question on our Discord server or on the GitHub Discussions forum:

[:fontawesome-brands-discord: Discord][discord]{ .md-button }
[:fontawesome-brands-github: Discussions][discussions]{ .md-button }

## Why doesn't my prompt look like the preview?

<div class="terminal-demo">
  <script id="asciicast-513451" src="https://asciinema.org/a/513451.js" data-autoplay="true" data-loop="true" data-preload="true" async></script>
  <noscript>
    <object class="asciicast" type="image/svg+xml" data="/assets/images/spaceship-demo.svg">
      <img src="/assets/images/spaceship-demo.gif" alt="Spaceship demo" />
    </object>
  </noscript>
</div>

Preview shows `spaceship` prompt setup with:

- **Terminal**
    - [iTerm2](https://iterm2.com/) as terminal emulator.
    - [One Dark](https://www.npmjs.com/package/hyperterm-atom-dark) color theme.
    - [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads) with ligatures as primary font (16px size).
- **Shell configuration**
    - [denysdovhan's Dotfiles](https://github.com/denysdovhan/dotfiles)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) to have commands colorized.
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) to have browser-like autocompletions.

See [screenshots](https://github.com/spaceship-prompt/spaceship-prompt/wiki/Screenshots) wiki for more color schemes examples.

## How do I get command completion as shown in the demo GIF?

Use [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) to get browser-like command completions based on history and completions.

## What's the weird symbol before the `git` branch?

You need to have a Powerline patched font in order to properly display `git` branch symbol.

- Install any Powerline compatible font like [Fira Code](https://github.com/tonsky/FiraCode) or [others](https://github.com/powerline/fonts).
- Configure your terminal emulator to [use that font](https://powerline.readthedocs.io/en/master/troubleshooting/osx.html).

## What's the weird character in front of a section?

This is not an issue with Spaceship prompt. Spaceship uses Unicode symbols to represent `SPACESHIP_*_SYMBOL` in sections. To solve this problem:

- Verify your terminal emulator support Unicode characters with this command:
  ```zsh
  curl -L https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  # or
  wget -O - https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  ```
- Configure your terminal emulator to use UTF-8 as character encoding.
  - `LC_ALL` needs to be [set to a UTF-8 value](https://www.tecmint.com/set-system-locales-in-linux/), like `en_US.UTF-8` or `de_DE.UTF-8`, etc.
  - You need to install an emoji font. Most systems already have such font installed, but some systems don't (for example Arch Linux). You should install one via your preferred package manager. [noto emoji](https://www.google.com/get/noto/help/emoji) is a popular choice.
  -

In case Unicode symbols aren't supported, you can replace them to those that are compatible with your terminal with `SPACESHIP_*_SYMBOL` options. Check out [Options](/config/intro) page for more information.

## Do `spaceship remove <section>` and `SPACESHIP_<SECTION>_SHOW=false` do the same thing?

Both `spaceship remove` and `SPACESHIP_<SECTION>_SHOW=false` commands hide the section from the prompt, but they do this differently.

`spaceship remove` command removes the section from `SPACESHIP_[R]PROMPT_ORDER` variable, thus preventing the section from loading and executing.

`SPACESHIP_<SECTION>_SHOW=false` command doesn't prevent the section from loading and executing. The section will be loaded and then run, though the section itself will decide how to hide itself (usually, the section just skips all the checks and doesn't render anything).

tldr: `spaceship remove` forces Spaceship renderer to skip the section and `SPACESHIP_<SECTION>_SHOW=false` tells the section to hide itself.

## What the difference between Spaceship and Starship?

Both [Starship](https://starship.rs) is a great prompt and have (more or less) feature parity with Spaceship. So what is the difference?

[Starship](https://starship.rs) is written in Rust and comes as a successor of [Spacefish](https://spacefish.matchai.dev/) – a Fish implementation of the Spaceship prompt. It is heavily inspired by Spaceship prompt (they even confirm that on their website). It's also based on Denys Dovhan's ideas of cross-shell prompts that have been implemented in [denysdovhan/robbyrussell-node](https://github.com/denysdovhan/robbyrussell-node) as proof of concept.

Starship have advantage in supported shells, it works with roughly any shell. Spaceship is limited to Zsh, but uses most of the capabilities of Zsh.

Starship perform its checks asynchronously and renders the prompt as soon as it's ready. Spaceship not only performs checks asynchronously, but also renders the prompt right away and updates it as soon as new information comes from asynchronous tasks.

Spaceship considers custom sections as a first-class citizens and has a Registry of custom sections, whereas Starship suggests to use [custom commands](https://starship.rs/config/#custom-commands) for creating custom modules.

If you use different machines with different shell prompts Starship might be a better choice for you. Spaceship is great if you prefer to use the same Zsh configuration of every machine you use.

## What the difference between Spaceship and Powerlevel10k (with Lean style)?

[Powerlevel10k](https://github.com/romkatv/powerlevel10k) (with Lean mode) is another Zsh prompt that might look very similar to Spaceship.

Both prompts are asynchronous and render the prompt as soon as it's ready. Powerlevel10k takes more monolith approach to prompt with tons of features built in a single prompt. Spaceship, however, takes a more modular approach to prompt with custom sections and more options for customizations.

On the other hand, Powerlevel10k suggests multiple design presets. Spaceship only supports one preset.

## Some section icons overlap each other?

![example of icons overlapping](https://user-images.githubusercontent.com/3459374/34945188-1f6398be-fa0b-11e7-9845-a744bc3e148d.png)

This issue is related to how your terminal emulator renders Unicode 9 characters. To fix this issue:

- Make sure terminal uses _Unicode Version 9 Widths_.
- Let your terminal render ambiguous-width characters as double-width.

In _iTerm_ follow these instructions:

- Go _iTerm → Preferences… (⌘,) → Profiles → Text_
- Check _Unicode Version 9 Widths_.
- Check _Threat ambiguous-width characters as double-width_.
- Reload terminal's tab.

## Still can't find a solution?

If any of above does not help, please, ask a question on our Discord server or [file an issue][issues], describe your problem, and we will gladly help you.

[:fontawesome-brands-discord: Discord][discord]{ .md-button }
[:fontawesome-brands-github: Discussions][discussions]{ .md-button }
[:fontawesome-brands-github: Open an Issue][issues]{ .md-button }

<!-- References -->

[discord]: https://discord.gg/NTQWz8Dyt9
[discussions]: https://github.com/spaceship-prompt/spaceship-prompt/discussions/
[issues]: https://github.com/spaceship-prompt/spaceship-prompt/issues/new
