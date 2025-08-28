-- File: ~/.config/nvim/lua/cmp_config.lua

local cmp = require('cmp')
local luasnip = require('luasnip')

-- Setup nvim-cmp
cmp.setup({
  snippet = {
    -- Required for completion with snippets (e.g., from LuaSnip)
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- This is the source for LSP completions
    { name = 'luasnip' },  -- This is the source for snippets
  }, {
    { name = 'buffer' },   -- Fallback to buffer-based completion
  })
})
