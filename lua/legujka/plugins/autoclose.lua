return {
  "m4xshen/autoclose.nvim",
  config = function()
    require("autoclose").setup {
      options = {
        pair_spaces = true,
      },
    }
  end
}
