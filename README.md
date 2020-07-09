From the excellent [dotfiles](http://dotfiles.github.com/) page on GitHub:

> Why would I want my dotfiles on GitHub?
> + **_Backup_**, **_restore_**, and **_sync_** the prefs and settings for your
>   toolbox. Your dotfiles might be the most important files on your machine.
> + **_Learn_** from the community. Discover new tools for your toolbox and new
>   tricks for the ones you already use.
> + **_Share_** what you've learned with the rest of us.

This is my Unix development configuration. I predominantly work on macOS using
iTerm2 as my terminal of choice. The majority of tools are configured for
developing with Ruby, Javascript, Go and Elixir in Vim and VS Code.

### Clone and Install

This repository includes a no-frills shell script to setup symbolic links to
the home directory.

```bash
git clone --recursive git://github.com/orien/dotfiles.git  ~/.dotfiles
~/.dotfiles/script/setup
```

When bootstrapping a new Apple computer, I use [strap]. This handles
downloading my dotfiles repo and running the setup script for me.

[strap]: https://github.com/MikeMcQuaid/strap

```bash
git clone https://github.com/MikeMcQuaid/strap.git
 export STRAP_GITHUB_USER=???
 export STRAP_GITHUB_TOKEN=???
strap/bin/strap.sh
```
