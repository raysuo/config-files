-- ┌─────────────────┐
-- │ Custom Mappings │
-- └─────────────────┘

local nmap = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { noremap = true, silent = true, desc = desc })
end

local vmap = function(lhs, rhs, desc)
    vim.keymap.set('v', lhs, rhs, { noremap = true, silent = true, desc = desc })
end

local imap = function(lhs, rhs, desc)
    vim.keymap.set('i', lhs, rhs, { noremap = true, silent = true, desc = desc })
end

local xmap = function(lhs, rhs, desc)
    vim.keymap.set('x', lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- File explorer
nmap('<leader>pv', vim.cmd.Ex, 'File explorer')

-- Visual mode motions
vmap('J', ":m '>+1<CR>gv=gv", 'Move down')
vmap('K', ":m '<-2<CR>gv=gv", 'Move up')

-- Normal mode motions
nmap('J', 'mzJ`z', 'Join lines')
nmap('<C-d>', '<C-d>zz', 'Down centered')
nmap('<C-u>', '<C-u>zz', 'Up centered')
nmap('n', 'nzzzv', 'Next match centered')
nmap('N', 'Nzzzv', 'Prev match centered')

-- Clipboard operations
xmap('<leader>p', '"_dP', 'Paste over without yanking')
nmap('<leader>y', '"+y', 'Yank to system clipboard')
vmap('<leader>y', '"+y', 'Yank to system clipboard')
nmap('<leader>Y', '"+Y', 'Yank line to system clipboard')
-- nmap('<leader>P', '"+p', 'Paste from system clipboard')
nmap('<leader>d', '"_d', 'Delete without yanking')
vmap('<leader>d', '"_d', 'Delete without yanking')

-- Insert mode
imap('<C-c>', '<Esc>', 'Escape')

-- Disable ex mode
nmap('Q', '<nop>', 'Disable ex mode')

-- Terminal/External commands
nmap('<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', 'New tmux session')

-- Quickfix and location list
nmap('<C-k>', '<cmd>cnext<CR>zz', 'Next quickfix')
nmap('<C-j>', '<cmd>cprev<CR>zz', 'Prev quickfix')
nmap('<leader>k', '<cmd>lnext<CR>zz', 'Next location')
nmap('<leader>j', '<cmd>lprev<CR>zz', 'Prev location')

-- Find and replace word under cursor
nmap('<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Replace word')

-- Make file executable
nmap('<leader>x', '<cmd>!chmod +x %<CR>', 'Make executable')

-- Leader mappings for plugins ================================================

-- Telescope
nmap('<leader>ff', '<cmd>Telescope find_files<CR>', 'Find files')
nmap('<leader>fg', '<cmd>Telescope live_grep<CR>', 'Grep live')
nmap('<leader>fb', '<cmd>Telescope buffers<CR>', 'Find buffers')
nmap('<leader>fh', '<cmd>Telescope help_tags<CR>', 'Find help')

-- Harpoon
nmap('<leader>a', function() require('harpoon.mark').add_file() end, 'Harpoon add')
nmap('<C-e>', function() require('harpoon.ui').toggle_quick_menu() end, 'Harpoon menu')
nmap('<C-h>', function() require('harpoon.ui').nav_file(1) end, 'Harpoon 1')
nmap('<C-t>', function() require('harpoon.ui').nav_file(2) end, 'Harpoon 2')
nmap('<C-n>', function() require('harpoon.ui').nav_file(3) end, 'Harpoon 3')
nmap('<C-s>', function() require('harpoon.ui').nav_file(4) end, 'Harpoon 4')
-- Undotree
nmap('<leader>u', vim.cmd.UndotreeToggle, 'Toggle undotree')

-- Fugitive
nmap('<leader>gs', vim.cmd.Git, 'Git status')

-- LSP
nmap('<leader>ld', '<cmd>lua vim.diagnostic.open_float()<CR>', 'Show diagnostics')
nmap('<leader>lf', '<cmd>lua require("conform").format()<CR>', 'Format')

-- Obsidian
nmap('<leader>on', '<cmd>ObsidianNew<CR>', 'Obsidian new')
nmap('<leader>os', '<cmd>ObsidianSearch<CR>', 'Obsidian search')
nmap('<leader>oo', '<cmd>ObsidianOpen<CR>', 'Obsidian open')
nmap('<leader>fr', '<cmd>Telescope frecency<CR>', 'Frecency (recent files)')
