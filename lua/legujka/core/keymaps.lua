vim.g.mapleader = " "
local keymap = vim.keymap

-- esc
keymap.set("i", "jk", "<ESC>", {desc = "Exit Insert mode with jk"})

-- insert mode navigation
keymap.set("i", "<C-k>", "<Up>", {desc="Up"})
keymap.set("i", "<C-j>", "<Down>", {desc="Down"})
keymap.set("i", "<C-h>", "<Left>", {desc="Left"})
keymap.set("i", "<C-l>", "<Right>", {desc="Right"})

-- press n to remove highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", {desc="Clear search highlights"})

-- increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>", {desc = "Increment Number"})
keymap.set("n", "<leader>-", "<C-x>", {desc = "Decrement Number"})

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", {desc="Split window vertically"})
keymap.set("n", "<leader>sh", "<C-w>s", {desc="Split window horizontally"})
keymap.set("n", "<leader>se", "<C-w>=", {desc="Make splits equal size"})
keymap.set("n", "<C-k>", "<C-w>k", {desc="Go to up split"})
keymap.set("n", "<C-j>", "<C-w>j", {desc="Go to down split"})
keymap.set("n", "<C-h>", "<C-w>h", {desc="Go to left split"})
keymap.set("n", "<C-l>", "<C-w>l", {desc="Go to right split"})
keymap.set("n", "<leader><C-x>", "<cmd>close<CR>", {desc="Close current split"})

-- barbar tab management
local opts = { noremap = true, silent = true }
keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
keymap.set("n", "<C-<>", "<Cmd>BufferMovePrevious<CR>", opts)
keymap.set("n", "<C->>", "<Cmd>BufferMoveNext<CR>", opts)
keymap.set("n", "<C-1>", "<Cmd>BufferGoto 1<CR>", opts)
keymap.set("n", "<C-2>", "<Cmd>BufferGoto 2<CR>", opts)
keymap.set("n", "<C-3>", "<Cmd>BufferGoto 3<CR>", opts)
keymap.set("n", "<C-4>", "<Cmd>BufferGoto 4<CR>", opts)
keymap.set("n", "<C-5>", "<Cmd>BufferGoto 5<CR>", opts)
keymap.set("n", "<C-6>", "<Cmd>BufferGoto 6<CR>", opts)
keymap.set("n", "<C-7>", "<Cmd>BufferGoto 7<CR>", opts)
keymap.set("n", "<C-8>", "<Cmd>BufferGoto 8<CR>", opts)
keymap.set("n", "<C-9>", "<Cmd>BufferGoto 9<CR>", opts)
keymap.set("n", "<C-0>", "<Cmd>BufferLast<CR>", opts)
keymap.set("n", "<C-p>", "<Cmd>BufferPin<CR>", opts)
keymap.set("n", "<C-x>", "<Cmd>BufferClose<CR>", opts)

-- nvim-tree
keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- toggleterm
keymap.set("n", "<leader>tt", "<cmd>lua _TERMINAL_TOGGLE()<cr>", opts)
keymap.set("n", "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=40 direction=vertical<cr>", opts)
keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=30 direction=horizontal<cr>", opts)
keymap.set("t", "jk", [[<C-\><C-n>]], opts)

-- lsp
local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  keymap.set("n", "gr", vim.lsp.buf.references, opts)
  keymap.set("n", "K", vim.lsp.buf.hover, opts)
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

-- goimpl
vim.api.nvim_set_keymap("n", "<leader>im", [[<cmd>lua require("telescope").extensions.goimpl.goimpl{}<CR>]], opts)

-- GoTest
vim.api.nvim_set_keymap('n', "<leader>gtf", [[<cmd>GoAddTest<CR>]], opts)
vim.api.nvim_set_keymap('n', "<leader>gta", [[<cmd>GoAddAllTest<CR>]], opts)

vim.api.nvim_set_keymap('n', "<leader>gtr", [[<cmd>GoTest<CR>]], opts)


-- Настраиваем ключи при подключении LSP
vim.api.nvim_create_autocmd(
  "LspAttach",
  {
    callback = function(args)
      lsp_keymaps(args.buf)
    end,
  }
)
