return {
  "tamago324/nlsp-settings.nvim",
  event = "VeryLazy",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("nlspsettings").setup({
      -- 配置文件路径设置
      config_home = vim.fn.stdpath("config") .. "/nlsp-settings", -- 配置存储目录
      local_settings_dir = ".nlsp-settings", -- 项目本地设置目录
      global_settings_dir = "nlsp-settings", -- 全局设置目录

      -- 配置文件扩展名
      filetype_jsonc = true, -- 使用 jsonc 格式(带注释的 JSON)
      ignored_servers = {}, -- 要忽略的 LSP 服务器列表

      -- 自动命令设置
      automatic_setup = true, -- 自动设置 LSP 配置
      automatic_server_setup = {}, -- 指定哪些服务器自动设置
      append_default_schemas = true, -- 追加默认 schema
      validate_on_save = true, -- 保存时验证配置

      -- 性能设置
      debounce = 500, -- 防抖延迟(ms)
      max_workers = 4, -- 最大工作线程数

      -- 通知设置
      notify = {
        enable = true, -- 启用通知
        timeout = 5000, -- 通知超时时间(ms)
        log_level = vim.log.levels.INFO, -- 日志级别
      },

      -- 模式设置
      mode = "global", -- "global", "local", "mixed"
    })

    -- 可选: 为特定语言服务器设置覆盖
    local nlspsettings = require("nlspsettings")
    nlspsettings.setup({
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
          },
        },
      },
    })
  end,
}
