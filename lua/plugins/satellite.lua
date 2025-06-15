-- lua/plugins/satellite.lua
return {
  "lewis6991/satellite.nvim",
  event = "VeryLazy",
  opts = {
    width = 2,
    handlers = {
      cursor = { symbols = { "▁", "▂", "▃", "▄" } }, -- 自定义光标标记形状
      gitsigns = { signs = { add = "▎", change = "▎", delete = "▁" } },
      diagnostic = { min_severity = vim.diagnostic.severity.WARN }, -- 仅显示警告及以上错误
    },
  },
  init = function()
    vim.g.satellite_enabled = true -- 默认启用
  end,
}
