require('impatient')

vim.g.mapleader = ' '

require('disable_builtin')
require('plugins')
require('visuals')
require('terminal')
require('languages')
require('search')

require('Comment').setup()
require('nvim-tree').setup()
require('nvim-surround').setup()
require('gitsigns').setup()

vim.opt.mouse = 'a'

