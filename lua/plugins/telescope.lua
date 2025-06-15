-- 在 lua/plugins/telescope.lua 中添加
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "Dan7h3x/signup.nvim",
  },
  opts = {
    extensions = {
      signup = {
        -- 配置telescope-signup扩展
      },
    },
  },
  keys = {
    {
      "<leader>gc",
      function()
        require("telescope").extensions.signup.commits()
      end,
      desc = "Search commits",
    },
    {
      "<leader>gs",
      function()
        require("telescope").extensions.signup.signup()
      end,
      desc = "Search signup changes",
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("signup")
  end,
}
