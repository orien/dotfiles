# Orien's dotfiles

This Git repository contains my Unix development configuration.  Most tools are configured for web programming with Ruby, Javascript, Rust, Go, and [Pony] in [Zed], [Helix], and [Neovim] on macOS.

[Pony]: https://ponylang.io/
[Zed]: https://zed.dev/
[Helix]: https://helix-editor.com/
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
curl -sSL https://github.com/MikeMcQuaid/strap/archive/refs/heads/main.tar.gz | tar xz
STRAP_GITHUB_USER=orien ./strap-main/bin/strap.sh
```
