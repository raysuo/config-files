-- ┌──────────────────────────────┐
-- │ Markdown Filetype Config     │
-- └──────────────────────────────┘
-- Applied to *.md files

-- Enable spell checking and text wrapping
vim.cmd('setlocal spell wrap')

-- Set text width for automatic wrapping
vim.bo.textwidth = 80

-- Set column width indicator
vim.bo.colorcolumn = '80'
