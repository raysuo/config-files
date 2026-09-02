-- ┌─────────────────────────────┐
-- │ Neovim Config - init.lua    │
-- └─────────────────────────────┘

-- Global config table for sharing data between plugin files
_G.Config = {}

-- Helper to create autocommands
local gr = vim.api.nvim_create_augroup('custom-config', {})
Config.new_autocmd = function(event, pattern, callback, desc)
    local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
    vim.api.nvim_create_autocmd(event, opts)
end

-- ┌──────────────────┐
-- │ Plugin Manager   │
-- └──────────────────┘
-- Uses vim.pack (Neovim 0.12+)

vim.pack.add({
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/theprimeagen/harpoon',
    'https://github.com/mbbill/undotree',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/christoomey/vim-tmux-navigator',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/williamboman/mason.nvim',
    'https://github.com/williamboman/mason-lspconfig.nvim',
    'https://github.com/hrsh7th/nvim-cmp',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/saadparwaiz1/cmp_luasnip',
    'https://github.com/epwalsh/obsidian.nvim',
    'https://github.com/stevearc/conform.nvim',
})

-- Tokyonight colorscheme
vim.cmd('colorscheme tokyonight')
require("lspconfig")

-- Treesitter
local install_dir = vim.fn.stdpath('config') .. '/plugins'
vim.opt.runtimepath:prepend(install_dir)

require 'nvim-treesitter'.setup {
    install_dir = install_dir,
}
