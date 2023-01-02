
export FORGIT_INSTALL=~/.dotfiles/repos/forgit
export FORGIT_NO_ALIASES=1

source "$FORGIT_INSTALL/forgit.plugin.zsh"
unset FORGIT_NO_ALIASES

alias fga='forgit::add'
alias fgrh='forgit::reset::head'
alias fglo='forgit::log'
alias fgd='forgit::diff'
alias fgi='forgit::ignore'
alias fgcf='forgit::checkout::file'
alias fgcb='forgit::checkout::branch'
alias fgco='forgit::checkout::commit'
alias fgbd='forgit::branch::delete'
alias fgrc='forgit::revert::commit'
alias fgct='forgit::checkout::tag'
alias fgclean='forgit::clean'
alias fgss='forgit::stash::show'
alias fgsp='forgit::stash::push'
alias fgcp='forgit::cherry::pick::from::branch'
alias fgrb='forgit::rebase'
alias fgfu='forgit::fixup'
alias fgbl='forgit::blame'

