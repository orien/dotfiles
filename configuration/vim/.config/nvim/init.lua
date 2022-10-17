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

opt.mouse = 'a'

opt.ts = 2
opt.sts = 2
opt.sw = 2
opt.expandtab = true
