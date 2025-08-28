-- File: ~/.config/nvim/lua/lsp_config.lua

-- Import the nvim-lspconfig plugin and Mason tools
local lspconfig = require('lspconfig')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

-- Configure Mason to install the servers for you
mason.setup()

-- Configure mason-lspconfig to set up the servers and their handlers in one block
mason_lspconfig.setup({
    -- Here's where you specify the language servers you want to use
    ensure_installed = {
        "rust_analyzer",    -- For Rust
        "pyright",          -- For Python
        "ts_ls",            -- For JavaScript and TypeScript
        "lua_ls"
    },

    -- This is the correct way to specify handlers for the installed servers
    handlers = {
        -- This function will be used for all servers that don't have a specific handler
        function(server_name)
            lspconfig[server_name].setup({
                -- This is a placeholder for custom keybindings or settings
                on_attach = function(client, bufnr)
                    -- For example, setting up completion or formatting keymaps.
                end,
                capabilities = require('cmp_nvim_lsp').default_capabilities() -- Assuming you use nvim-cmp
            })
        end,
    },
})
