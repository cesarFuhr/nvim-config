local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local write = function()
  vim.api.nvim_command('write')
end
-- Fast write.
map('n', '<leader>w', write, opts)
-- Show invisible chars.
map('n', '<leader>lc', '<cmd>set invlist!<cr>', opts)

-- Toggle floating terminal.
local toggleTerm = require 'FTerm'.toggle
map({ 'n', 't' }, '<A-i>', toggleTerm, opts)

-- Telescope keymaps.
local telBuiltin = require 'telescope.builtin'
-- File fuzzy finder.
map('n', '<leader><leader>', telBuiltin.find_files, opts)
-- Open buffers fuzzy finder.
map('n', '<leader>fb', telBuiltin.buffers, opts)
-- Workspace live greping in all files.
map('n', '<leader>fg', telBuiltin.live_grep, opts)
