call plug#begin(has('nvim') ? stdpath('data') . '/plugged' :'~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'marko-cerovac/material.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'numToStr/FTerm.nvim'
Plug 'hashivim/vim-terraform'
Plug 'ThePrimeagen/git-worktree.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

" TreeSitter, lualine and lsp config
lua <<EOF
require('snip')
require('lsp')
require'lualine'.setup({
  options = {
    theme = 'material',
  },
})
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
require'FTerm'.setup({
  cmd = 'fish'
})
EOF

source $HOME/.config/nvim/theme.vim
source $HOME/.config/nvim/keybindings.vim

" Prefs
set number relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:$,precedes:«,extends:»
set signcolumn=yes
set gcr=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait1000-blinkoff400-blinkon250-Cursor/lCursor
set shell=fish

" Global statusline
set laststatus=3

" GitGutter
let g:gitgutter_preview_win_floating = 0

