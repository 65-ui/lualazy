-- lua/plugins/folding.lua
return {
  -- fold-cycle.nvim
  {
    "jghauser/fold-cycle.nvim",
    keys = {
      {
        "<Tab>",
        function()
          require("fold-cycle").open()
        end,
        desc = "Fold-cycle: Open",
      },
      {
        "<S-Tab>",
        function()
          require("fold-cycle").close()
        end,
        desc = "Fold-cycle: Close",
      },
    },
    config = true, -- 使用默认配置
  },
  -- 可选：nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = { foldlevel = 99 },
  },
}
