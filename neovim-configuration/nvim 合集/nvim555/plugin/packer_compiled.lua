-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/menghuan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/menghuan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/menghuan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/menghuan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/menghuan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    after_files = { "/home/menghuan/.local/share/nvim/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { "                        require('configure/plugins/nv_comment').load()\n                        require('configure/plugins/nv_comment').after()\n                        " },
    keys = { { "", "gb" }, { "", "gc" } },
    load_after = {
      ["nvim-ts-context-commentstring"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["aerial.nvim"] = {
    after = { "nvim-lsp-installer" },
    config = { "                        require('configure/plugins/nv_aerial').load()\n                        require('configure/plugins/nv_aerial').after()\n                        " },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "                        require('configure/plugins/nv_bufferline').load()\n                        require('configure/plugins/nv_bufferline').after()\n                        " },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    cond = { true },
    config = { "                        require('configure/plugins/nv_catppuccin').load()\n                        require('configure/plugins/nv_catppuccin').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/catppuccin",
    url = "https://github.com/askfiy/catppuccin"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/menghuan/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/menghuan/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after = { "nvim-lsp-installer" },
    after_files = { "/home/menghuan/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/menghuan/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    after_files = { "/home/menghuan/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.vim" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["copilot.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fidget.nvim"] = {
    config = { "                        require('configure/plugins/nv_fidget').load()\n                        require('configure/plugins/nv_fidget').after()\n                        " },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    after = { "vim-vsnip" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["github-nvim-theme"] = {
    cond = { false },
    config = { "                        require('configure/plugins/nv_github-nvim-theme').load()\n                        require('configure/plugins/nv_github-nvim-theme').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    after = { "lualine.nvim" },
    config = { "                        require('configure/plugins/nv_gitsigns').load()\n                        require('configure/plugins/nv_gitsigns').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" },
    config = { "                        require('configure/plugins/nv_hop').load()\n                        require('configure/plugins/nv_hop').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    after = { "plenary.nvim", "sqlite.lua", "nvim-web-devicons", "nvim-lspconfig", "persisted.nvim" },
    config = { "                        require('configure/plugins/nv_impatient').load()\n                        require('configure/plugins/nv_impatient').after()\n                        " },
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "                        require('configure/plugins/nv_indent-blankline').load()\n                        require('configure/plugins/nv_indent-blankline').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lua-dev.nvim"] = {
    after = { "nvim-lsp-installer" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "                        require('configure/plugins/nv_lualine').load()\n                        require('configure/plugins/nv_lualine').after()\n                        " },
    load_after = {
      ["gitsigns.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mkdir.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/mkdir.nvim",
    url = "https://github.com/jghauser/mkdir.nvim"
  },
  ["null-ls.nvim"] = {
    after = { "nvim-lsp-installer" },
    config = { "                        require('configure/plugins/nv_null-ls').load()\n                        require('configure/plugins/nv_null-ls').after()\n                        " },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "                        require('configure/plugins/nv_nvim-autopairs').load()\n                        require('configure/plugins/nv_nvim-autopairs').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-cmdline", "vim-dadbod-completion", "cmp-vsnip", "cmp-path" },
    config = { "                        require('configure/plugins/nv_nvim-cmp').load()\n                        require('configure/plugins/nv_nvim-cmp').after()\n                        " },
    load_after = {
      ["vim-vsnip"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "                        require('configure/plugins/nv_nvim-colorizer').load()\n                        require('configure/plugins/nv_nvim-colorizer').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-virtual-text", "nvim-dap-ui" },
    config = { "                        require('configure/plugins/nv_nvim-dap').load()\n                        require('configure/plugins/nv_nvim-dap').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "                        require('configure/plugins/nv_nvim-dap-ui').load()\n                        require('configure/plugins/nv_nvim-dap-ui').after()\n                        " },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "                        require('configure/plugins/nv_nvim-dap-virtual-text').load()\n                        require('configure/plugins/nv_nvim-dap-virtual-text').after()\n                        " },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-hlslens"] = {
    config = { "                        require('configure/plugins/nv_nvim-hlslens').load()\n                        require('configure/plugins/nv_nvim-hlslens').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lastplace"] = {
    config = { "                        require('configure/plugins/nv_nvim-lastplace').load()\n                        require('configure/plugins/nv_nvim-lastplace').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lightbulb"] = {
    config = { "                        require('configure/plugins/nv_nvim-lightbulb').load()\n                        require('configure/plugins/nv_nvim-lightbulb').after()\n                        " },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    after = { "nvim-lightbulb", "fidget.nvim" },
    config = { "                        require('configure/plugins/nv_nvim-lsp-installer').load()\n                        require('configure/plugins/nv_nvim-lsp-installer').after()\n                        " },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "cmp-nvim-lsp", "aerial.nvim", "lua-dev.nvim", "null-ls.nvim", "nvim-lsp-installer" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-markdown-preview"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-markdown-preview",
    url = "https://github.com/davidgranstrom/nvim-markdown-preview"
  },
  ["nvim-neoclip.lua"] = {
    config = { "                        require('configure/plugins/nv_nvim-neoclip').load()\n                        require('configure/plugins/nv_nvim-neoclip').after()\n                        " },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "                        require('configure/plugins/nv_nvim-notify').load()\n                        require('configure/plugins/nv_nvim-notify').after()\n                        " },
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-picgo"] = {
    config = { "                        require('configure/plugins/nv_nvim-picgo').load()\n                        require('configure/plugins/nv_nvim-picgo').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-picgo",
    url = "https://github.com/askfiy/nvim-picgo"
  },
  ["nvim-scrollview"] = {
    config = { "                        require('configure/plugins/nv_nvim-scrollview').load()\n                        require('configure/plugins/nv_nvim-scrollview').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-spectre"] = {
    config = { "                        require('configure/plugins/nv_nvim-spectre').load()\n                        require('configure/plugins/nv_nvim-spectre').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-spectre",
    url = "https://github.com/nvim-pack/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = { "                        require('configure/plugins/nv_nvim-tree').load()\n                        require('configure/plugins/nv_nvim-tree').after()\n                        " },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-context-commentstring", "nvim-ts-rainbow", "nvim-ts-autotag", "spellsitter.nvim" },
    config = { "                        require('configure/plugins/nv_nvim-treesitter').load()\n                        require('configure/plugins/nv_nvim-treesitter').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    after = { "Comment.nvim" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    after = { "lualine.nvim", "nvim-tree.lua", "bufferline.nvim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persisted.nvim"] = {
    config = { "                        require('configure/plugins/nv_persisted').load()\n                        require('configure/plugins/nv_persisted').after()\n                        " },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/persisted.nvim",
    url = "https://github.com/olimorris/persisted.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "                        require('configure/plugins/nv_spellsitter').load()\n                        require('configure/plugins/nv_spellsitter').after()\n                        " },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["sqlite.lua"] = {
    after = { "nvim-neoclip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["surround.nvim"] = {
    config = { "                        require('configure/plugins/nv_surround').load()\n                        require('configure/plugins/nv_surround').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/surround.nvim",
    url = "https://github.com/ur4ltz/surround.nvim"
  },
  ["switch.vim"] = {
    commands = { "Switch" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/switch.vim",
    url = "https://github.com/AndrewRadev/switch.vim"
  },
  ["telescope.nvim"] = {
    after = { "vimcdoc" },
    config = { "                        require('configure/plugins/nv_telescope').load()\n                        require('configure/plugins/nv_telescope').after()\n                        " },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "                        require('configure/plugins/nv_todo-comments').load()\n                        require('configure/plugins/nv_todo-comments').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "                        require('configure/plugins/nv_toggleterm').load()\n                        require('configure/plugins/nv_toggleterm').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["translate.nvim"] = {
    commands = { "Translate" },
    config = { "                        require('configure/plugins/nv_translate').load()\n                        require('configure/plugins/nv_translate').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/translate.nvim",
    url = "https://github.com/uga-rosa/translate.nvim"
  },
  undotree = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["venn.nvim"] = {
    config = { "                        require('configure/plugins/nv_venn').load()\n                        require('configure/plugins/nv_venn').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/venn.nvim",
    url = "https://github.com/jbyuki/venn.nvim"
  },
  ["vim-carbon-now-sh"] = {
    commands = { "CarbonNowSh" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-carbon-now-sh",
    url = "https://github.com/kristijanhusak/vim-carbon-now-sh"
  },
  ["vim-dadbod"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    after_files = { "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion/after/plugin/vim_dadbod_completion.lua", "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion/after/plugin/vim_dadbod_completion.vim" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion",
    url = "https://github.com/kristijanhusak/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUIToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-illuminate"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-repeat"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-visual-multi"] = {
    keys = { { "", "<c-n>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    after = { "nvim-cmp" },
    load_after = {
      ["friendly-snippets"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimcdoc = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vimcdoc",
    url = "https://github.com/yianwillis/vimcdoc"
  },
  ["vscode.nvim"] = {
    cond = { false },
    config = { "                        require('configure/plugins/nv_vscode').load()\n                        require('configure/plugins/nv_vscode').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  },
  ["which-key.nvim"] = {
    config = { "                        require('configure/plugins/nv_which-key').load()\n                        require('configure/plugins/nv_which-key').after()\n                        " },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/menghuan/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^dap"] = "nvim-dap",
  ["^hlslens"] = "nvim-hlslens",
  ["^hop"] = "hop.nvim",
  ["^nvim%-picgo"] = "nvim-picgo",
  ["^spectre"] = "nvim-spectre",
  ["^telescope"] = "telescope.nvim",
  ["^toggleterm"] = "toggleterm.nvim",
  ["^venn"] = "venn.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: vim-carbon-now-sh
time([[Setup for vim-carbon-now-sh]], true)
require('configure/plugins/nv_vim-carbon-now-sh').entrance()
time([[Setup for vim-carbon-now-sh]], false)
-- Setup for: nvim-neoclip.lua
time([[Setup for nvim-neoclip.lua]], true)
require('configure/plugins/nv_nvim-neoclip').before()
time([[Setup for nvim-neoclip.lua]], false)
-- Setup for: nvim-picgo
time([[Setup for nvim-picgo]], true)
require('configure/plugins/nv_nvim-picgo').before()
time([[Setup for nvim-picgo]], false)
-- Setup for: nvim-notify
time([[Setup for nvim-notify]], true)
require('configure/plugins/nv_nvim-notify').before()
time([[Setup for nvim-notify]], false)
time([[packadd for nvim-notify]], true)
vim.cmd [[packadd nvim-notify]]
time([[packadd for nvim-notify]], false)
-- Setup for: nvim-treesitter
time([[Setup for nvim-treesitter]], true)
require('configure/plugins/nv_nvim-treesitter').before()
time([[Setup for nvim-treesitter]], false)
-- Setup for: github-nvim-theme
time([[Setup for github-nvim-theme]], true)
require('configure/plugins/nv_github-nvim-theme').before()
time([[Setup for github-nvim-theme]], false)
-- Setup for: nvim-scrollview
time([[Setup for nvim-scrollview]], true)
require('configure/plugins/nv_nvim-scrollview').before()
time([[Setup for nvim-scrollview]], false)
-- Setup for: vim-dadbod-ui
time([[Setup for vim-dadbod-ui]], true)
require('configure/plugins/nv_vim-dadbod-ui').entrance()
time([[Setup for vim-dadbod-ui]], false)
-- Setup for: hop.nvim
time([[Setup for hop.nvim]], true)
require('configure/plugins/nv_hop').before()
time([[Setup for hop.nvim]], false)
-- Setup for: vim-illuminate
time([[Setup for vim-illuminate]], true)
require('configure/plugins/nv_vim-illuminate').entrance()
time([[Setup for vim-illuminate]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
require('configure/plugins/nv_telescope').before()
time([[Setup for telescope.nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
require('configure/plugins/nv_nvim-tree').before()
time([[Setup for nvim-tree.lua]], false)
-- Setup for: catppuccin
time([[Setup for catppuccin]], true)
require('configure/plugins/nv_catppuccin').before()
time([[Setup for catppuccin]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
require('configure/plugins/nv_indent-blankline').before()
time([[Setup for indent-blankline.nvim]], false)
-- Setup for: aerial.nvim
time([[Setup for aerial.nvim]], true)
require('configure/plugins/nv_aerial').before()
time([[Setup for aerial.nvim]], false)
-- Setup for: fidget.nvim
time([[Setup for fidget.nvim]], true)
require('configure/plugins/nv_fidget').before()
time([[Setup for fidget.nvim]], false)
-- Setup for: null-ls.nvim
time([[Setup for null-ls.nvim]], true)
require('configure/plugins/nv_null-ls').before()
time([[Setup for null-ls.nvim]], false)
-- Setup for: nvim-autopairs
time([[Setup for nvim-autopairs]], true)
require('configure/plugins/nv_nvim-autopairs').before()
time([[Setup for nvim-autopairs]], false)
-- Setup for: nvim-lsp-installer
time([[Setup for nvim-lsp-installer]], true)
require('configure/plugins/nv_nvim-lsp-installer').before()
time([[Setup for nvim-lsp-installer]], false)
-- Setup for: nvim-colorizer.lua
time([[Setup for nvim-colorizer.lua]], true)
require('configure/plugins/nv_nvim-colorizer').before()
time([[Setup for nvim-colorizer.lua]], false)
-- Setup for: emmet-vim
time([[Setup for emmet-vim]], true)
require('configure/plugins/nv_emmet-vim').entrance()
time([[Setup for emmet-vim]], false)
-- Setup for: spellsitter.nvim
time([[Setup for spellsitter.nvim]], true)
require('configure/plugins/nv_spellsitter').before()
time([[Setup for spellsitter.nvim]], false)
-- Setup for: nvim-lastplace
time([[Setup for nvim-lastplace]], true)
require('configure/plugins/nv_nvim-lastplace').before()
time([[Setup for nvim-lastplace]], false)
-- Setup for: vim-visual-multi
time([[Setup for vim-visual-multi]], true)
require('configure/plugins/nv_vim-visual-multi').entrance()
time([[Setup for vim-visual-multi]], false)
-- Setup for: nvim-dap-virtual-text
time([[Setup for nvim-dap-virtual-text]], true)
require('configure/plugins/nv_nvim-dap-virtual-text').before()
time([[Setup for nvim-dap-virtual-text]], false)
-- Setup for: surround.nvim
time([[Setup for surround.nvim]], true)
require('configure/plugins/nv_surround').before()
time([[Setup for surround.nvim]], false)
-- Setup for: vim-vsnip
time([[Setup for vim-vsnip]], true)
require('configure/plugins/nv_vim-vsnip').entrance()
time([[Setup for vim-vsnip]], false)
-- Setup for: nvim-dap-ui
time([[Setup for nvim-dap-ui]], true)
require('configure/plugins/nv_nvim-dap-ui').before()
time([[Setup for nvim-dap-ui]], false)
-- Setup for: nvim-cmp
time([[Setup for nvim-cmp]], true)
require('configure/plugins/nv_nvim-cmp').before()
time([[Setup for nvim-cmp]], false)
-- Setup for: nvim-dap
time([[Setup for nvim-dap]], true)
require('configure/plugins/nv_nvim-dap').before()
time([[Setup for nvim-dap]], false)
-- Setup for: vscode.nvim
time([[Setup for vscode.nvim]], true)
require('configure/plugins/nv_vscode').before()
time([[Setup for vscode.nvim]], false)
-- Setup for: impatient.nvim
time([[Setup for impatient.nvim]], true)
require('configure/plugins/nv_impatient').before()
time([[Setup for impatient.nvim]], false)
time([[packadd for impatient.nvim]], true)
vim.cmd [[packadd impatient.nvim]]
time([[packadd for impatient.nvim]], false)
-- Setup for: persisted.nvim
time([[Setup for persisted.nvim]], true)
require('configure/plugins/nv_persisted').before()
time([[Setup for persisted.nvim]], false)
-- Setup for: which-key.nvim
time([[Setup for which-key.nvim]], true)
require('configure/plugins/nv_which-key').before()
time([[Setup for which-key.nvim]], false)
-- Setup for: nvim-hlslens
time([[Setup for nvim-hlslens]], true)
require('configure/plugins/nv_nvim-hlslens').before()
time([[Setup for nvim-hlslens]], false)
-- Setup for: Comment.nvim
time([[Setup for Comment.nvim]], true)
require('configure/plugins/nv_comment').before()
time([[Setup for Comment.nvim]], false)
-- Setup for: switch.vim
time([[Setup for switch.vim]], true)
require('configure/plugins/nv_switch').entrance()
time([[Setup for switch.vim]], false)
-- Setup for: toggleterm.nvim
time([[Setup for toggleterm.nvim]], true)
require('configure/plugins/nv_toggleterm').before()
time([[Setup for toggleterm.nvim]], false)
-- Setup for: nvim-spectre
time([[Setup for nvim-spectre]], true)
require('configure/plugins/nv_nvim-spectre').before()
time([[Setup for nvim-spectre]], false)
-- Setup for: todo-comments.nvim
time([[Setup for todo-comments.nvim]], true)
require('configure/plugins/nv_todo-comments').before()
time([[Setup for todo-comments.nvim]], false)
-- Setup for: translate.nvim
time([[Setup for translate.nvim]], true)
require('configure/plugins/nv_translate').before()
time([[Setup for translate.nvim]], false)
-- Setup for: copilot.vim
time([[Setup for copilot.vim]], true)
require('configure/plugins/nv_copilot').entrance()
time([[Setup for copilot.vim]], false)
-- Setup for: gitsigns.nvim
time([[Setup for gitsigns.nvim]], true)
require('configure/plugins/nv_gitsigns').before()
time([[Setup for gitsigns.nvim]], false)
-- Setup for: undotree
time([[Setup for undotree]], true)
require('configure/plugins/nv_undotree').entrance()
time([[Setup for undotree]], false)
-- Setup for: bufferline.nvim
time([[Setup for bufferline.nvim]], true)
require('configure/plugins/nv_bufferline').before()
time([[Setup for bufferline.nvim]], false)
-- Setup for: nvim-lightbulb
time([[Setup for nvim-lightbulb]], true)
require('configure/plugins/nv_nvim-lightbulb').before()
time([[Setup for nvim-lightbulb]], false)
-- Setup for: venn.nvim
time([[Setup for venn.nvim]], true)
require('configure/plugins/nv_venn').before()
time([[Setup for venn.nvim]], false)
-- Setup for: nvim-markdown-preview
time([[Setup for nvim-markdown-preview]], true)
require('configure/plugins/nv_nvim-markdown-preview').entrance()
time([[Setup for nvim-markdown-preview]], false)
-- Setup for: lualine.nvim
time([[Setup for lualine.nvim]], true)
require('configure/plugins/nv_lualine').before()
time([[Setup for lualine.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
                        require('configure/plugins/nv_nvim-notify').load()
                        require('configure/plugins/nv_nvim-notify').after()
                        
time([[Config for nvim-notify]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
                        require('configure/plugins/nv_impatient').load()
                        require('configure/plugins/nv_impatient').after()
                        
time([[Config for impatient.nvim]], false)
-- Conditional loads
time([[Conditional loading of github-nvim-theme]], true)
  require("packer.load")({"github-nvim-theme"}, {}, _G.packer_plugins)
time([[Conditional loading of github-nvim-theme]], false)
time([[Conditional loading of vscode.nvim]], true)
  require("packer.load")({"vscode.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of vscode.nvim]], false)
time([[Conditional loading of catppuccin]], true)
  require("packer.load")({"catppuccin"}, {}, _G.packer_plugins)
time([[Conditional loading of catppuccin]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd plenary.nvim ]]
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd bufferline.nvim ]]

-- Config for: bufferline.nvim
                        require('configure/plugins/nv_bufferline').load()
                        require('configure/plugins/nv_bufferline').after()
                        

vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd null-ls.nvim ]]

-- Config for: null-ls.nvim
                        require('configure/plugins/nv_null-ls').load()
                        require('configure/plugins/nv_null-ls').after()
                        

vim.cmd [[ packadd aerial.nvim ]]

-- Config for: aerial.nvim
                        require('configure/plugins/nv_aerial').load()
                        require('configure/plugins/nv_aerial').after()
                        

vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd lua-dev.nvim ]]
vim.cmd [[ packadd nvim-lsp-installer ]]

-- Config for: nvim-lsp-installer
                        require('configure/plugins/nv_nvim-lsp-installer').load()
                        require('configure/plugins/nv_nvim-lsp-installer').after()
                        

vim.cmd [[ packadd fidget.nvim ]]

-- Config for: fidget.nvim
                        require('configure/plugins/nv_fidget').load()
                        require('configure/plugins/nv_fidget').after()
                        

vim.cmd [[ packadd nvim-lightbulb ]]

-- Config for: nvim-lightbulb
                        require('configure/plugins/nv_nvim-lightbulb').load()
                        require('configure/plugins/nv_nvim-lightbulb').after()
                        

vim.cmd [[ packadd persisted.nvim ]]

-- Config for: persisted.nvim
                        require('configure/plugins/nv_persisted').load()
                        require('configure/plugins/nv_persisted').after()
                        

vim.cmd [[ packadd sqlite.lua ]]
vim.cmd [[ packadd nvim-neoclip.lua ]]

-- Config for: nvim-neoclip.lua
                        require('configure/plugins/nv_nvim-neoclip').load()
                        require('configure/plugins/nv_nvim-neoclip').after()
                        

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'nvim-markdown-preview'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Switch lua require("packer.load")({'switch.vim'}, { cmd = "Switch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Translate lua require("packer.load")({'translate.nvim'}, { cmd = "Translate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CarbonNowSh lua require("packer.load")({'vim-carbon-now-sh'}, { cmd = "CarbonNowSh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopLine lua require("packer.load")({'hop.nvim'}, { cmd = "HopLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopChar1 lua require("packer.load")({'hop.nvim'}, { cmd = "HopChar1", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIToggle lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopChar1CurrentLine lua require("packer.load")({'hop.nvim'}, { cmd = "HopChar1CurrentLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-n> <cmd>lua require("packer.load")({'vim-visual-multi'}, { keys = "<lt>c-n>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gb <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gb", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'nvim-markdown-preview'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'emmet-vim'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'emmet-vim'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'emmet-vim'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType py ++once lua require("packer.load")({'vim-python-pep8-indent'}, { ft = "py" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-treesitter', 'indent-blankline.nvim', 'nvim-scrollview', 'gitsigns.nvim', 'todo-comments.nvim', 'surround.nvim', 'which-key.nvim', 'nvim-lastplace', 'undotree', 'vim-illuminate'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-treesitter', 'indent-blankline.nvim', 'nvim-colorizer.lua', 'nvim-scrollview', 'gitsigns.nvim', 'todo-comments.nvim', 'surround.nvim', 'which-key.nvim', 'undotree', 'vim-illuminate'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'mkdir.nvim', 'nvim-hlslens', 'friendly-snippets', 'vimcdoc'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs', 'friendly-snippets', 'copilot.vim', 'vim-python-pep8-indent'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-colorizer.lua'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
  -- Function lazy-loads
time([[Defining lazy-load function autocommands]], true)
vim.cmd[[au FuncUndefined db#resolve ++once lua require("packer.load")({'vim-dadbod'}, {}, _G.packer_plugins)]]
vim.cmd[[au FuncUndefined switch#Switch ++once lua require("packer.load")({'switch.vim'}, {}, _G.packer_plugins)]]
vim.cmd[[au FuncUndefined vm#commands#add_cursor_up ++once lua require("packer.load")({'vim-visual-multi'}, {}, _G.packer_plugins)]]
vim.cmd[[au FuncUndefined vm#commands#add_cursor_down ++once lua require("packer.load")({'vim-visual-multi'}, {}, _G.packer_plugins)]]
vim.cmd[[au FuncUndefined repeat#set ++once lua require("packer.load")({'vim-repeat'}, {}, _G.packer_plugins)]]
time([[Defining lazy-load function autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
