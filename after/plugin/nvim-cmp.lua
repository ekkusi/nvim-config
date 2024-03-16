local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local types = require("cmp.types")

local function dump_entry_to_file(entry)
    local file = io.open("/tmp/entry_dump.txt", "a")  -- Append to a file for continuous logging
    file:write(vim.inspect(entry, { depth = 2 }))
    file:write("\n\n")  -- Separate entries by newlines for readability
    file:close()
end

local function deprioritize_snippet(entry1, entry2)
  print("deprioritize_snippet")
  dump_entry_to_file(entry1)
  dump_entry_to_file(entry2)
  -- print(vim.inspect(entry1, {depth = 2}))
  -- print(vim.inspect(entry2, {depth = 2}))
  -- print(entry1:get_kind(), entry2:get_kind())
  -- if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then return false end
  -- if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then return true end
  -- Implement custom logic to detect source server
  -- This is hypothetical and depends on the actual content of the entries, which can vary
  local is_tsserver1 = entry1.source.name == 'tsserver'
  local is_tsserver2 = entry2.source.name == 'tsserver'
  -- local is_eslint1 = entry1.source.name == 'eslint'
  -- local is_eslint2 = entry2.source.name == 'eslint'

    -- Prioritize tsserver over eslint
  if is_tsserver1 and not is_tsserver2 then return true end
  if is_tsserver2 and not is_tsserver1 then return false end
end

cmp.setup({
  completion = {
    completeopt = 'menu, menuone, noinsert',
    preselect = cmp.PreselectMode.Item,
  },
  snippet = {
    -- REQUIRED for `nvim-cmp` snippet support. Choose a snippet engine.
    expand = function(args)
      -- For example, using `luasnip`:
      require('luasnip').lsp_expand(args.body)
    end,

  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'path'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  -- formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),

  -- sorting = {
  --   priority_weight = 2,
  --   comparators = {
  --       cmp.config.compare.exact,
  --       cmp.config.compare.offset,
  --       cmp.config.compare.recently_used,
  --   }
  -- },
})
