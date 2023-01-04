-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins")

vim.opt.guicursor = "a:block"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.colorcolumn = "80"

-- Clear Highlights
vim.keymap.set("n", "<Leader><space>", ":noh<cr>", { desc = "Clear search highlights" })
-- No recommended but needed to stop me fatfingering
-- Pause does not work in Terminal at this time.
vim.keymap.set("n", "<c-z>", ":u<CR>", { desc = "Disables CTRL Z" })
-- Move text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves line up" })
-- Explorer
vim.keymap.set("n", "<leader>h", ":Ex<CR>", { desc = "Opens file explorer" })
-- delete without yanking
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete without yanking NORMAL" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Delete without yanking VISUAL" })
-- paste no yank
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste without yanking ALL" })
-- vertical move
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Vertical move down - cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Vertical move up - cursor centered" })
-- search results
vim.keymap.set("n", "J", "mzJ`z", { desc = "Append line to above, remainin on line" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next result - cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search previous result - cursor centered" })
-- Q no go
vim.keymap.set("n", "Q", "<nop>", { desc = "Disables Q" })
-- Format
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end,{ desc = "Format buffer" })
-- quicklist
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Quicklist Next" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Quicklist Previous" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Placeholder" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Placeholder" })
-- replace word
vim.keymap.set("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "[r]eplace all instances of word under cursor" })
-- yank to system clip windows uses * linux +
vim.keymap.set("n", "<leader>y", "\"*y", { desc = "Yank to system clipboard - NORMAL" })
vim.keymap.set("v", "<leader>y", "\"*y", { desc = "Yank to system clipboard - VISUAL" })
vim.keymap.set("n", "<leader>Y", "\"*Y", { desc = "Yank line to system clipboard - NORMAL" })
-- split
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split view vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split view horizontally" })
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "[d]iagnostics next item" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "[d]iagnostics previous item" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Diagnostics open float" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Placeholder" })
-- Bracket/quote completion
vim.keymap.set('i', '(<CR>', '(<CR>)<C-o>O')
vim.keymap.set('i', '{<CR>', '{<CR>}<C-o>O')
vim.keymap.set('i', '[<CR>', '[<CR>]<C-o>O')
vim.keymap.set('i', '"', '""<Esc>ha')
vim.keymap.set('i', "'", "''<Esc>ha")
vim.keymap.set('i', '`', '``<Esc>ha')
-- Markdown Viewer
vim.keymap.set("n", "<leader>mdp", "<Plug>MarkdownPreviewToggle>", { desc = "Toggle [m]ark[d]own [p]review" })
