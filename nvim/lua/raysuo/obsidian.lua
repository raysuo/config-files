-- Obsidian.nvim Configuration
require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Documents/Obsidian",
    },
  },
  
  -- Optional: customize templates
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
  },
  
  -- Optional: follow links with gf
  follow_url_func = function(url)
    vim.fn.jobstart({ "xdg-open", url })
  end,
})

-- Keymaps
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { noremap = true })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { noremap = true })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { noremap = true })
