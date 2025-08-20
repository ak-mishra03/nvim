local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Neo-tree
map("n", "<C-n>", ":Neotree filesystem reveal left<CR>", opts)
map("n", "<leader>bf", ":Neotree buffers reveal float<CR>", opts)

-- Telescope
local ok, builtin = pcall(require, "telescope.builtin")
if ok then
  map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
  map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
  map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
  map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
end

