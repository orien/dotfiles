# Orien's dotfiles

This Git repository contains my Unix development configuration.  Most tools are configured for web programming with Ruby, Javascript, Rust, Go, and [Pony] in [Zed] and [Neovim] on macOS.

[Pony]: https://ponylang.io/
[Zed]: https://zed.dev/
[Neovim]: https://neovim.io/

### Clone and Install

This project includes a no-frills shell script that positions symbolic links to configuration in the home directory.

```bash
git clone --recursive ssh://git@codeberg.org/orien/dotfiles.git  ~/.dotfiles
~/.dotfiles/script/setup
```

When bootstrapping a new Apple computer, I use [Strap]. Strap handles downloading my dotfiles repo and running the setup script for me.

[Strap]: https://github.com/MikeMcQuaid/strap

```bash
git clone https://github.com/MikeMcQuaid/strap.git
./strap/bin/strap.sh
```
