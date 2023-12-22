local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', 'https://github.com/folke/lazy.nvim.git', lazy_path })
end
vim.opt.rtp:prepend(lazy_path)

require('lazy').setup({
  { 'folke/trouble.nvim', dependencies = 'nvim-tree/nvim-web-devicons'  },
  'nvim-lua/plenary.nvim',
  'numToStr/Comment.nvim',
  'kylechui/nvim-surround',

  'nvim-telescope/telescope.nvim',

  'lewis6991/gitsigns.nvim',

  'lewis6991/impatient.nvim',

  -- Visuals
  'ellisonleao/gruvbox.nvim',
  { 'akinsho/bufferline.nvim', version = '^2.12.0', dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },

  -- File tree browser
  { 'nvim-tree/nvim-tree.lua', dependencies = 'nvim-tree/nvim-web-devicons' },

  -- Terminal
  'akinsho/toggleterm.nvim',

  -- Language support
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'mfussenegger/nvim-dap',
  'simrat39/rust-tools.nvim',
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', version = '~0.9.1' },
  'simrat39/symbols-outline.nvim',

  -- Completetion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'hrsh7th/vim-vsnip',

  { 'j-hui/fidget.nvim', version = '^1.1.0' },
})
