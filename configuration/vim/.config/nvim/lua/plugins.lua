return require('packer').startup(function()
  use('wbthomason/packer.nvim')

  use('lewis6991/impatient.nvim')

  -- Visuals
  use('ellisonleao/gruvbox.nvim')
  use({
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
  })
  use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  })

  -- File tree browser
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  })

  -- Terminal
  use('akinsho/toggleterm.nvim')

  -- Language support
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('neovim/nvim-lspconfig')
  use('mfussenegger/nvim-dap')
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- Completetion
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/vim-vsnip')

  use('j-hui/fidget.nvim')
end)
