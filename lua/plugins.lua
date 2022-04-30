_ = vim.cmd [[packadd packer.nvim]]

return require'packer'.startup(function (use)
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'marko-cerovac/material.nvim'
  use 'airblade/vim-gitgutter'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lualine/lualine.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kyazdani42/nvim-web-devicons'
  use 'numToStr/FTerm.nvim'
  use 'hashivim/vim-terraform'

  -- Lsp
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'

  -- Completition
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
    -- For luasnip users.
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  require('lualine').setup {
    options = {
      theme = 'base16',
      globalstatus = true,
    },
  }
  require('nvim-treesitter.configs').setup {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  }
  require('FTerm').setup({
    cmd = 'fish'
  })
end)
