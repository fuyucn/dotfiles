-- key
vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- BufferLine/ tabs?
map("n", "<Tab>", ":BufferLineCycleNext<cr>", opts)
--map("n", "<Tab>", ":tabnext<Return>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", opts)

-- Unhighlight searched elements
map("n", "<C-m>", ":nohlsearch<cr>", opts )

-- Window
---- Split
map("n", "<leader>ss", ":split<CR><C-w>w", opts )
map("n", "<leader>sv", ":vsplit<CR><C-w>w", opts )
---- Move
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })
---- Size
map('n', "<C-w><left>", "<C-w><", opts)
map('n', "<C-w><right>", "<C-w>>", opts)
map('n', "<C-w><up>", "<C-w>+", opts)
map('n', "<C-w><down>", "<C-w>-", opts)


-- Increase/Decrease
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)

-- Select all
map('n', '<C-a>', "gg<S-v>G", opts)


--
map('n', '<space>e', vim.diagnostic.open_float)