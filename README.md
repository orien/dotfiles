# Orien's dotfiles

This Git repository contains my Unix development configuration.  Most tools are configured for web programming with Ruby, Javascript, and Rust in [Neovim] on macOS.

[Neovim]: https://neovim.io/

### Clone and Install

This project includes a no-frills shell script that positions symbolic links to configuration in the home directory.

```bash
git clone --recursive git://github.com/orien/dotfiles.git  ~/.dotfiles
~/.dotfiles/script/setup
```

When bootstrapping a new Apple computer, I use [Strap]. Strap handles downloading my dotfiles repo and running the setup script for me.

[Strap]: https://github.com/MikeMcQuaid/strap

```bash
git clone https://github.com/MikeMcQuaid/strap.git
 export STRAP_GITHUB_USER=???
 export STRAP_GITHUB_TOKEN=???
strap/bin/strap.sh
```
