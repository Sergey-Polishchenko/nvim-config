return {
  "leoluz/nvim-dap-go",
  dependencies = "mfussenegger/nvim-dap",
  ft = "go",
  config = function(_, opts)
    require("dap-go").setup(opts)
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Маппинги для dap-go
    map("n", "<leader>dgt", ":lua require('dap-go').debug_test()<CR>", opts)
    map("n", "<leader>dgl", ":lua require('dap-go').debug_last()<CR>", opts)

    -- Дополнительные маппинги для dap
    map("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)
    map("n", "<leader>dus", ":lua require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).open()<CR>", opts)
  end
}
