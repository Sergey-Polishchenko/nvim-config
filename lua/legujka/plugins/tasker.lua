return {
  "Sergey-Polishchenko/tasker.nvim",
  config = function()
    require("tasker").setup()
  end,
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for utility functions
    "ibhagwan/fzf-lua",      -- Optional: For better task selection UI (if you plan to extend the plugin)
  },
}
