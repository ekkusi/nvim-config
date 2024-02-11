print("hello nvim tree")
local function on_attach(bufnr)
  print("Hello nvim tree attach")
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  -- vim.keymap.del("n", "<C-e", api.node.open.replace_tree_buffer)
  -- vim.keymap.set("n", "<C-E", api.node.open.replace_tree_buffer, opts("Replace buffer with tree"))
  -- vim.keymap.set('n', '<C-w>', api.node.open.replace_tree_buffer, { desc = "Replace buffer with tree", buffer = bufnr, noremap = true, silent = true })

end

vim.keymap.set('n', '<leader>t', function() require('nvim-tree.api').tree.toggle() end, { noremap = true, silent = true })
-- vim.keymap.del('n', '<C-e')
--


-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = on_attach,
  ---
}
