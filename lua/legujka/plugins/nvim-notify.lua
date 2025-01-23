return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup {
      top_down = false,
      stages = "fade_in_slide_out",
      timeout = 3000,
    }
    vim.notify = require("notify")
  end,
}
