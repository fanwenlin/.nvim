-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys

  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Set Leader Key
-- map({ "i", "n" }, "\\", "<Leader>", { desc = "Leader" })

-- 将 gd 映射到跳转到定义
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- 将 gr 映射到查找引用
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>f', ':Ag! ""<left>', { noremap = true, silent = true })

