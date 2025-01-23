return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup {
      hide_numbers = true,
      close_on_exit = true,
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
      end,
      on_close = function(term)
        vim.cmd("startinsert!")
      end,
    }

    local Terminal = require("toggleterm.terminal").Terminal

    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "curved",
      },
    })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    local terminal = Terminal:new({
      direction = "float",
      float_opts = {
        border = "curved",
      },
    })

    function _TERMINAL_TOGGLE()
      terminal:toggle()
    end
  end
}
