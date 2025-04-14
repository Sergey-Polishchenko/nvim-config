return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "honza/vim-snippets",
  },
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({
      paths = {
        vim.fn.stdpath("config") .. "/lua/legujka/snippets"
      }
    })

    require("luasnip").setup({
      update_events = "TextChanged,TextChangedI",
      enable_autosnippets = true,
      ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
          active = { virt_text = { { "●", "DiagnosticWarn" } } }
        }
      }
    })

    local ls = require("luasnip")

    vim.keymap.set({"i", "s"}, "<C-f>", function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-g>", function() ls.jump(-1) end, {silent = true})
  end
}
