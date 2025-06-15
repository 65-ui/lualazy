return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    opts.preselect = cmp.PreselectMode.None -- 禁用自动选择
    opts.experimental = {
      ghost_text = false, -- 关闭虚拟文本提示
      native_menu = false, -- 避免原生菜单干扰
    }
  end,
}
