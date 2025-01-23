vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt
opt.relativenumber = true

opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- :h autoindent for help

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work

-- opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- remove swap
vim.opt.autoread = true
vim.opt.swapfile = false

-- autosave on leave inser mode
vim.api.nvim_create_autocmd(
  "InsertLeave",
  {
    pattern = "*",
    callback = function()
      if vim.bo.modified and vim.bo.filetype ~= "nofile" and vim.fn.getbufvar('%', '&modifiable') == 1 then
        vim.cmd("write")
      end
    end,
  }
)

