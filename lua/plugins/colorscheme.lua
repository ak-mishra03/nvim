require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
  },
})
vim.cmd.colorscheme("catppuccin")

