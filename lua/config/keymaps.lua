-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("util")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Vertical move down - cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Vertical move up - cursor centered" })

-- delete without yanking
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yanking NORMAL" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete without yanking VISUAL" })
-- paste no yank
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking ALL" })
-- Explorer
vim.keymap.set("n", "<leader>h", ":Ex<CR>", { desc = "Opens file explorer" })
-- Search results
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next result - cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search previous result - cursor centered" })
-- replace word
vim.keymap.set(
  "n",
  "<leader>r",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "[r]eplace all instances of word under cursor" }
)
-- JJ ESC--
vim.keymap.set("i", "jj", "<ESC>", { desc = "Add jj as alternative to ESC" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Open Lazy.nvim
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

-- lazygit
vim.keymap.set("n", "<leader>gg", function()
  Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })
vim.keymap.set("n", "<leader>gG", function()
  Util.float_term({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })
