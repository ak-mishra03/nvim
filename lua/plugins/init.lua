-- lua/plugins/init.lua

-----------------------------------------------------------
-- Bootstrap lazy.nvim
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Plugin list
-----------------------------------------------------------
require("lazy").setup({
  spec = {
    -- Colorscheme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- File explorer
    { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
      dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" }
    },

    -- Syntax highlighting
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Fuzzy finder
    require("plugins.telescope"),

    -- Misc
    { "m4xshen/autoclose.nvim" },
    { "numToStr/Comment.nvim" },
    { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- LSP & Autocompletion
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "rafamadriz/friendly-snippets" },

    -- Presence
    { "andweeb/presence.nvim" },
  },

  install = { colorscheme = { "catppuccin", "habamax" } },
  checker = { enabled = true },
})
-----------------------------------------------------------
-- Load plugin configs
-----------------------------------------------------------
require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.neotree")
require("plugins.alpha")
require("plugins.autoclose")
require("plugins.comment")
require("plugins.cmp")
require("plugins.presence")
