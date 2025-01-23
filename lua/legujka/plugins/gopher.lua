return {
  "olexsmir/gopher.nvim",
  ft = "go",
  config = function(_, opts)
    require("gopher").setup(opts)
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", opts)
    map("n", "<leader>gsy", "<cmd> GoTagAdd yaml <CR>", opts)
  end,
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
}
