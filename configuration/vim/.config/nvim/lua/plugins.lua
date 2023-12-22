return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  use({
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  })
  use('nvim-lua/plenary.nvim')
  use('numToStr/Comment.nvim')
  use('kylechui/nvim-surround')

  use('nvim-telescope/telescope.nvim')

  use('lewis6991/gitsigns.nvim')

  use('lewis6991/impatient.nvim')

  -- Visuals
  use('ellisonleao/gruvbox.nvim')
  use({
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'nvim-tree/nvim-web-devicons',
  })
  use({
    'nvim-lualine/lualine.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
  })

  -- File tree browser
  use({
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
  })

  -- Terminal
  use('akinsho/toggleterm.nvim')

  -- Language support
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use('neovim/nvim-lspconfig')
  use('mfussenegger/nvim-dap')
  use('simrat39/rust-tools.nvim')
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    tag = 'v0.9.*',
  })
  use('simrat39/symbols-outline.nvim')

  -- Completetion
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lsp-signature-help')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/vim-vsnip')

  use({
    'j-hui/fidget.nvim',
    tag = 'v1.*',
  })
end)
