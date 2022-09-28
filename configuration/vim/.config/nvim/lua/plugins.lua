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
end)
