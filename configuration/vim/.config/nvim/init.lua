require('impatient')

local g = vim.g
local opt = vim.opt

-- disable netrw
g.loaded = 1
g.loaded_netrwPlugin = 1

require('plugins')
require('visuals')
require('terminal')
require('languages')

require('Comment').setup()
require('nvim-tree').setup()
require('nvim-surround').setup()
require('gitsigns').setup()

opt.mouse = 'a'

opt.ts = 2
opt.sts = 2
opt.sw = 2
opt.expandtab = true
