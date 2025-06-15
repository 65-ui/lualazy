return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("inc_rename").setup({
      -- 预览窗口设置
      preview_empty_name = false, -- 空名称时不显示预览
      preview_height = 0.33, -- 预览窗口高度比例
      preview_width = 0.5, -- 预览窗口宽度比例
      preview_position = "right", -- 或 "bottom"

      -- 高亮设置
      highlight = "IncSearch", -- 使用的高亮组
      highlight_group = "Substitute", -- 替换文本的高亮组

      -- 性能设置
      buffer_updates = true, -- 启用缓冲区更新
      post_hook = nil, -- 重命名完成后执行的回调函数

      -- 窗口样式
      border = "rounded", -- 窗口边框样式
      padding = 1, -- 窗口内边距
      winblend = 10, -- 窗口透明度

      -- 虚拟文本设置
      virt_text = true, -- 显示虚拟文本
      virt_text_pos = "eol", -- 虚拟文本位置
      virt_text_highlight = "Comment", -- 虚拟文本高亮组
    })
  end,
}
