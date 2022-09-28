
local g = vim.g
local opt = vim.opt

-- disable netrw
g.loaded = 1
g.loaded_netrwPlugin = 1

require('impatient')

require('plugins')
require('visuals')
require('terminal')

require('nvim-tree').setup()

opt.mouse = 'a'

opt.ts = 2
opt.sts = 2
opt.sw = 2
opt.expandtab = true

