# Troubleshooting

This document can help you fix the common problems encountered while using `spaceship` theme.

## Weird symbol for `git` branch
You need to have a powerline patched font inorder to properly display `git` branch symbol.
- Install any powerline compatible font like [FiraCode](https://github.com/tonsky/FiraCode) or [others](https://github.com/powerline/fonts).
- Configure your terminal emulator to [use that font](https://powerline.readthedocs.io/en/master/troubleshooting/osx.html).

## Weird characters infront of sections
This is not an issue with `spaceship` theme. `spaceship` uses unicode symbols to represent `SPACESHIP_*_SYMBOL` in sections.
- Verify your terminal emulator support unicode characters
```
curl http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
```
or
```
wget -O - http://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt
```
- Configure your terminal emulator to use UTF-8 as character encoding

## Theme doesn't work like preview with autocomplete
![preview](https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/preview.gif)

Preview shows `spaceship` theme with several other `zsh` plugins.

| &nbsp; | &nbsp; |
------ | ----- |
| Terminal | [Hyper](https://hyper.is) |
| Color scheme | [hyperterm-atom-dark](https://www.npmjs.com/package/hyperterm-atom-dark) |
| Plugins | [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) |
| | [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) |

See [screenshots](https://github.com/denysdovhan/spaceship-zsh-theme/wiki/Screenshots) wiki for more color schemes.

