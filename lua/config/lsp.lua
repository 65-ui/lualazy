-- 在 lua/config/lsp.lua 中添加
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- 在 lua/config/lsp.lua 中添加
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  title = " Documentation ",
  title_pos = "left",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "ray-x/lsp_signature.nvim",
    -- 其他依赖...
  },
  opts = {
    -- 其他 LSP 配置...
    signature = {
      -- 可以在这里覆盖全局配置
      hint_enable = true,
      hint_prefix = "👉 ",
    },
  },
}


local on_attach = function(client, bufnr)
  -- 其他 LSP 配置...
 

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local config = ft_config[ft] or {}
    require("nvim-navbuddy").setup(config)
  end,
}) 
  -- 当 LSP 支持文档符号时启用 Navbuddy
  if client.supports_method("textDocument/documentSymbol") then
    vim.keymap.set("n", "<leader>nb", function()
      require("nvim-navbuddy").open(bufnr)
    end, { buffer = bufnr, desc = "Open Navbuddy" })
  end
end


local on_attach = function(client, bufnr)
  -- 其他 LSP 配置...
  
  -- 启用 nlsp-settings
  if client.config.settings then
    require("nlspsettings").update_settings(client.name, client.config.settings)
  end
end

require("lspconfig").util.default_config = vim.tbl_extend(
  "force",
  require("lspconfig").util.default_config,
  {
    -- 让 nlsp-settings 处理配置
    before_init = function(params)
      params.settings = require("nlspsettings").get_settings(params.name) or {}
    end,
  }
)

-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(), -- 自动加载 JSON Schema
            validate = { enable = true }, -- 启用验证
            format = { enable = true } -- 启用格式化
          }
        },
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        end
      }
    }
  }
}
-- 在 lsp.lua 的 jsonls 配置中添加
settings = {
  json = {
    schemas = {
      {
        fileMatch = { "myconfig*.json" },
        url = "https://example.com/my-schema.json"
      }
    }
  }
}
