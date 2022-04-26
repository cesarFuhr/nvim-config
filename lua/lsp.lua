local cmp     = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-3), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(3), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<Return>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  }, {
    { name = 'buffer', keyword_length = 5, max_item_count = 10 },
  }),
  view = {
    entries = "native"
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      },
    },
  },
  experimental = {
    ghost_text = true,
  },
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require 'lspconfig'
local telescopeBuiltin = require 'telescope.builtin'

local custom_lsp_attach = function()
  vim.keymap.set('n', 'K',  vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = 0 })
  vim.keymap.set('n', 'gi', telescopeBuiltin.lsp_implementations, { buffer = 0 })
  vim.keymap.set('n', 'gb', telescopeBuiltin.lsp_document_symbols, { buffer = 0 })
  vim.keymap.set('n', 'gw', telescopeBuiltin.lsp_dynamic_workspace_symbols, { buffer = 0 })
  vim.keymap.set('n', 'gr', telescopeBuiltin.lsp_references, { buffer = 0 })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { buffer = 0 })
  vim.keymap.set('n', '<leader>dl', telescopeBuiltin.diagnostics, { buffer = 0 })
  vim.keymap.set('n', '<leader>af', vim.lsp.buf.code_action, { buffer = 0 })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
end

-- Go!
lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = custom_lsp_attach,
  settings = {
    gopls = {
      staticcheck = true,
    }
  }
}

function Go_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for _, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, 'utf-8')
      else
        vim.lsp.buf.execute_command(r.command)
      end
    end
  end
end

vim.api.nvim_command('autocmd BufWritePre *.go :silent! lua vim.lsp.buf.formatting()')
vim.api.nvim_command('autocmd BufWritePre *.go :silent! lua Go_imports(1000)')

-- Rust
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = custom_lsp_attach,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      diagnostics = {
        disabled = { "unresolved-import" }
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
      checkOnSave = {
        command = "clippy"
      },
    }
  }
}
vim.api.nvim_command('autocmd BufWritePre *.rs :silent! lua vim.lsp.buf.formatting()')

-- Lua
lspconfig.sumneko_lua.setup {
  on_attach = custom_lsp_attach,
}
-- vim.api.nvim_command('autocmd BufWritePre *.lua :silent! lua vim.lsp.buf.formatting()')

-- Nix
lspconfig.rnix.setup {
  on_attach = custom_lsp_attach,
}

-- JS/TS
lspconfig.tsserver.setup {
  on_attach = custom_lsp_attach,
}
