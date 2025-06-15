-- ~/.config/nvim/lua/plugins/markdown.lua

return {
  -- Markdown预览插件 (浏览器预览)
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown预览开关" },
    },
    config = function()
      -- 设置Markdown预览插件
      vim.g.mkdp_auto_start = 0 -- 不自动开启预览
      vim.g.mkdp_auto_close = 1 -- 退出时自动关闭预览
      vim.g.mkdp_refresh_slow = 0 -- 实时刷新
      vim.g.mkdp_page_title = "「${name}」" -- 预览页面标题
      vim.g.mkdp_theme = "dark" -- 暗色主题
    end,
  },

  -- 终端内Markdown预览 (Glow)
  {
    "ellisonleao/glow.nvim",
    config = true,
    ft = "markdown",
    keys = {
      { "<leader>mg", "<cmd>Glow<cr>", desc = "终端内预览Markdown" },
    },
  },

  -- Markdown表格格式化
  {
    "dhruvasagar/vim-table-mode",
    ft = "markdown",
    keys = {
      { "<leader>mt", "<cmd>TableModeToggle<cr>", desc = "表格模式切换" },
    },
    config = function()
      vim.g.table_mode_corner = "|"
      vim.g.table_mode_header_fillchar = "-"
    end,
  },

  -- 代码块执行 (支持多种语言)
  {
    "jubnzv/mdeval.nvim",
    ft = "markdown",
    opts = {
      -- 配置需要执行的语言
      eval_options = {
        python = {
          command = "python",
          default_filetype = "python",
        },
        javascript = {
          command = "node",
          default_filetype = "javascript",
        },
        bash = {
          command = "bash",
        },
        lua = {
          command = "lua",
        },
      },
    },
    keys = {
      { "<leader>me", "<cmd>MdEval<cr>", desc = "执行当前代码块" },
      { "<leader>ma", "<cmd>MdEvalAll<cr>", desc = "执行所有代码块" },
    },
  },

  -- Markdown链接管理
  {
    "jakewvincent/mkdnflow.nvim",
    ft = "markdown",
    config = function()
      require("mkdnflow").setup({
        modules = {
          bib = false, -- 关闭bib引用支持
          buffers = true, -- 允许在笔记间跳转
          conceal = true, -- 隐藏链接格式
          links = {
            style = "markdown", -- 链接风格
          },
          mappings = {
            MkdnEnter = { { "i", "n", "v" }, "<CR>" }, -- Enter键创建链接
          },
        },
      })
    end,
    keys = {
      { "<leader>ml", "<cmd>MkdnCreateLink<cr>", desc = "创建链接" },
      { "<leader>mf", "<cmd>MkdnFollowLink<cr>", desc = "跳转链接" },
    },
  },

  -- 格式化插件 (prettier)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "prettier" },
      },
    },
  },

  -- Markdown树形导航 (目录)
  {
    "lukas-reineke/headlines.nvim",
    ft = "markdown",
    config = function()
      require("headlines").setup({
        markdown = {
          headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
          codeblock_highlight = "CodeBlock",
        },
      })
    end,
  },

  -- 自动生成目录
  {
    "mzlogin/vim-markdown-toc",
    ft = "markdown",
    keys = {
      { "<leader>mc", "<cmd>GenTocMarked<cr>", desc = "生成目录" },
      { "<leader>mu", "<cmd>UpdateToc<cr>", desc = "更新目录" },
    },
  },
}
--
-- 插件名称 功能描述 快捷键
-- markdown-preview.nvim 浏览器预览Markdown  <leader>mp
-- glow.nvim 终端内预览  <leader>mg
-- vim-table-mode 表格自动格式化  <leader>mt
-- mdeval.nvim 执行Markdown中的代码块  <leader>me  (当前代码块)   <leader>ma  (所有代码块)
-- mkdnflow.nvim 链接管理（创建、跳转）  <leader>ml  (创建链接)  <leader>mf  (跳转链接)
-- conform.nvim 使用Prettier格式化Markdown 保存时自动或手动格式化
-- headlines.nvim 高亮标题和代码块 无快捷键，自动高亮
-- vim-markdown-toc 生成和更新目录  <leader>mc  (生成目录)  <leader>mu  (更新目录)
