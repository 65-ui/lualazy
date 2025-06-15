-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- 在init.lua中添加（如果已经存在lazy.setup，则在里面添加import）
require("lazy").setup({
  -- 导入其他配置...
  { import = "plugins.markdown" },
  -- 其他插件...
})

-- 禁用注释的斜体
vim.cmd([[ highlight Comment gui=NONE cterm=NONE ]])
-- 禁用其他可能倾斜的语法组（如字符串、函数名）
vim.cmd([[ highlight String gui=NONE cterm=NONE ]])
