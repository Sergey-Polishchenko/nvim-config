local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.gopls.setup {
  cmd = { "gopls" },
  fyletypes = { "go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local keymap = vim.keymap.set

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap("n", "]d", vim.diagnostic.goto_next, opts)

    local notify = require("notify")
    notify("gopls успешно подключен", "info", { title = "LSP Статус" })
  end,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
}
