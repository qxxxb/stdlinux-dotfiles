# stdlinux dotfiles

For more general setup instructions, see [GUIDE.md](GUIDE.md).

## Terminfo
* Compile terminfo:
```bash
curl -O https://raw.githubusercontent.com/kovidgoyal/kitty/master/terminfo/kitty.terminfo
mkdir ~/.terminfo
tic -o ~/.terminfo kitty.terminfo
rm kitty.terminfo
```

## Neovim
* Download a release
* Symlink the binary to `~/.local/bin`
* Install `vim-plug`

## zsh
* Install `zplug`
* Run `zplug install`
* Install `Pure` prompt manually
  * Do symlinks in `~/.zfunctions`

## ripgrep
* Download a release
* Symlink the binary to `~/.local/bin`
