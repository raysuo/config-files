-- nvim.pack plugin manager
-- Automatically clones plugins into ~/.config/nvim/pack/raysuo/start/

local plugins = {
  -- Fuzzy Finder
  { "nvim-telescope/telescope.nvim", branch = "0.1.8" },
  { "nvim-lua/plenary.nvim" },
  
  -- Colorscheme
  { "folke/tokyonight.nvim" },
  
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter" },
  
  -- Navigation & Utilities
  { "theprimeagen/harpoon" },
  { "mbbill/undotree" },
  { "tpope/vim-fugitive" },
  { "christoomey/vim-tmux-navigator" },
  
  -- LSP & Completion
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  
  -- Obsidian
  { "epwalsh/obsidian.nvim" },
}

local pack_path = vim.fn.stdpath("config") .. "/pack/raysuo/start"

local function clone_plugin(repo, branch)
  local plugin_name = repo:match("([^/]+)$")
  local plugin_dir = pack_path .. "/" .. plugin_name
  
  if vim.fn.isdirectory(plugin_dir) == 0 then
    local cmd = { "git", "clone" }
    if branch then
      table.insert(cmd, "--branch")
      table.insert(cmd, branch)
    end
    table.insert(cmd, "https://github.com/" .. repo .. ".git")
    table.insert(cmd, plugin_dir)
    
    vim.fn.system(cmd)
  end
end

for _, plugin in ipairs(plugins) do
  local repo = plugin[1]
  local branch = plugin.branch
  clone_plugin(repo, branch)
end

-- Build Treesitter after clone
vim.cmd("packadd nvim-treesitter")
vim.cmd("TSUpdate")
