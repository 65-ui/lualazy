-- lua/plugins/colorizer.lua
return {
  "catgoose/nvim-colorizer.lua", -- 插件地址
  config = function() -- 插件配置
    require("colorizer").setup({
      filetypes = { "*", "!prompt" }, -- 启用高亮的文件类型（'*' 表示所有文件）
      user_default_options = {
        RGB = true, -- 支持 #RGB 格式
        RRGGBB = true, -- 支持 #RRGGBB 格式
        RRGGBBAA = true, -- 支持 #RRGGBBAA 格式
        names = true, -- 支持颜色名称（如 "Red", "Blue"）
        css = true, -- 启用 CSS 功能
        css_fn = true, -- 启用 CSS 函数（如 `rgba()`）
      },
      hooks = nil, -- 可以定义额外的自定义行为
    })
  end,
}
