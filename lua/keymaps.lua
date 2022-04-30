local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- nmap <silent> <leader>lc :set invlist<CR>
local write = function()
  vim.api.nvim_command('write')
end
map('n', '<leader>w', write, opts)
map('n', '<leader>lc', '<cmd>set invlist!<cr>', opts)

local toggleTerm = require 'FTerm'.toggle
map({ 'n', 't' }, '<A-i>', toggleTerm, opts)

local telBuiltin = require 'telescope.builtin'
map('n', '<leader><leader>', telBuiltin.find_files, opts)
map('n', '<leader>fg', telBuiltin.live_grep, opts)
map('n', '<leader>fb', telBuiltin.buffers, opts)
map('n', '<leader>fh', telBuiltin.help_tags, opts)
