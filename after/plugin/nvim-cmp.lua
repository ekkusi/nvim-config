local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED for `nvim-cmp` snippet support. Choose a snippet engine.
    expand = function(args)
      -- For example, using `luasnip`:
      require('luasnip').lsp_expand(args.body)
    end,

  },
  -- Remove <C-n> mapping
  mapping = {
    -- Trigger completion with Ctrl-Space in Insert mode
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- Navigate completion items
    -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    -- Add more mappings as needed
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    
    -- Add more sources as needed
  })
})
