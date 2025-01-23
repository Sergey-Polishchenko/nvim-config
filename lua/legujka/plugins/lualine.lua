return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
      theme = "tokyonight",
      extensions = { "nvim-tree", "mason", "toggleterm" },
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { "lazy", "mason", "alpha" },
      },
    }
  end
}
