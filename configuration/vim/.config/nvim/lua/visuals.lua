
vim.opt.background = 'dark'
vim.opt.list = true
vim.opt.showmode = false
vim.opt.number = true

-- Enable the cursorline in insert mode
vim.api.nvim_create_autocmd('InsertEnter', {command = 'set cursorline'})
vim.api.nvim_create_autocmd('InsertLeave', {command = 'set nocursorline'})

-- Use the gruvbox color scheme
-- https://github.com/ellisonleao/gruvbox.nvim
require('gruvbox').setup({})
vim.cmd('colorscheme gruvbox')

-- Configure the status line
require('lualine').setup({
  options = {
    theme = 'gruvbox',
    component_separators = '',
    section_separators = '',
  },
  extensions = {'nvim-tree', 'toggleterm'}
})

-- Configure the tab line
vim.opt.termguicolors = true
require("bufferline").setup({})

