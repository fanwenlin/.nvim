-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- 设置 LanguageClient-neovim 的选项
vim.g.LanguageClient_serverCommands = {
  go = { "gopls" },
}

-- 在打开 Go 文件时，自动启动 LanguageClient-neovim
-- vim.api.nvim_exec(
--   [[
--     autocmd FileType go lua require('vim.lsp.buf').attach_client(vim.fn.bufnr(), 'gopls')
--     autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
-- ]],
--   false
--)
