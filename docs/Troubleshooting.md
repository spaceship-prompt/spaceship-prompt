# Troubleshooting

This page aimed to help you fix the common problems encountered while using Spaceship prompt.

## What's the weird symbol for `git` branch?

You need to have a powerline patched font inorder to properly display `git` branch symbol.

* Install any powerline compatible font like [Fira Code](https://github.com/tonsky/FiraCode) or [others](https://github.com/powerline/fonts).
* Configure your terminal emulator to [use that font](https://powerline.readthedocs.io/en/master/troubleshooting/osx.html).

## What's the weird character in front of a section?

This is not an issue with Spaceship prompt. Spaceship uses Unicode symbols to represent `SPACESHIP_*_SYMBOL` in sections. To solve this problem:

* Verify your terminal emulator support Unicode characters with this command:
  ```zsh
  curl http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  # or
  wget -O - http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
  ```
* Configure your terminal emulator to use UTF-8 as character encoding.

## Some section icons overlap each other?

![](https://user-images.githubusercontent.com/3459374/34945188-1f6398be-fa0b-11e7-9845-a744bc3e148d.png)

This issue is related to how your terminal emulator renders Unicode 9 characters. To fix this issue:

* Make sure terminal uses _Unicode Version 9 Widths_.
* Let your terminal render ambiguous-width characters as double-width.

In _iTerm_ follow these instructions:

* Go _iTerm → Preferences… (⌘,) → Profiles → Text_
* Check _Unicode Version 9 Widths_.
* Check _Threat ambiguous-width characters as double-width_.
* Reload terminal's tab.

## Why doesn't my prompt look like the preview?

![preview](../preview.gif)

Preview shows `spaceship` prompt setup with:

* [Hyper](https://hyper.is) as terminal emulator.
* [One Dark](https://www.npmjs.com/package/hyperterm-atom-dark) color theme from [Atom](https://atom.io/) editor.
* [Fira Code](https://github.com/tonsky/FiraCode) with with ligatures as primary font (16px size).
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) to have commands colorized.
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) to have browser-like autocompletions.

See [screenshots](https://github.com/denysdovhan/spaceship-prompt/wiki/Screenshots) wiki for more color schemes examples.

## Does not help?

If any of above does not help, please, [file an issue](https://github.com/denysdovhan/spaceship-prompt/issues/new), describe your problem and we will gladly help you.
