-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- 如果autocmds.lua不存在则创建
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- 设置本地选项
    vim.opt_local.wrap = true -- 自动换行
    vim.opt_local.linebreak = true -- 在单词边界换行
    vim.opt_local.spell = true -- 开启拼写检查（英文）
    vim.opt_local.conceallevel = 2 -- 隐藏Markdown格式字符（如**粗体**）
  end,
})
