-- ┌────────────────────────┐
-- │ Plugin Configuration   │
-- └────────────────────────┘

-- Treesitter =================================================================
-- Telescope ==================================================================
local telescope = require('telescope')
telescope.setup({
    defaults = {
        sorting_strategy = 'ascending',
        layout_config = {
            horizontal = { prompt_position = 'top' },
        },
    },
})

-- Harpoon ====================================================================
local harpoon = require('harpoon')
harpoon:setup()

-- Undotree (no setup needed, just plugin loaded)

-- Fugitive (no setup needed, just plugin loaded)

-- Mason & LSP Configuration ==================================================
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'pyright', 'rust_analyzer', 'clangd', 'lua_ls' },
    automatic_installation = true,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Set up LSP attach autocommand for common mappings
Config.new_autocmd('LspAttach', nil, function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
end, 'LSP Attach')

-- Completion (nvim-cmp) ======================================================
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
})

-- Formatting (Conform) =======================================================
require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        rust = { 'rustfmt' },
        c = { 'clang-format' },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
    },
})

-- Obsidian ===================================================================
require('obsidian').setup({
    workspaces = {
        {
            name = 'personal',
            path = '~/obsidian',
        },
    },
    templates = {
        subdir = 'templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
    },
    follow_url_func = function(url)
        vim.fn.jobstart({ 'xdg-open', url })
    end,
})

-- LSP Server Configurations ==================================================
-- Python
vim.lsp.config("pyright", {
    capabilities = capabilities,
})

-- Rust
vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = 'clippy',
            },
        },
    },
})

-- C/C++
vim.lsp.config("clangd", {
    capabilities = capabilities,
})

-- Lua
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})
