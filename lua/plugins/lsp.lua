-- lua/plugins/lsp.lua

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "ruff_lsp",

    "tsserver",
    "eslint",
    "html",
    "cssls",
    "tailwindcss",

    "jsonls",
    "yamlls",
    "bashls",

    "clangd",
    "jdtls",
  },
  automatic_installation = true,
})

local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap.set

  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "gi", vim.lsp.buf.implementation, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Servers WITHOUT special config
local servers = {
  "pyright",
  "ruff_lsp",
  "tsserver",
  "eslint",
  "html",
  "cssls",
  "tailwindcss",
  "jsonls",
  "yamlls",
  "bashls",
  "clangd",
  "jdtls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- Special Lua config
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})

