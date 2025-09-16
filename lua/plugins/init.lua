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
    { "nvim-telescope/telescope.nvim", tag = "0.1.8" },

    -- Misc
    { "m4xshen/autoclose.nvim" },
    { "numToStr/Comment.nvim" },
    { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- LSP & Autocompletion
    { "neovim/nvim-lspconfig" },       -- LSP client configs
    { "williamboman/mason.nvim" },     -- LSP/DAP/Linter installer
    { "williamboman/mason-lspconfig.nvim" }, -- Connect mason with lspconfig
    { "hrsh7th/nvim-cmp" },            -- Autocompletion engine
    { "hrsh7th/cmp-nvim-lsp" },        -- LSP completions
    { "hrsh7th/cmp-buffer" },          -- buffer words
    { "hrsh7th/cmp-path" },            -- filesystem paths
    { "hrsh7th/cmp-cmdline" },         -- cmdline completions
    { "L3MON4D3/LuaSnip" },            -- snippet engine
    { "saadparwaiz1/cmp_luasnip" },    -- integrate luasnip with cmp
    { "rafamadriz/friendly-snippets" }, -- a bunch of pre-made snippets

    --Presence for Discord
    {
      'andweeb/presence.nvim'
    }

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
