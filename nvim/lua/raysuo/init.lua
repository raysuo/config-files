require("raysuo.remap")
require("raysuo.set")
require("raysuo.pack")      -- Replace lazy.lua with pack.lua
require("raysuo.lsp")       -- New: LSP configuration
require("raysuo.obsidian")  -- New: Obsidian configuration

-- Tokyonight colorscheme
vim.cmd([[colorscheme tokyonight]])

-- Treesitter setup
require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "python", "rust", "c", "vim", "bash" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

-- Telescope setup
local telescope = require("telescope")
telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = "top" },
    },
  },
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Harpoon setup
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
