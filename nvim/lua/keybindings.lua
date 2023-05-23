-- Set leader key
vim.g.mapleader = " "

-- Open file explorer
vim.keymap.set("n", "<Leader>fm", vim.cmd.Ex)

-- Move selected lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- Append next line to current
vim.keymap.set("n", "J", "mzJ`z")

-- Center cursor after scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Fast copying to system buffer
vim.keymap.set("n", "<Leader>y", "\"+y")
vim.keymap.set("v", "<Leader>y", "\"+y")
vim.keymap.set("v", "<Leader>Y", "\"+Y")

-- Fast pasting from system buffer
vim.keymap.set("n", "<Leader>p", "\"+p")

-- Fast split's navigation
vim.keymap.set("n", "<Leader>h", "<C-w>h")
vim.keymap.set("n", "<Leader>j", "<C-w>j")
vim.keymap.set("n", "<Leader>k", "<C-w>k")
vim.keymap.set("n", "<Leader>l", "<C-w>l")
