-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- 示例：添加自定义键位映射
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 快速保存
keymap("n", "W", "<cmd>w<cr>", opts)

-- 快速退出
keymap("n", "Q", "<cmd>q<cr>", opts)

vim.cmd([[
  set autochdir
  set exrc
  set secure
]])

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Tab/indentation settings
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true

-- Whitespace visualization
vim.opt.list = true
vim.opt.listchars = { tab = "| ", trail = "▫" }

-- Scrolling
vim.opt.scrolloff = 4

-- Timeouts
vim.opt.ttimeoutlen = 0
vim.opt.timeout = false

-- View options
vim.opt.viewoptions = "cursor,folds,slash,unix"

-- Wrapping
vim.opt.wrap = true
vim.opt.textwidth = 0

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Formatting
vim.opt.formatoptions:remove("tc")

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- UI
vim.opt.showmode = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Completion
vim.opt.shortmess:append("c")
vim.opt.inccommand = "split"
vim.opt.completeopt = { "longest", "menuone", "noselect", "preview", "noinsert" }

-- Performance
vim.opt.lazyredraw = true

-- Visual bell
vim.opt.visualbell = true

-- 导航差异块
-- 导航差异块
-- vim.keymap.set("n", "]c", function()
--   if vim.wo.diff then
--     return "]c"
--   end
--   vim.schedule(function()
--     require("signup").next_hunk()
--   end)
--   return "<Ignore>"
-- end, { expr = true, desc = "Next hunk" })
--
-- vim.keymap.set("n", "[c", function()
--   if vim.wo.diff then
--     return "[c"
--   end
--   vim.schedule(function()
--     require("signup").prev_hunk()
--   end)
--   return "<Ignore>"
-- end, { expr = true, desc = "Previous hunk" })
--
-- -- 操作差异块
-- vim.keymap.set("n", "<leader>hs", require("signup").stage_hunk, { desc = "Stage hunk" })
-- vim.keymap.set("n", "<leader>hr", require("signup").reset_hunk, { desc = "Reset hunk" })
-- vim.keymap.set("v", "<leader>hs", function()
--   require("signup").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
-- end, { desc = "Stage selection" })
-- vim.keymap.set("v", "<leader>hr", function()
--   require("signup").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
-- end, { desc = "Reset selection" })
-- vim.keymap.set("n", "<leader>hS", require("signup").stage_buffer, { desc = "Stage buffer" })
-- vim.keymap.set("n", "<leader>hu", require("signup").undo_stage_hunk, { desc = "Undo stage hunk" })
-- vim.keymap.set("n", "<leader>hR", require("signup").reset_buffer, { desc = "Reset buffer" })
-- vim.keymap.set("n", "<leader>hp", require("signup").preview_hunk, { desc = "Preview hunk" })
-- vim.keymap.set("n", "<leader>hb", function()
--   require("signup").blame_line({ full = true })
-- end, { desc = "Blame line" })
-- vim.keymap.set("n", "<leader>hd", require("signup").diffthis, { desc = "Diff this" })
-- vim.keymap.set("n", "<leader>hD", function()
--   require("signup").diffthis("~")
-- end, { desc = "Diff this (cached)" })

-- 切换签名帮助
vim.keymap.set({ "i", "n" }, "<M-s>", function()
  require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true, desc = "Toggle signature help" })

-- 手动触发签名帮助
vim.keymap.set("i", "<C-k>", function()
  require("lsp_signature").signature()
end, { silent = true, noremap = true, desc = "Trigger signature help" })

-- 增量重命名
vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true, desc = "Incremental rename" })

-- 带确认的重命名
vim.keymap.set("n", "<leader>rN", function()
  require("inc_rename").inc_rename({
    input_buffer = false, -- 禁用输入缓冲
    preview = true, -- 启用预览
  })
end, { desc = "Rename with preview" })

-- 主键映射
vim.keymap.set("n", "<leader>nb", function()
  require("nvim-navbuddy").open()
end, { desc = "Open Navbuddy" })

-- 窗口内键映射 (已在配置中定义，这里可覆盖)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "navbuddy",
  callback = function()
    vim.keymap.set("n", "f", function()
      require("nvim-navbuddy").filter()
    end, { buffer = true, desc = "Filter symbols" })
  end,
})

-- 打开 LSP 设置
vim.keymap.set("n", "<leader>ls", function()
  require("telescope").extensions.nlsp_settings.nlsp_settings()
end, { desc = "Search LSP settings" })

-- 编辑当前 LSP 设置
vim.keymap.set("n", "<leader>le", function()
  local ft = vim.bo.filetype
  local clients = vim.lsp.get_active_clients({ name = nil, bufnr = 0 })
  if #clients > 0 then
    local client = clients[1]
    local path = require("nlspsettings").get_settings_path(client.name)
    vim.cmd("edit " .. path)
  else
    vim.notify("No active LSP client for this buffer", vim.log.levels.WARN)
  end
end, { desc = "Edit LSP settings" })

-- lua/config/keymaps.lua
vim.keymap.set("n", "<leader>fj", function()
  vim.lsp.buf.format({
    async = true,
    filter = function(client)
      return client.name == "jsonls"
    end,
  })
end, { desc = "Format JSON" })

vim.keymap.set("n", "<leader>vj", function()
  require("telescope.builtin").diagnostics({ bufnr = 0 })
end, { desc = "View JSON diagnostics" })

-- ~/.config/nvim/lua/config/keymaps.lua
-- 添加快捷键绑定
local map = vim.keymap.set

-- 打开 "Todo" 列表窗口
map("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find TODOs" })

-- 快速跳转到下一个 TODO 注释
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next TODO" })

-- 快速跳转到上一个 TODO 注释
map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous TODO" })
