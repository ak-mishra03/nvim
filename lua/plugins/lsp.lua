-- lua/plugins/lsp.lua

-- Mason setup
require("mason").setup()

-- Bridge mason with lspconfig
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",     -- Lua
    "pyright",    -- Python
    "jdtls",      -- Java
    "clangd",     -- C / C++
  },
  automatic_installation = true,
})

-- nvim-lspconfig
local lspconfig = require("lspconfig")

-- Function for keymaps + capabilities
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts)
end

-- Capabilities for autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup servers
local servers = { "lua_ls", "pyright", "jdtls", "clangd" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- Special Lua config (so nvim config files don’t error)
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

