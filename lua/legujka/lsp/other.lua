local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local notify = require("notify")

-- Общая функция on_attach с минимальным набором функций для каждого сервера
local function on_attach(client, bufnr, custom_keymaps)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  if custom_keymaps then
    for _, mapping in ipairs(custom_keymaps) do
      keymap(mapping.mode, mapping.key, mapping.cmd, opts)
    end
  end

  notify(client.name .. " успешно подключен", "info", { title = "LSP Статус" })
end

-- Dockerfile LSP
lspconfig.dockerls.setup {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "Dockerfile", "dockerfile" },
  root_dir = util.root_pattern("Dockerfile", ".git"),
  on_attach = function(client, bufnr)
    on_attach(client, bufnr, {
      { mode = "n", key = "K", cmd = vim.lsp.buf.hover },
      { mode = "n", key = "gd", cmd = vim.lsp.buf.definition },
    })
  end,
}

-- YAML LSP (для docker-compose)
lspconfig.yamlls.setup {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml" },
  root_dir = util.root_pattern("docker-compose.yml", "Taskfile.yml", ".git"),
  on_attach = function(client, bufnr)
    on_attach(client, bufnr, {
      { mode = "n", key = "K", cmd = vim.lsp.buf.hover },
    })
  end,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
        ["https://taskfile.dev/schema.json"] = "Taskfile*.yml",
      },
    },
  },
}

-- Makefile поддержка (без лишних кеймапов)
lspconfig.efm.setup {
  init_options = { documentFormatting = false },
  filetypes = { "make" },
  root_dir = util.root_pattern("Makefile", ".git"),
  on_attach = function(client, bufnr)
    on_attach(client, bufnr) -- Нет кеймапов, просто подключение
  end,
}

