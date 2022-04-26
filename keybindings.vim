" Keybindings
let mapleader = " "

" Fast write
nmap <silent> <leader>w :w<CR>

" Show invisible
nmap <silent> <leader>lc :set invlist<CR>

" Loc List
nmap <silent> <leader>ll :lopen<CR>
nmap <silent> <leader>]l :lnext<CR>
nmap <silent> <leader>[l :lprev<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua <<EOF
  require('keymaps')
EOF
