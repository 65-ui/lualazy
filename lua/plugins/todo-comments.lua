-- ~/.config/nvim/lua/plugins/todo-comments.lua
return {
  "folke/todo-comments.nvim", -- 插件地址
  dependencies = { "nvim-lua/plenary.nvim" }, -- 依赖项
  event = "BufReadPost", -- 自动加载条件：在读取文件后加载
  config = function() -- 插件配置
    require("todo-comments").setup({
      signs = true, -- 显示图标
      keywords = {
        TODO = { icon = " ", color = "info" }, -- 自定义关键字和颜色
        FIX = { icon = " ", color = "error" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning" },
        NOTE = { icon = " ", color = "hint" },
        PERF = { icon = " ", color = "default" },
        BUG = { icon = " ", color = "error", alt = { "ISSUE", "ERROR" } },
        QUESTION = { icon = " ", color = "hint" },
      },
      highlight = {
        before = "", -- 默认不高亮关键字之前的文本
        keyword = "wide", -- 高亮整个关键字
        after = "fg", -- 高亮关键字之后的文本
        pattern = [[.*<(KEYWORDS)\s*:]], -- 匹配注释的正则表达式
      },
      search = {
        command = "rg", -- 默认搜索工具（可以改为 "grep"）
        args = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column" },
        pattern = [[\b(KEYWORDS):]], -- 搜索关键字匹配规则
      },
    })
  end,
}
