From the excellent [dotfiles](http://dotfiles.github.com/) page on GitHub:

> Why would I want my dotfiles on GitHub?
> + **_Backup_**, **_restore_**, and **_sync_** the prefs and settings for your toolbox.
  Your dotfiles might be the most important files on your machine.
> + **_Learn_** from the community. Discover new tools for your toolbox and new tricks for the ones you already use.
> + **_Share_** what you've learned with the rest of us.

This is my current unix development configuration. I'm working on Mac OS X using iTerm2 with the dark
[solarized](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized) color scheme
and Powerline patched fonts. The majority of tools are configured for developing with Ruby in Vim.

### Clone and Install

The repository includes a no-frills shell script to setup symbolic links to the home directory.

```bash
git clone --recursive git://github.com/orien/dotfiles.git  ~/.dotfiles
~/.dotfiles/script/setup.sh
```
