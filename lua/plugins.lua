_ = vim.cmd [[packadd packer.nvim]]

return require'packer'.startup(function (use)
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-telescope/telescope.nvim'
  -- faster fuzzy support for telescope.
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kyazdani42/nvim-web-devicons'
  use 'numToStr/FTerm.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'hashivim/vim-terraform'
  use 'fladson/vim-kitty'
  use 'marko-cerovac/material.nvim'

  -- Git integration.
  use 'airblade/vim-gitgutter'

  -- Lsp.
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'

  -- Completition.
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
    -- For luasnip users.
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Setting up lualine.
  require('lualine').setup {
    options = {
      theme = 'base16',
      globalstatus = true,
    },
  }

  -- Setting up treesitter.
  require('nvim-treesitter.configs').setup {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  }

  -- Setting up floating and persistent terminal.
  require('FTerm').setup({
    -- put whatever shell you use here.
    cmd = 'zsh'
  })
end)
