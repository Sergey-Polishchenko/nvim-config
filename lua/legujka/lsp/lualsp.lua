local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local notify = require('notify')

local capabilities = cmp_nvim_lsp.default_capabilities()

local function lsp_notify(server_name)
  notify(string.format("LSP [%s] успешно загружен и работает!", server_name), "info", {
    title = "LSP Статус",
    timeout = 3000,
  })
end

local on_attach = function(client, bufnr)
  lsp_notify(client.name)
end

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
