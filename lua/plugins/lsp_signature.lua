return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    -- 基础设置
    bind = true, -- 绑定到 BufEnter 事件
    doc_lines = 10, -- 显示文档的最大行数
    max_height = 12, -- 浮动窗口最大高度
    max_width = 80, -- 浮动窗口最大宽度
    wrap = true, -- 允许长行自动换行
    floating_window = true, -- 使用浮动窗口
    floating_window_above_cur_line = true, -- 浮动窗口显示在当前行上方
    -- 浮动窗口样式
    floating_window_off_x = 1, -- X轴偏移
    floating_window_off_y = 0, -- Y轴偏移
    fix_pos = false, -- 固定浮动窗口位置
    hint_enable = true, -- 启用虚拟提示文本
    hint_prefix = "🐼 ", -- 提示前缀
    hint_scheme = "String", -- 提示高亮组
    hi_parameter = "LspSignatureActiveParameter", -- 当前参数高亮组
    -- 外观设置
    handler_opts = {
      border = "rounded", -- 浮动窗口边框样式: single, double, shadow, rounded
    },
    -- 触发设置
    always_trigger = false, -- 总是显示签名帮助
    auto_close_after = nil, -- 自动关闭延迟(ms)
    extra_trigger_chars = {}, -- 额外的触发字符
    zindex = 200, -- 浮动窗口z-index
    -- 调试设置
    debug = false, -- 启用调试
    log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- 日志路径
    -- 其他设置
    padding = "", -- 在签名周围添加空格
    shadow_blend = 36, -- 阴影混合度
    shadow_guibg = "Black", -- 阴影颜色
    timer_interval = 200, -- 定时器间隔(ms)
    toggle_key = "<M-x>", -- 切换签名帮助的快捷键
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)

    -- 可选: 自定义高亮组
    vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = "#FF9E3B", bold = true })
  end,
}
