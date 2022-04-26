
local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)


